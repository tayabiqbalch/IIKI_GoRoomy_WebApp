using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IIKI.GoRoomy.WebApp.Utility
{
    public static class RouteHelper
    {
        public static string GetCurrentAreaName(HttpContextBase httpContext)
        {
            if (httpContext == null)
                throw new ArgumentNullException(nameof(httpContext));

            var routeData = httpContext.Request.RequestContext.RouteData;
            if (routeData.DataTokens.ContainsKey("area"))
            {
                return routeData.DataTokens["area"].ToString();
            }

            return string.Empty;
        }

    }
}