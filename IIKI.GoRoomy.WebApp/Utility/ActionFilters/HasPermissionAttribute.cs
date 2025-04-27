using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Common;
using Microsoft.AspNet.Identity;
using System;
using System.Configuration;
using System.Security.Claims;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Utility
{
    public class HasPermissionAttribute : ActionFilterAttribute
    {
        private string _permission;

        public HasPermissionAttribute(string permission) => this._permission = permission;

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string UserName = "NOUSER", UserId = "", SessionId = "", RoleName = "User";
            try
            {
                var UserIdentity = ((ClaimsIdentity)filterContext.HttpContext.User.Identity);
                var userInfo = UserIdentity.GetUserInfo();
                if (filterContext != null && filterContext.HttpContext != null && filterContext.HttpContext.User != null && filterContext.HttpContext.User.Identity != null)
                {
                    UserName = filterContext.HttpContext.User.Identity.Name;
                    UserId = filterContext.HttpContext.User.Identity.GetUserId();
                    SessionId = UserIdentity.SessionId();

                    if (filterContext.HttpContext.User.IsInRole("SuperAdmin"))
                    {
                        RoleName = "SuperAdmin";
                    }
                }
                /*Start Temp code
                int i = 0;
                while(i < 500)
                {
                    Logger.LogRelativeMessage("Claim User Id: " + userInfo.UserId + " :: Claim Session User Id: " + userInfo.SessionUserId + " :: Identity User Id: " + filterContext.HttpContext.User.Identity.GetUserId());
                    System.Threading.Thread.Sleep(2000);
                    i++;
                }
                End Temp code*/
                if (filterContext.HttpContext.Request.IsAuthenticated && userInfo.UserId != null)
                {
                    string LoginAttemptId = ClaimsExtension.LoginAttemptId;
                    if (!(UserPermissionsBAL.IsValidUser(userInfo.UserId, UserIdentity.SessionId(), IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("WebsiteID"), LoginAttemptId)))
                    {
                        //using (TextWriter output = File.AppendText(System.Web.Hosting.HostingEnvironment.MapPath("~/bin/PermissionsLog.txt")))
                        {
                            Logger.LogRelativeMessage(("User Invalid due to SessionId :: " + UserName));
                            Logger.LogRelativeMessage(("userInfo.UserId :: " + userInfo.UserId));
                            Logger.LogRelativeMessage(("userInfo.SessionUserId :: " + userInfo.SessionUserId));
                        }
                        // If this user does not have the required permission then redirect to login page
                        var url = new UrlHelper(filterContext.RequestContext);
                        var loginUrl = url.Content("/Account/LogOff?RedirectTo=Login");
                        filterContext.Result = new RedirectResult(loginUrl);
                        //filterContext.HttpContext.Response.Redirect(loginUrl, true);
                        return;
                    }


                }
                else if (filterContext.HttpContext.Request.IsAuthenticated && userInfo.UserId == null)
                {
                    //using (TextWriter output = File.AppendText(System.Web.Hosting.HostingEnvironment.MapPath("~/bin/PermissionsLog.txt")))
                    {
                        Logger.LogRelativeMessage(("User Authenticated but Session NULL :: " + UserName));
                    }

                    ClaimsExtension.ClearSession();
                    //UserIdentity.InitializeSession(UserId, UserName, RoleName, null, SessionId, IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("WebsiteID"), true);
                    UserIdentity.InitializeUserSession(UserId, UserName, RoleName, null, null, null, SessionId, IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("WebsiteID"), true);

                    UserIdentity.GetNavigationClaim("__ALL__");

                    if (userInfo.UserId == null)
                    {
                        // If this user does not have the required permission then redirect to login page
                        var url = new UrlHelper(filterContext.RequestContext);
                        var loginUrl = url.Content("/Account/LogOff?RedirectTo=Login");
                        filterContext.Result = new RedirectResult(loginUrl);
                        //filterContext.HttpContext.Response.Redirect(loginUrl, true);
                        return;
                    }

                }

                if (!(filterContext.HttpContext.Request.IsAuthenticated))
                {
                    //using (TextWriter output = File.AppendText(System.Web.Hosting.HostingEnvironment.MapPath("~/bin/PermissionsLog.txt")))
                    {
                        Logger.LogRelativeMessage(("User not Authenticated :: " + UserName));
                    }
                    // If this user does not have the required permission then redirect to login page
                    var url = new UrlHelper(filterContext.RequestContext);
                    var loginUrl = url.Content("/Account/Login");
                    filterContext.HttpContext.Response.Redirect(loginUrl, true);
                }
                else if (_permission == "GENERALAUTHENTICATION" && (userInfo == null || userInfo.SessionUserId == null || userInfo.SessionUserId.Trim() == ""))
                {
                    //using (TextWriter output = File.AppendText(System.Web.Hosting.HostingEnvironment.MapPath("~/bin/PermissionsLog.txt")))
                    {
                        Logger.LogRelativeMessage(("No GENERALAUTHENTICATION Session :: " + UserName));
                    }
                    // If this user does not have the required permission then redirect to login page
                    var url = new UrlHelper(filterContext.RequestContext);
                    var loginUrl = url.Content("/Account/LogOff?RedirectTo=Login");
                    filterContext.HttpContext.Response.Redirect(loginUrl, true);
                }
                else if (UserIdentity.HasPermissionCalim(_permission) < 0 && _permission != "GENERALAUTHENTICATION")
                {
                    //using (TextWriter output = File.AppendText(System.Web.Hosting.HostingEnvironment.MapPath("~/bin/PermissionsLog.txt")))
                    {
                        Logger.LogRelativeMessage(("Session Permission not Set :: " + UserName));
                    }
                    // If this user does not have the required permission then redirect to login page
                    var url = new UrlHelper(filterContext.RequestContext);
                    var notFoundUrl = url.Content("/Common/Error404");
                    filterContext.HttpContext.Response.Redirect(notFoundUrl, true);
                }
            }
            catch (Exception ex)
            {
                //using (TextWriter output = File.AppendText(System.Web.Hosting.HostingEnvironment.MapPath("~/bin/PermissionsLog.txt")))
                {
                    Logger.LogRelativeMessage(("Exception in Permissions: " + ex.Message + " :: " + UserName));
                }
                // If this user does not have the required permission then redirect to login page
                var url = new UrlHelper(filterContext.RequestContext);
                var loginUrl = url.Content("/Account/Login?" + ex.Message);
                filterContext.HttpContext.Response.Redirect(loginUrl, true);
            }
        }
    }
}