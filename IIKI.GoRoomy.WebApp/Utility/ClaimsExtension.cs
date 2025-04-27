using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Common;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Web;

namespace IIKI.GoRoomy.WebApp.Utility
{
    public static class ClaimsExtension
    {
        public static string GetSessionUserId(this ClaimsIdentity claimIdentity)
        {
            var userInfo = claimIdentity.GetUserInfo();
            return userInfo.SessionUserId;
        }

        public static void SetSessionUserId(this ClaimsIdentity claimIdentity, string SessionUserId = null)
        {
            UserInfo user = claimIdentity.GetUserInfo();
            user.SessionUserId = SessionUserId;
            claimIdentity.SetUserInfo(user);
        }

        public static string GetMainUserId(this ClaimsIdentity claimIdentity)
        {
            var userInfo = claimIdentity.GetUserInfo();
            return userInfo.UserId;
        }

        public static void SetMainUserId(this ClaimsIdentity claimIdentity, string MainUserId = null)
        {
            UserInfo user = claimIdentity.GetUserInfo();
            user.MainUserId = MainUserId;
            claimIdentity.SetUserInfo(user);
        }

        public static string GetSessionAdminUserId(this ClaimsIdentity claimIdentity)
        {
            var userInfo = claimIdentity.GetUserInfo();
            return userInfo.SessionAdminUserId;
        }

        public static void SetSessionAdminUserId(this ClaimsIdentity claimIdentity, string SessionAdminUserId = null)
        {
            UserInfo user = claimIdentity.GetUserInfo();
            user.SessionAdminUserId = SessionAdminUserId;
            claimIdentity.SetUserInfo(user);
        }

        public static string GetRoleName(this ClaimsIdentity claimIdentity)
        {
            return claimIdentity.GetClaimValue(ClaimTypes.Role, ClaimValueTypes.String);
        }

        public static string GetUserId(this ClaimsIdentity claimIdentity)
        {
            return claimIdentity.GetClaimValue(ClaimTypes.NameIdentifier, ClaimValueTypes.String);
        }

        public static string GetUserName(this ClaimsIdentity claimIdentity)
        {
            return claimIdentity.Name;
        }

        public static string GetUserEmail(this ClaimsIdentity claimIdentity)
        {
            return claimIdentity.GetClaimValue(ClaimTypes.Email, ClaimValueTypes.String);
        }

        public static async System.Threading.Tasks.Task<string> GetRoleId(this ClaimsIdentity claimIdentity)
        {
            var userInfo = claimIdentity.GetUserInfo();
            return !string.IsNullOrWhiteSpace(userInfo.RoleId)
                ? userInfo.RoleId
                : await ApplicationRoleHelper.GetRoleId(roleName: claimIdentity.GetRoleName());
        }

        public static void SetRoleId(this ClaimsIdentity claimIdentity, string RoleId = null)
        {
            UserInfo user = claimIdentity.GetUserInfo();
            user.RoleId = RoleId;
            claimIdentity.SetUserInfo(user);
        }

        public static UserInfo GetUserInfo(this ClaimsIdentity claimIdentity)
        {
            string claimType = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AppCurrentUserClaimType");

            if (isClaimStore())
            {
                string claimVal = claimIdentity.GetClaimValue(claimType, "UserInfo");
                if (!string.IsNullOrWhiteSpace(claimVal))
                {
                    return JsonConvert.DeserializeObject<UserInfo>(claimVal);
                }
            }
            else
            {
                object sessionVal = GetSessionValue(claimType);
                if (sessionVal != null)
                {
                    return sessionVal as UserInfo ?? new UserInfo();
                }
            }

            return new UserInfo();
        }

        public static void SetUserInfo(this ClaimsIdentity claimIdentity, UserInfo user = null)
        {
            if (user.UserId == null)
            {
                return;
            }

            user.SessionUserId = user.UserId;

            user.UserResourcesPath = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("ProfileImagesPath");

            if (user.RoleName == "SuperAdmin")
            {
                user.SessionAdminUserId = user.UserId;
            }

            string claimType = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AppCurrentUserClaimType");

            if (isClaimStore())
            {
                claimIdentity.SetClaimValue(claimType, JsonConvert.SerializeObject(user), "UserInfo");
            }
            else
            {
                SetSessionValue(claimType, user);
            }
        }

        public static string SessionId(this ClaimsIdentity claimIdentity)
        {
            string claimType = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AppSessionClaimType");

            string claimVal = isClaimStore()
                ? (claimIdentity.GetClaimValue(claimType, "string")?.ToString())
                : (GetSessionValue(claimType)?.ToString());
            if (!string.IsNullOrWhiteSpace(claimVal))
            {
                return null;
            }
            else
            {
                string SId = Guid.NewGuid().ToString();
                if (isClaimStore())
                {
                    claimIdentity.SetClaimValue(claimType, SId, "string");
                }
                else
                {
                    SetSessionValue(claimType, SId);
                }

                return SId;
            }
        }

        public static UserInfo RetrieveUserInfo(string pUserId, string pUserEmail, string pMainUserId, string pUserRoleName, string sessionID = null, string websiteID = null, bool addSession = false, string loginAttemptId = null)
        {
            try
            {
                return UsersProfileBAL.GetUserInfo(pUserId, pUserEmail, pMainUserId, pUserRoleName, sessionID, websiteID, addSession, loginAttemptId);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static string TempAdminUserId
        {
            get => GetSessionString("TempAdminUserId");
            set => SetSessionString("TempAdminUserId", value);

        }

        public static string TempSessionId
        {
            get => GetSessionString("TempSessionId");
            set => SetSessionString("TempSessionId", value);

        }

        public static string TempMainUserId
        {
            get => GetSessionString("TempMainUserId");
            set => SetSessionString("TempMainUserId", value);

        }

        public static string TempRoleId
        {
            get => GetSessionString("TempRoleId");
            set => SetSessionString("TempRoleId", value);

        }

        public static string TempRoleName
        {
            get => GetSessionString("TempRoleName");
            set => SetSessionString("TempRoleName", value);
        }

        public static string TempEmail
        {
            get => GetSessionString("TempEmail");
            set => SetSessionString("TempEmail", value);
        }

        public static string LoginAttemptId
        {
            get => GetSessionString("LoginAttemptId");
            set => SetSessionString("LoginAttemptId", value);
        }

        public static UserInfo InitializeUserSession(this ClaimsIdentity claimIdentity, string pUserId, string pUserEmail, string pUserRoleName, string adminUserId = null, string mainUserId = null, string roleId = null, string sessionID = null, string websiteID = null, bool addSession = false, string loginAttemptId = null)
        {
            try
            {
                UserInfo CurrentUser = RetrieveUserInfo(pUserId, pUserEmail, mainUserId, pUserRoleName, sessionID, websiteID, addSession, loginAttemptId);
                CurrentUser.MainUserId = !string.IsNullOrEmpty(roleId) ? mainUserId : CurrentUser.MainUserId;
                CurrentUser.SessionAdminUserId = !string.IsNullOrEmpty(roleId) ? adminUserId : CurrentUser.SessionAdminUserId;
                CurrentUser.RoleId = !string.IsNullOrEmpty(roleId) ? roleId : CurrentUser.RoleId;
                claimIdentity.SetUserInfo(CurrentUser);
                return CurrentUser;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static bool IsNavigationClaimValid(this ClaimsIdentity claimIdentity, string pArea)
        {
            try
            {
                var userInfo = claimIdentity.GetUserInfo();
                string claimType = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AppMenuClaimType") + pArea;
                if (isClaimStore())
                {
                    string claimVal = claimIdentity.GetClaimValue(claimType, "List<Navigation>");
                    if (string.IsNullOrWhiteSpace(claimVal))
                    {
                        return true;
                    }
                }
                else
                {
                    if (!SessionValueExists(claimType))
                    {
                        return true;
                    }
                }
                List<HasPermissions> p = UserPermissionsBAL.GetPermissions(userInfo.UserId, userInfo.MainUserId, userInfo.RoleId, null);
                return p.Count <= 0 || p[0].ModulesAssigned != userInfo.ModulesAssigned || p[0].RightsAssigned != userInfo.RightsAssigned;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static void AddNavigationClaim(this ClaimsIdentity claimIdentity, string pArea)
        {
            try
            {
                List<UserNavigation> lMenu;
                var userInfo = claimIdentity.GetUserInfo();
                lMenu = UserPermissionsBAL.GetMenu(userInfo.UserId, userInfo.MainUserId, userInfo.RoleId, pArea);

                if (lMenu != null && lMenu.Count > 0)
                {
                    string claimType = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AppMenuClaimType") + pArea;

                    if (isClaimStore())
                    {
                        claimIdentity.SetClaimValue(claimType, Newtonsoft.Json.JsonConvert.SerializeObject(lMenu), "List<Navigation>");
                    }
                    else
                    {
                        SetSessionValue(claimType, lMenu);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static void AddRightsClaim(this ClaimsIdentity claimIdentity)
        {
            try
            {
                List<AreaRule> lAreaRule;
                var userInfo = claimIdentity.GetUserInfo();
                lAreaRule = UserPermissionsBAL.GetAreaRulesList(userInfo.UserId, userInfo.MainUserId, userInfo.RoleId, -1, -1, 1);

                if (lAreaRule != null && lAreaRule.Count > 0)
                {
                    string claimType = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AppPermissionsClaimType");

                    if (isClaimStore())
                    {
                        claimIdentity.SetClaimValue(claimType, Newtonsoft.Json.JsonConvert.SerializeObject(lAreaRule), "List<AreaRule>");
                    }
                    else
                    {
                        SetSessionValue(claimType, lAreaRule);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static List<AreaRule> GetRightsClaim(this ClaimsIdentity claimIdentity)
        {
            string claimType = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AppPermissionsClaimType");
            if (isClaimStore())
            {
                string claimVal = claimIdentity.GetClaimValue(claimType, "List<AreaRule>");
                if (!string.IsNullOrWhiteSpace(claimVal))
                {
                    return Newtonsoft.Json.JsonConvert.DeserializeObject<List<AreaRule>>(claimVal);
                }
            }
            else
            {
                object sessionVal = GetSessionValue(claimType);
                if (sessionVal != null)
                {
                    return sessionVal as List<AreaRule> ?? new List<AreaRule>();
                }
            }
            return null;
        }

        public static int HasPermissionCalim(this ClaimsIdentity claimIdentity, string areaRuleCode)
        {
            try
            {
                List<AreaRule> lAreaRules = claimIdentity.GetRightsClaim();
                return lAreaRules == null || lAreaRules.Count <= 0 ? -1 : lAreaRules.FindIndex(AreaRule.ByRuleCode(areaRuleCode));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<UserNavigation> GetNavigationClaim(this ClaimsIdentity claimIdentity, string pArea)
        {
            try
            {
                string claimType = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AppMenuClaimType") + pArea;
                if (isClaimStore())
                {
                    string claimVal = claimIdentity.GetClaimValue(claimType, "List<Navigation>");
                    if (!string.IsNullOrWhiteSpace(claimVal))
                    {
                        return Newtonsoft.Json.JsonConvert.DeserializeObject<List<UserNavigation>>(claimVal);
                    }
                    else if (claimIdentity.IsNavigationClaimValid(pArea))
                    {
                        claimIdentity.AddNavigationClaim(pArea);
                        claimIdentity.AddRightsClaim();
                    }
                }
                else
                {
                    object sessionVal = GetSessionValue(claimType);
                    if (sessionVal != null)
                    {
                        return sessionVal as List<UserNavigation> ?? new List<UserNavigation>();
                    }
                    else if (claimIdentity.IsNavigationClaimValid(pArea))
                    {
                        claimIdentity.AddNavigationClaim(pArea);
                        claimIdentity.AddRightsClaim();
                    }
                }
                return null;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static string GetProfileImage(this ClaimsIdentity claimIdentity)
        {
            try
            {


                var userInfo = claimIdentity.GetUserInfo();
                var oUserProfileInfo = UsersProfileBAL.GetUserInfo(userInfo.UserId, userInfo.UserEmail, null, userInfo.RoleName);


                return !string.IsNullOrEmpty(oUserProfileInfo.ContactImage)
                    ? GetProfileImage(userInfo, oUserProfileInfo.ContactImage)
                    : "/Images/profile.png";
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static string GetProfileImage(UserInfo user, string profileImage)
        {
            string ActualURL = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("ProfileImagesPath") + "/" + user.ContactId + "/";
            string ImagePath = ActualURL.Replace("~", "") + profileImage;
            return System.IO.File.Exists(System.Web.HttpContext.Current.Server.MapPath(ImagePath)) ? ImagePath : "/Images/profile.png";
        }
        public static string GetUserFullName(this ClaimsIdentity claimIdentity)
        {
            try
            {
                var userInfo = claimIdentity.GetUserInfo();
                var oUserProfileInfo = UsersProfileBAL.GetUserInfo(userInfo.UserId, userInfo.UserEmail, null, userInfo.RoleName);
                if (oUserProfileInfo != null)
                {
                    return !string.IsNullOrEmpty(oUserProfileInfo.FullName)
                        ? oUserProfileInfo.FullName
                        : oUserProfileInfo.FirstName + " " + oUserProfileInfo.LastName;
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        private static string GetCurrentUserId(this ClaimsIdentity claimIdentity)
        {
            var userInfo = claimIdentity.GetUserInfo();
            return userInfo.UserId ?? HttpContext.Current.User.Identity.GetUserId();
        }

        public static string GetBaseUrl()
        {
            var request = HttpContext.Current.Request;
            var appUrl = HttpRuntime.AppDomainAppVirtualPath;

            if (appUrl != "/")
            {
                appUrl += "/";
            }

            string baseUrl = string.Format("{0}://{1}{2}", request.Url.Scheme, request.Url.Authority, appUrl);

            return baseUrl;
        }

        /// <summary>
        /// Start of session methods
        /// below methods to get or set session value and clear
        /// </summary>
        private static string GetSessionString(string sessionStringName)
        {
            object sessionVal = GetSessionValue(sessionStringName);
            return sessionVal?.ToString().Trim();

        }

        private static void SetSessionString(string sessionStringName, string sessionStringValue)
        {
            SetSessionValue(sessionStringName, sessionStringValue);
        }

        private static bool SessionContextExists()
        {
            return HttpContext.Current != null && HttpContext.Current.Session != null;
        }

        private static bool SessionValueExists(string sessionStringName)
        {
            return SessionContextExists() && HttpContext.Current.Session.Count > 0 && HttpContext.Current.Session[sessionStringName] != null;
        }

        public static object GetSessionValue(string sessionStringName)
        {
            return SessionValueExists(sessionStringName) ?
                HttpContext.Current.Session[sessionStringName]
                : null;
        }

        public static void SetSessionValue(string sessionStringName, object value)
        {
            if (SessionValueExists(sessionStringName))
            {
                HttpContext.Current.Session.Remove(sessionStringName);
            }
            if (SessionContextExists())
            {
                HttpContext.Current.Session[sessionStringName] = value;
            }
        }

        public static void RemoveSessionValue(string sessionStringName)
        {
            if (SessionValueExists(sessionStringName))
            {
                HttpContext.Current.Session.Remove(sessionStringName);
            }
        }

        public static void ClearSession()
        {
            if (HttpContext.Current != null && HttpContext.Current.Session != null)
            {
                HttpContext.Current.Session.RemoveAll();
            }
        }
        /// <summary>
        /// End of session methods
        /// </summary>


        /// <summary>
        /// Start of claim methods
        /// below methods to get or set claim value and clear
        /// </summary>

        private static void SetClaimValue(this ClaimsIdentity claimIdentity, string claimType, string claimVal, string valueType)
        {
            Claim CurrentClaim = claimIdentity.FindFirst(claimType);
            if (CurrentClaim != null)
            {
                claimIdentity.RemoveClaim(CurrentClaim);
            }
            claimIdentity.AddClaim(new Claim(claimType, claimVal, valueType));
        }

        private static string GetClaimValue(this ClaimsIdentity claimIdentity, string claimType, string valueType)
        {
            Claim currentClaim = claimIdentity.FindFirst(claimType);
            return currentClaim != null && currentClaim.Value != null && (valueType == null || currentClaim.ValueType == valueType)
                ? currentClaim.Value
                : null;
        }

        /// <summary>
        /// End of claim methods
        /// </summary>

        private static bool isClaimStore()
        {
            string userDataStoreType = CommonFunctions.GetConfigurationAppSettings("AppUserDataStoreType");

            return userDataStoreType.Equals("Claim", StringComparison.InvariantCultureIgnoreCase);
        }
    }
}