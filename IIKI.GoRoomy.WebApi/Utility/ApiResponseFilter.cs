using System.Net;
using System.Web.Http.Filters;
using System.Net.Http;
using IIKI.GoRoomy.WebApi.Models;
using System.Web.Http;
using System;
using System.Web.UI.WebControls;

namespace IIKI.GoRoomy.WebApi.Utility
{
    public class ApiResponseFilter : ActionFilterAttribute
    {
        public override void OnActionExecuted(HttpActionExecutedContext context)
        {
            if (context.Response != null)
            {
                object content;
                context.Response.TryGetContentValue(out content);

                var response = new {
                    code = (int)context.Response.StatusCode,
                    message = context.Response.IsSuccessStatusCode ? "Success" : "An error occurred",
                    data = content
                };

                context.Response = context.Request.CreateResponse(context.Response.StatusCode, response);
            }
            else if(context.Exception!=null && context.Exception?.Message != null)
            {
                Exception ex = context.Exception;
                string controllerName = context.ActionContext.ControllerContext.ControllerDescriptor.ControllerName;
                string actionName = context.ActionContext.ActionDescriptor.ActionName;
                string arguments = context.ActionContext.ActionArguments.ToJsonString();

                var content= new HttpError
                {
                    { "Message", ex?.Message },
                    { "Inner Message", ex?.InnerException?.Message },
                    { "Controller", controllerName },
                    { "Action", actionName },
                    { "Arguments", arguments },
                    { "Exception", ex }
                };

                var response = new
                {
                    code = (int)context.Response.StatusCode,
                    message = "An exception occurred",
                    data = content
                };
              
                context.Response = context.Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
            else
            {
                var response = new {
                    code= (int)HttpStatusCode.InternalServerError,
                    message= "An unexpected error occurred",
                    data = ""
                };

                context.Response = context.Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }

            base.OnActionExecuted(context);
        }
    }
}