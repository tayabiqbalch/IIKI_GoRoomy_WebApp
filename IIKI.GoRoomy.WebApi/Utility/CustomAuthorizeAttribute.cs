using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

public class CustomAuthorizeAttribute : AuthorizeAttribute
{
    //public override void OnAuthorization(HttpActionContext actionContext)
    //{
    //    bool isAllowAnonymous = actionContext.ActionDescriptor
    //        .GetCustomAttributes<AllowAnonymousAttribute>().Any() ||
    //        actionContext.ControllerContext.ControllerDescriptor
    //        .GetCustomAttributes<AllowAnonymousAttribute>().Any();

    //    if (isAllowAnonymous)
    //    {
    //        // Skip authentication for actions or controllers marked with [AllowAnonymous]
    //        return;
    //    }
    //    var isAuthenticated = actionContext.RequestContext.Principal?.Identity?.IsAuthenticated ?? false;
    //    // Check if the request has an Authorization header
    //    var authorizationHeader = actionContext.Request.Headers.Authorization;

    //    if (authorizationHeader == null || authorizationHeader.Scheme.ToLower() != "bearer" || string.IsNullOrEmpty(authorizationHeader.Parameter))
    //    {
    //        HandleUnauthorizedRequest(actionContext);
    //        return;
    //    }

    //    var token = authorizationHeader.Parameter;
    //    // Retrieve the token object from the database using a dedicated business method
    //    var authToken = IIKI.BaseApp.Business.Methods.UserLoginTokenBAL.GetByToken(token);

    //    if (!IsTokenValid(authToken))
    //    {
    //        HandleUnauthorizedRequest(actionContext);
    //        return;
    //    }
    //    if (!isAuthenticated)
    //    {
    //        if (TryRefreshToken(actionContext, token))
    //        {
    //            RefreshClaims(authToken);
    //            // If successful, let the request proceed
    //            base.OnAuthorization(actionContext);
    //        }
    //        else
    //        {
    //            // If re-login fails, set the response to Unauthorized
    //            actionContext.Response = new HttpResponseMessage(System.Net.HttpStatusCode.Unauthorized);
    //        }
    //    }
    //    base.OnAuthorization(actionContext); // Proceed to the action method if the token is valid
    //}

    protected override bool IsAuthorized(HttpActionContext actionContext)
    {
        var request = actionContext.Request;

        // Extract the token from headers
        var token = request.Headers.Authorization?.Parameter;
        if (string.IsNullOrWhiteSpace(token))
            return false;

        // Validate and refresh claims if needed
        var refreshedPrincipal = ValidateAndRefreshClaims(token);
        if (refreshedPrincipal != null)
        {
            // Assign the refreshed principal to the context
            actionContext.RequestContext.Principal = refreshedPrincipal;
            return true;
        }

        return false;
    }


    private bool TryRefreshToken(HttpActionContext actionContext, string token)
    {
        // If successful, add the new token to the request headers and proceed
        actionContext.Request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
        return true;

    }

    private ClaimsPrincipal ValidateAndRefreshClaims(string token)
    {
        var userInfo = UserLoginTokenBAL.GetByToken(token);
        if (userInfo == null || userInfo.Id <= 0)
            return null;

        // Check token expiry (assuming token contains expiry details)
        if (userInfo.ExpiryDate < DateTimeOffset.UtcNow)
        {
                return null;
        }

        // Generate new claims
        var identity = new ClaimsIdentity(DefaultAuthenticationTypes.ApplicationCookie);
        identity.AddClaim(new Claim(ClaimTypes.Name, userInfo.UserName));
        identity.AddClaim(new Claim(ClaimTypes.Email, userInfo.Email));
        identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, userInfo.UserId));
        identity.AddClaim(new Claim(ClaimTypes.Role, userInfo.RoleName));
        return new ClaimsPrincipal(identity);
    }

    private ClaimsPrincipal RefreshClaims(UserLoginToken token)
    {
        // Logic to regenerate claims
        if (token == null) return null;

        var identity = new ClaimsIdentity(DefaultAuthenticationTypes.ApplicationCookie);
        identity.AddClaim(new Claim(ClaimTypes.Name, token.UserName));
        identity.AddClaim(new Claim(ClaimTypes.Email, token.Email));
        identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, token.UserId));
        identity.AddClaim(new Claim(ClaimTypes.Role, token.RoleName));
        identity.AddClaim(new Claim(ClaimTypes.MobilePhone, token.PhoneNumber));
        identity.AddClaim(new Claim("exp", DateTimeOffset.UtcNow.AddMinutes(30).ToString())); // New expiry

        return new ClaimsPrincipal(identity);
    }

    private bool IsTokenValid(UserLoginToken token)
    {
        
        // Check if the token exists and has not expired
        return token?.ExpiryDate >= DateTimeOffset.Now;
    }

    private void HandleUnauthorizedRequest(HttpActionContext actionContext)
    {
        actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized,
            new { Message = "Authorization has been denied for this request." });
    }

}

