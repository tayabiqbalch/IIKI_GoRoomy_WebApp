using IIKI.BaseApp.Business.Objects;
using IIKI.GoRoomy.WebApi.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IIKI.GoRoomy.WebApi.Utility
{
    public static class CommonIdentity
    {
        public static async Task<string> RegisterNewIdentityUser(string UserEmail, string RoleName, string Password, string PhoneNo = null, long CompanyId = 0, long BranchId = 0, string UserName = null)
        {
            try
            {
                string errors = "";
                var UserManager =
                       new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));


                var userExist = UserManager.FindByName(UserEmail);
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
                var result = await UserManager.CreateAsync(user, Password);
                if (result.Succeeded)
                {
                    string phoneCode = await UserManager.GenerateChangePhoneNumberTokenAsync(user.Id, user.PhoneNumber);
                    await ApplicationRoleHelper.EnsureRoleCreated(RoleName);
                    result = await UserManager.AddToRoleAsync(user.Id, RoleName);
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

        public static bool DeleteUser(out List<string> errors, bool isByEmail = false, string email = null,
            string userId = null)
        {
            errors = new List<string>();
            try
            {
                ApplicationUser user = null;
                var userManager =
                    new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
                if (isByEmail)
                {
                    if (email == null)
                        throw new ArgumentNullException("Email address cannot be null, if IsByEmail is set to true.");
                    user = userManager.FindByEmail(userId);
                }
                if (!isByEmail)
                {
                    if (userId == null)
                        throw new ArgumentNullException("UserId cannot be null, if IsByEmail is set to false.");
                    user = userManager.FindById(userId);
                }

                if (user == null)
                    throw new NullReferenceException("User not found");

                var roles = userManager.GetRoles(userId);
                if (roles.Count > 0)
                {
                    string[] strings = new string[roles.Count];
                    roles.CopyTo(strings, 0);
                    userManager.RemoveFromRoles(userId, strings);
                }
                var result = userManager.Delete(user);
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

        public static async Task<string> GetUserIdByEmailAsync(string email)
        {
            var userManager =
                new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user = await userManager.FindByEmailAsync(email);
            return user != null ? user.Id : null;
        }

        public static string GetUserIdByEmail(string email)
        {
            var userManager =
                new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user = userManager.FindByEmail(email);
            return user != null ? user.Id : null;
        }

        public static async Task<string> GetUserIdByUsername(string username)
        {
            var userManager =
                new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user = await userManager.FindByNameAsync(username);
            return user != null ? user.Id : null;
        }

        public static bool AssignUserRole(string userId, string role, string oldRoleName)
        {
            var userManager =
                new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            userManager.RemoveFromRole(userId, oldRoleName);
            var result = userManager.AddToRole(userId, role);
            if (result.Succeeded)
                return true;
            return false;
        }

        public static async Task<string> SetUserInfo(SetUserInfoViewModel model)
        {
            try
            {
                var UserManager =
               new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
                var currentUser = await UserManager.FindByIdAsync(model.UserId);
                if (!string.IsNullOrEmpty(model.Email))
                    currentUser.Email = model.Email;
                if (!string.IsNullOrEmpty(model.UserName))
                    currentUser.UserName = model.UserName;

                var result = await UserManager.UpdateAsync(currentUser);

                if (!result.Succeeded)
                {
                    return ReturnIdentityResultString(result);
                }

                if (!string.IsNullOrEmpty(model.NewPassword))
                {
                    if (UserManager.HasPassword(model.UserId))
                    {
                        result = await UserManager.RemovePasswordAsync(model.UserId);
                        if (result.Succeeded)
                        {
                            result = await UserManager.AddPasswordAsync(model.UserId, model.NewPassword);
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
                        result = await UserManager.AddPasswordAsync(model.UserId, model.NewPassword);
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

        private static string ReturnIdentityResultString(IdentityResult result)
        {
            string errors = "";
            foreach (var error in result.Errors)
            {
                errors += error + "|";
            }
            return errors;
        }

        public static async Task<string> SetNewPassword(SetUserInfoViewModel model)
        {
            try
            {
                var UserManager =
               new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
                var currentUser = await UserManager.FindByIdAsync(model.UserId);

                var result = new IdentityResult();

                if (!string.IsNullOrEmpty(model.NewPassword))
                {
                    if (UserManager.HasPassword(model.UserId))
                    {
                        result = await UserManager.RemovePasswordAsync(model.UserId);
                        if (result.Succeeded)
                        {
                            result = await UserManager.AddPasswordAsync(model.UserId, model.NewPassword);
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
                        result = await UserManager.AddPasswordAsync(model.UserId, model.NewPassword);
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