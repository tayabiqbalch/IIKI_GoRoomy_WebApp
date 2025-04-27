using IIKI.GoRoomy.WebApp.Utility;
using IIKI.BaseApp.Business.Objects;
using Microsoft.AspNet.Identity;
using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Security.Claims;
using System.Web.Mvc;
using IIKI.GoRoomy.WebApp.Utility;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    [Authorize]
    public class WebAppBaseController : Controller
    {
        protected ClaimsIdentity UserIdentity
        {
            get
            {
                if (User != null)
                {
                    return ((ClaimsIdentity)User.Identity);
                }
                return null;
            }
        }
        protected UserInfo CurrentUser
        {
            get
            {
                if (UserIdentity != null)
                {
                    return UserIdentity.GetUserInfo();
                }
                return new UserInfo();
            }
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            Exception ex = filterContext.Exception;
            filterContext.ExceptionHandled = true;
            string controllerName = Convert.ToString(filterContext.RouteData.Values["controller"]);
            string actionName = Convert.ToString(filterContext.RouteData.Values["action"]);
            string areaName = Convert.ToString(filterContext.RouteData.DataTokens["area"]);

            var model = new HandleErrorInfo(filterContext.Exception, areaName + "/" + controllerName, "Occured In: " + actionName);

            filterContext.Result = new ViewResult()
            {
                ViewName = "Error",
                ViewData = new ViewDataDictionary(model)
            };

            IIKI.BaseApp.Common.Logger.LogException(ex);
        }

        public string AjaxExceptionString(Exception ex, string ControllerName, string ActionName)
        {
            return "Action could not be completed. Please try again Later";
        }

        public string GetIP()
        {
            return "";
        }
        public static string GetLocalIPAddress()
        {
            try
            {
            }
            catch (System.Net.Sockets.SocketException sockEx)
            {
                int errorCode = sockEx.ErrorCode;
            }
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            throw new Exception("IP Address Not Found!");
        }

        public static string RenderPartialToString(string viewName, object model, ControllerContext controllerContext)
        {
            if (string.IsNullOrEmpty(viewName))
                viewName = controllerContext.RouteData.GetRequiredString("action");
            ViewDataDictionary ViewData = new ViewDataDictionary();
            TempDataDictionary TempData = new TempDataDictionary();
            ViewData.Model = model;

            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(controllerContext, viewName);
                ViewContext viewContext = new ViewContext(controllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);

                return sw.GetStringBuilder().ToString();
            }

        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }


    }
}