using IIKI.GoRoomy.WebApp.Models;
using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Common;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using IIKI.BaseApp.Business.Objects.BaseAppModel;
using Newtonsoft.Json;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    [Authorize]
    public class AccountController : WebAppBaseController
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public AccountController()
        {
        }

        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }



        ////GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View(new LoginViewModel());
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            try
            {

                // Store timezone in session
                var timeZone = JsonConvert.DeserializeObject<TimeZoneDetails>(model.SystemTimeZoneId);
                Session["IIKI_LocalTimezone"] = timeZone;
                // Store timezone in cookie (expires in 1 year)
                Response.Cookies.Add(new HttpCookie("IIKI_LocalTimezone", model.SystemTimeZoneId)
                {
                    Expires = DateTime.Now.AddYears(1),   // Cookie will expire in 1 year
                    HttpOnly = true,                      // For security: cookie can't be accessed by JavaScript
                    Secure = Request.IsSecureConnection,  // Only send cookie over HTTPS if connection is secure
                    SameSite = SameSiteMode.Strict       // SameSite for added security in modern browsers
                });

                //// This doesn't count login failures towards account lockout
                //// To enable password failures to trigger account lockout, change to shouldLockout: true
                //var result = await SignInManager.PasswordSignInAsync(model.Email, model.Password, model.RememberMe, shouldLockout: false);
                var user = UserManager.FindByEmail(model.Email);
                string UserIPAddress = Request.UserHostAddress;
                Logger.LogRelativeMessage("Inside Login model.Email=" + model.Email + "::::UserIPAddress" + UserIPAddress + "::::returnUrl" + returnUrl);
                LoginUser loginUser = UsersProfileBAL.SaveLoginAttempt(user.Id, user.Email, model.Password, model.RememberMe, UserIPAddress, returnUrl, Request);

                if (loginUser == null)
                {
                    ModelState.AddModelError("", "Invalid login attempt.");
                    return View(model);
                }
                Logger.LogRelativeMessage("Inside Login loginUser.Id=" + loginUser.Id);
                var roles = UserManager.GetRoles(user.Id);

                var result = SignInStatus.Failure;

                if (loginUser.UserRoleName != "SuperAdmin" && loginUser.UserRoleName != "Admin")
                {
                    if (loginUser != null && !(loginUser.EmailConfirmed))
                    {
                        ViewBag.Email = loginUser.Email;
                        ViewBag.IsFromLogin = true;
                        return View("EmailConfirmationRequired");
                    }
                    ////if (loginUser != null && !loginUser.PhoneNumberConfirmed)
                    ////{
                    ////    TempData["phoneNumber"] = loginUser.PhoneNumber;
                    ////    TempData["UserId"] = loginUser.Id;
                    ////    Session["UserToVerifyPhoneNumber"] = loginUser.Id;
                    ////    Session["NumberToVerifyPhoneNumber"] = loginUser.PhoneNumber;
                    ////    return RedirectToAction("PhoneNumberNotVerified");
                    ////}
                    // This doesn't count login failures towards account lockout
                    // To enable password failures to trigger account lockout, change to shouldLockout: true
                    result = await SignInManager.PasswordSignInAsync(model.Email, model.Password, model.RememberMe, shouldLockout: false);
                    //var userInfo = CurrentUser.UserId;
                }
                else
                {

                    result = await SignInManager.PasswordSignInAsync(model.Email, model.Password, model.RememberMe, shouldLockout: false);

                }
                switch (result)
                {
                    case SignInStatus.Success:
                        {
                            return RedirectToAction("Index", "Dashboard", new { area = "" });
                            //if (!loginUser.UserRoleName.Equals("SuperAdmin") && !loginUser.UserRoleName.Equals("Admin"))
                            //{
                            //    return RedirectToLocal(returnUrl);
                            //}
                            //else if (!loginUser.UserRoleName.Equals("SuperAdmin") && loginUser.UserRoleName.Equals("Admin"))
                            //{
                            //    return RedirectToAction("Index", "Dashboard", new { area = "Admin" });
                            //}
                            //else if (loginUser.UserRoleName.Equals("SuperAdmin"))
                            //{
                            //    return RedirectToAction("Index", "Dashboard", new { area = "SuperAdmin" });
                            //}
                            //else
                            //{
                            //    ModelState.AddModelError("", "Role not defined.");
                            //    return View(model);
                            //}
                        }
                    case SignInStatus.LockedOut:
                        return View("Lockout");
                    case SignInStatus.RequiresVerification:
                        return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = model.RememberMe });
                    case SignInStatus.Failure:
                    default:
                        ModelState.AddModelError("", "Invalid login attempt.");
                        return View(model);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //
        // GET: /Account/VerifyCode
        [AllowAnonymous]
        public async Task<ActionResult> VerifyCode(string provider, string returnUrl, bool rememberMe)
        {
            // Require that the user has already logged in via username/password or external login
            if (!await SignInManager.HasBeenVerifiedAsync())
            {
                return View("Error");
            }
            return View(new VerifyCodeViewModel { Provider = provider, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/VerifyCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> VerifyCode(VerifyCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            // The following code protects for brute force attacks against the two factor codes. 
            // If a user enters incorrect codes for a specified amount of time then the user account 
            // will be locked out for a specified amount of time. 
            // You can configure the account lockout settings in IdentityConfig
            var result = await SignInManager.TwoFactorSignInAsync(model.Provider, model.Code, isPersistent: model.RememberMe, rememberBrowser: model.RememberBrowser);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(model.ReturnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "Invalid code.");
                    return View(model);
            }
        }
        //
        // GET: /Account/Register
        [Authorize]
        public ActionResult AddEditUser(string Id = null)
        {
            try
            {
                var obj = UsersProfileBAL.GetUserInfo(Id);
                ViewBag.Title = IIKI.BaseApp.Localization.Resources.CommonLabels.TitleCreate;
                if (string.IsNullOrEmpty(Id))
                {
                    ViewBag.Title = IIKI.BaseApp.Localization.Resources.CommonLabels.TitleEdit;
                    //obj.IsActive = obj.RecordStatus == 1 ? true : false;
                }
                else
                {
                    //obj.IsActive = true;
                }
                List<Country> Countries = CountryBAL.GetList();
                ViewBag.CountriesList = Countries;
                ViewBag.PhoneCodes = Countries;

                return View();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        //
        // GET: /Account/Register
        [Authorize]
        public ActionResult Register()
        {
            List<Country> Countries = CountryBAL.GetList();

            ViewBag.CountriesList = Countries;
            ViewBag.PhoneCodes = Countries;

            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            try
            {


                List<Country> Countries;
                if (ModelState.IsValid)
                {
                    if (await RegisterNewUser(model))
                    {
                        return RedirectToAction("Index", "ManageUsers");
                    }
                }
                Countries = CountryBAL.GetList();
                ViewBag.CountriesList = Countries;
                ViewBag.PhoneCodes = Countries;
                // If we got this far, something failed, redisplay form
                return View(model);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private async Task<bool> RegisterNewUser(RegisterViewModel model)
        {
            try
            {
                bool CaptchaVerified = false;
                if (Convert.ToBoolean(IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("VerifyCaptcha")))
                {
                    if (Request.Params["g-recaptcha-response"] != null && !string.IsNullOrWhiteSpace(Request.Params["g-recaptcha-response"]))
                    {
                        if (await CommonBAL.VerifyReCaptcha(Request.Params["g-recaptcha-response"], IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("reCaptchaSecretKey"), IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("reCaptchaURL")))
                        {
                            CaptchaVerified = true;
                        }
                    }


                    if (!CaptchaVerified)
                    {

                        IdentityResult result = new IdentityResult(new string[] { "Captcha could not be Verified. Please Re-Check Captcha and try again." });
                        AddErrors(result);
                        return false;
                    }
                }
                if (CaptchaVerified || !Convert.ToBoolean(IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("VerifyCaptcha")))
                {
                    var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                    var result = await UserManager.CreateAsync(user, model.Password);
                    if (result.Succeeded)
                    {

                        string phoneCode = await UserManager.GenerateChangePhoneNumberTokenAsync(user.Id, user.PhoneNumber);
                        await ApplicationRoleHelper.EnsureRoleCreated(model.RoleName, 1, 1);
                        result = await UserManager.AddToRoleAsync(user.Id, model.RoleName);
                        if (result.Succeeded)
                        {
                            if (UsersProfileBAL.AddUserInformation(user.Id, 0, 0, 0) > 0)
                            {
                                //await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);

                                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                                // Send an email with this link
                                // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                                // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                                // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");

                                return true;
                            }
                        }
                        AddErrors(result);
                    }
                    AddErrors(result);
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public List<Country> GetCountries()
        {
            string IP = Request.UserHostAddress;
            try
            {
                IP = GetLocalIPAddress();
            }
            catch (Exception)
            {

            }

            long id = 0;
            string name = string.Empty;
            string phoneCode = string.Empty;
            string CountryName = "United Kingdom";

            try
            {
                CountryName = GetCountryByIP(IP);
            }
            catch (Exception)
            {

            }

            var Countries = CountryBAL.GetList();

            foreach (var item in Countries)
            {
                name = item.CountryName;
                if (name == CountryName)
                {
                    id = item.Id;
                    phoneCode = item.PhoneCode;
                    break;
                }
            }
            Countries.RemoveAll(x => x.Id == id);

            Countries.Insert(0, new Country { Id = id, CountryName = CountryName, IsActive = true, PhoneCode = phoneCode });

            return Countries;
        }

        public string IPRequestHelper(string url)
        {
            try
            {
                string checkURL = url;
                HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);
                HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
                StreamReader responseStream = new StreamReader(objResponse.GetResponseStream());
                string responseRead = responseStream.ReadToEnd();
                responseRead = responseRead.Replace("\n", String.Empty);
                responseStream.Close();
                responseStream.Dispose();
                return responseRead;
            }
            catch (Exception)
            {
                return Request.UserHostAddress;
            }
        }
        public string GetCountryByIP(string ipAddress)
        {
            try
            {
                string strReturnVal;
                string ipResponse = IPRequestHelper("http://ip-api.com/xml/" + ipAddress);

                //return ipResponse;
                XmlDocument ipInfoXML = new XmlDocument();
                ipInfoXML.LoadXml(ipResponse);
                XmlNodeList responseXML = ipInfoXML.GetElementsByTagName("query");

                NameValueCollection dataXML = new NameValueCollection();

                dataXML.Add(responseXML.Item(0).ChildNodes[2].InnerText, responseXML.Item(0).ChildNodes[2].Value);

                strReturnVal = responseXML.Item(0).ChildNodes[1].InnerText.ToString(); // Contry
                                                                                       //strReturnVal += "(" +responseXML.Item(0).ChildNodes[2].InnerText.ToString() + ")";  // Contry Code 
                return strReturnVal;
            }
            catch (Exception)
            {
                return "United Kingdom";
            }
        }



        //
        // GET: /Account/ConfirmEmail
        [AllowAnonymous]
        public async Task<ActionResult> ConfirmEmail(string userId, string code)
        {
            if (userId == null || code == null)
            {
                return View("Error");
            }
            var result = await UserManager.ConfirmEmailAsync(userId, code);
            return View(result.Succeeded ? "ConfirmEmail" : "Error");
        }

        //
        // GET: /Account/ForgotPassword
        [AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        //
        // POST: /Account/ForgotPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ForgotPassword(ForgotPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await UserManager.FindByNameAsync(model.Email);
                if (user == null || !(await UserManager.IsEmailConfirmedAsync(user.Id)))
                {
                    // Don't reveal that the user does not exist or is not confirmed
                    return View("ForgotPasswordConfirmation");
                }

                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                // Send an email with this link
                // string code = await UserManager.GeneratePasswordResetTokenAsync(user.Id);
                // var callbackUrl = Url.Action("ResetPassword", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);		
                // await UserManager.SendEmailAsync(user.Id, "Reset Password", "Please reset your password by clicking <a href=\"" + callbackUrl + "\">here</a>");
                // return RedirectToAction("ForgotPasswordConfirmation", "Account");
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ForgotPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ForgotPasswordConfirmation()
        {
            return View();
        }

        //
        // GET: /Account/ResetPassword
        [AllowAnonymous]
        public ActionResult ResetPassword(string code)
        {
            return code == null ? View("Error") : View();
        }

        //
        // POST: /Account/ResetPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var user = await UserManager.FindByNameAsync(model.Email);
            if (user == null)
            {
                // Don't reveal that the user does not exist
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            var result = await UserManager.ResetPasswordAsync(user.Id, model.Code, model.Password);
            if (result.Succeeded)
            {
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            AddErrors(result);
            return View();
        }

        //
        // GET: /Account/ResetPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ResetPasswordConfirmation()
        {
            return View();
        }

        //
        // POST: /Account/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            // Request a redirect to the external login provider
            return new ChallengeResult(provider, Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/SendCode
        [AllowAnonymous]
        public async Task<ActionResult> SendCode(string returnUrl, bool rememberMe)
        {
            var userId = await SignInManager.GetVerifiedUserIdAsync();
            if (userId == null)
            {
                return View("Error");
            }
            var userFactors = await UserManager.GetValidTwoFactorProvidersAsync(userId);
            var factorOptions = userFactors.Select(purpose => new SelectListItem { Text = purpose, Value = purpose }).ToList();
            return View(new SendCodeViewModel { Providers = factorOptions, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/SendCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SendCode(SendCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            // Generate the token and send it
            if (!await SignInManager.SendTwoFactorCodeAsync(model.SelectedProvider))
            {
                return View("Error");
            }
            return RedirectToAction("VerifyCode", new { Provider = model.SelectedProvider, ReturnUrl = model.ReturnUrl, RememberMe = model.RememberMe });
        }

        //
        // GET: /Account/ExternalLoginCallback
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                return RedirectToAction("Login");
            }

            // Sign in the user with this external login provider if the user already has a login
            var result = await SignInManager.ExternalSignInAsync(loginInfo, isPersistent: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(returnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = false });
                case SignInStatus.Failure:
                default:
                    // If the user does not have an account, then prompt the user to create an account
                    ViewBag.ReturnUrl = returnUrl;
                    ViewBag.LoginProvider = loginInfo.Login.LoginProvider;
                    return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { Email = loginInfo.Email });
            }
        }

        //
        // POST: /Account/ExternalLoginConfirmation
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Manage");
            }

            if (ModelState.IsValid)
            {
                // Get the information about the user from the external login provider
                var info = await AuthenticationManager.GetExternalLoginInfoAsync();
                if (info == null)
                {
                    return View("ExternalLoginFailure");
                }
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user);
                if (result.Succeeded)
                {
                    result = await UserManager.AddLoginAsync(user.Id, info.Login);
                    if (result.Succeeded)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                        return RedirectToLocal(returnUrl);
                    }
                }
                AddErrors(result);
            }

            ViewBag.ReturnUrl = returnUrl;
            return View(model);
        }

        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Session.Abandon();
            AuthenticationManager.SignOut();
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Index", "Home");
        }

        public ActionResult LogOff(string userId = "")
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Session.Abandon();
            AuthenticationManager.SignOut();
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            return RedirectToAction("Login", "Account");
        }

        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        if (_userManager != null)
        //        {
        //            _userManager.Dispose();
        //            _userManager = null;
        //        }

        //        if (_signInManager != null)
        //        {
        //            _signInManager.Dispose();
        //            _signInManager = null;
        //        }
        //    }

        //    base.Dispose(disposing);
        //}

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }

        internal class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}