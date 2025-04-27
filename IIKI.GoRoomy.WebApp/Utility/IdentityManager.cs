using IIKI.BaseApp.Business.Objects;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Owin.Security.DataProtection;
using IIKI.BaseApp.Business.Methods;
using IIKI.GoRoomy.WebApp.Models;

namespace IIKI.GoRoomy.WebApp.Utility
{
    public class IdentityManager
    {
        private readonly UserManager<ApplicationUser> _userManager;

        public IdentityManager()
        {
            var userStore = new UserStore<ApplicationUser>(new ApplicationDbContext());
            _userManager = new UserManager<ApplicationUser>(userStore)
            {
                // Set password policy
                PasswordValidator = new PasswordValidator
                {
                    RequiredLength = 6,
                    RequireNonLetterOrDigit = true,
                    RequireDigit = true,
                    RequireLowercase = true,
                    RequireUppercase = true,
                }
            };
            // Set username policy
            _userManager.UserValidator = new UserValidator<ApplicationUser>(_userManager)
            {
                AllowOnlyAlphanumericUserNames = true,
                RequireUniqueEmail = true
            };
            // Configure token provider with custom token lifespan
            var provider = new DpapiDataProtectionProvider("YourAppName");
            _userManager.UserTokenProvider = new DataProtectorTokenProvider<ApplicationUser>(provider.Create("EmailConfirmation"))
            {
                TokenLifespan = TimeSpan.FromHours(24) // Set token lifespan to 24 hours
            };
        }

        public async Task<bool> UserExistsAsync(string username, string email)
        {
            var userByName = await _userManager.FindByNameAsync(username);
            var userByEmail = await _userManager.FindByEmailAsync(email);

            return userByName != null || userByEmail != null;
        }
        public async Task<string> CreateUserAsync(RegisterViewModel model)
        {
            try
            {
                string errors = "";

                if (await UserExistsAsync(model.Email, model.Email))
                {
                    errors = "A user with this username or email already exists.";
                    return errors;
                }

                await ApplicationRoleHelper.EnsureRoleCreated(model.RoleName);

                if (string.IsNullOrEmpty(model.UserName))
                {
                    model.UserName = model.Email;
                }

                var user = new ApplicationUser { UserName = model.UserName, Email = model.Email, PhoneNumber = model.PhoneNo };
                var result = await _userManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    await ApplicationRoleHelper.EnsureRoleCreated(model.RoleName, 1, 1);
                    result = await _userManager.AddToRoleAsync(user.Id, model.RoleName);
                    if (result.Succeeded)
                    {
                        // return user.Id;
                        var userProfileID = UsersProfileBAL.AddUserInformation(user.Id, 0, 0, 0);

                        // Generate email confirmation token
                        var code = await _userManager.GenerateEmailConfirmationTokenAsync(user.Id);
                        var callbackUrl = $"{IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("WebPortalURL")}/Account/ConfirmEmail?userId={user.Id}&code={System.Web.HttpUtility.UrlEncode(code)}";
                        string subject = "Confirm your account";
                        string message = $"Please confirm your account by clicking this link: <a href=\"{callbackUrl}\">link</a>";
                        await _userManager.SendEmailAsync(user.Id, subject, message);

                        _userManager.ConfirmEmail(user.Id, code);
                        return user.Id;
                    }
                }
                foreach (var error in result.Errors.ToList())
                {
                    errors += error + Environment.NewLine;
                }
                return errors;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public async Task<string> RegisterNewIdentityUser(string UserEmail, string RoleName, string Password, string PhoneNo = null, long CompanyId = 0, long BranchId = 0, string UserName = null)
        {
            try
            {
                string errors = "";

                var userExist = _userManager.FindByName(UserEmail);
                if (userExist != null)
                {
                    errors = "EmailExist";
                    return userExist.Id;
                }
                if (string.IsNullOrEmpty(UserName))
                {
                    UserName = UserEmail;
                }
                var user = new ApplicationUser { UserName = UserName, Email = UserEmail, EmailConfirmed = true };
                var result = await _userManager.CreateAsync(user, Password);
                if (result.Succeeded)
                {
                    string phoneCode = await _userManager.GenerateChangePhoneNumberTokenAsync(user.Id, user.PhoneNumber);
                    await ApplicationRoleHelper.EnsureRoleCreated(RoleName, 1, 1);
                    result = await _userManager.AddToRoleAsync(user.Id, RoleName);
                    if (result.Succeeded)
                    {
                        return user.Id;
                    }
                    //AddErrors(result);
                }
                //AddErrors(result);
                foreach (var error in result.Errors.ToList())
                {
                    errors += error + Environment.NewLine;
                }

                return "Failed--" + errors;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool DeleteUser(out List<string> errors, bool isByEmail = false, string email = null,
            string userId = null)
        {
            errors = new List<string>();
            try
            {
                ApplicationUser user = null;
                if (isByEmail)
                {
                    if (email == null)
                        throw new ArgumentNullException("Email address cannot be null, if IsByEmail is set to true.");
                    user = _userManager.FindByEmail(userId);
                }
                if (!isByEmail)
                {
                    if (userId == null)
                        throw new ArgumentNullException("UserId cannot be null, if IsByEmail is set to false.");
                    user = _userManager.FindById(userId);
                }

                if (user == null)
                    throw new NullReferenceException("User not found");

                var roles = _userManager.GetRoles(userId);
                if (roles.Count > 0)
                {
                    string[] strings = new string[roles.Count];
                    roles.CopyTo(strings, 0);
                    _userManager.RemoveFromRoles(userId, strings);
                }
                var result = _userManager.Delete(user);
                if (result.Succeeded)
                {
                    return true;
                }
                errors = result.Errors.ToList();
                return false;
            }
            catch (Exception ex)
            {
                errors.Add(ex.Message);
                return false;
            }
        }

        public async Task<string> GetUserIdByEmailAsync(string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            return user != null ? user.Id : null;
        }

        public string GetUserIdByEmail(string email)
        {
            var user = _userManager.FindByEmail(email);
            return user != null ? user.Id : null;
        }

        public async Task<string> GetUserIdByUsername(string username)
        {
            var user = await _userManager.FindByNameAsync(username);
            return user != null ? user.Id : null;
        }

        public bool AssignUserRole(string userId, string role, string oldRoleName)
        {
            _userManager.RemoveFromRole(userId, oldRoleName);
            var result = _userManager.AddToRole(userId, role);
            if (result.Succeeded)
                return true;
            return false;
        }

        public async Task<string> SetUserInfo(SetUserInfoViewModel model)
        {
            try
            {
                var currentUser = await _userManager.FindByIdAsync(model.UserId);
                if (!string.IsNullOrEmpty(model.Email))
                    currentUser.Email = model.Email;
                if (!string.IsNullOrEmpty(model.UserName))
                    currentUser.UserName = model.UserName;

                var result = await _userManager.UpdateAsync(currentUser);

                if (!result.Succeeded)
                {
                    return ReturnIdentityResultString(result);
                }

                if (!string.IsNullOrEmpty(model.NewPassword))
                {
                    if (_userManager.HasPassword(model.UserId))
                    {
                        result = await _userManager.RemovePasswordAsync(model.UserId);
                        if (result.Succeeded)
                        {
                            result = await _userManager.AddPasswordAsync(model.UserId, model.NewPassword);
                            if (!result.Succeeded)
                            {
                                //AddErrors(result);
                                return ReturnIdentityResultString(result);
                                //return "Password not updated, some error accored.";
                            }
                        }
                    }
                    else
                    {
                        result = await _userManager.AddPasswordAsync(model.UserId, model.NewPassword);
                        if (!result.Succeeded)
                        {
                            return ReturnIdentityResultString(result);
                            //return "Password not updated, some error accored.";
                        }
                    }
                }
                return "Saved";

            }
            catch (Exception ex)
            {
                return ex.Message;
                // throw ex;
            }
        }

        private string ReturnIdentityResultString(IdentityResult result)
        {
            string errors = "";
            foreach (var error in result.Errors)
            {
                errors += error + "|";
            }
            return errors;
        }

        public async Task<string> SetNewPassword(SetUserInfoViewModel model)
        {
            try
            {
                var currentUser = await _userManager.FindByIdAsync(model.UserId);

                var result = new IdentityResult();

                if (!string.IsNullOrEmpty(model.NewPassword))
                {
                    if (_userManager.HasPassword(model.UserId))
                    {
                        result = await _userManager.RemovePasswordAsync(model.UserId);
                        if (result.Succeeded)
                        {
                            result = await _userManager.AddPasswordAsync(model.UserId, model.NewPassword);
                            if (!result.Succeeded)
                            {
                                //AddErrors(result);
                                return ReturnIdentityResultString(result);
                                //return "Password not updated, some error accored.";
                            }
                        }
                    }
                    else
                    {
                        result = await _userManager.AddPasswordAsync(model.UserId, model.NewPassword);
                        if (!result.Succeeded)
                        {
                            return ReturnIdentityResultString(result);
                            //return "Password not updated, some error accored.";
                        }
                    }
                }
                return "Saved";

            }
            catch (Exception ex)
            {
                return ex.Message;
                // throw ex;
            }
        }

    }
}