using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net;
using System.Web;
using System.Web.Http;
using System.Web.Http.Filters;

namespace IIKI.GoRoomy.WebApi.Utility
{
    public class CustomExceptionFilter : ExceptionFilterAttribute
    {
        //public override void OnException(HttpActionExecutedContext context)
        //{
        //    Exception ex = context.Exception;
        //    string controllerName = context.ActionContext.ControllerContext.ControllerDescriptor.ControllerName;
        //    string actionName = context.ActionContext.ActionDescriptor.ActionName;
        //    string arguments = context.ActionContext.ActionArguments.ToJsonString();

        //    var content = new HttpError
        //        {
        //            { "Message", ex?.Message },
        //            { "Inner Message", ex?.InnerException?.Message },
        //            { "Controller", controllerName },
        //            { "Action", actionName },
        //            { "Arguments", arguments },
        //            { "Exception", ex }
        //        };

        //    var response = new
        //    {
        //        code = (int)context.Response.StatusCode,
        //        message = "An exception has occurred",
        //        data = content
        //    };

        //    context.Response = context.Request.CreateResponse(HttpStatusCode.InternalServerError, response);
        //}
    }
}