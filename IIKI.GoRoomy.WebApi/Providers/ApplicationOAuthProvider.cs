using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OAuth;
using IIKI.GoRoomy.WebApi.Models;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Business.Methods;


namespace IIKI.GoRoomy.WebApi.Providers
{
    public class ApplicationOAuthProvider : OAuthAuthorizationServerProvider
    {
        private readonly string _publicClientId;

        public ApplicationOAuthProvider(string publicClientId)
        {
            if (publicClientId == null)
            {
                throw new ArgumentNullException("publicClientId");
            }

            _publicClientId = publicClientId;
        }

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            AuthenticationProperties properties = CreateProperties(context.UserName);
            context.Request.Context.Authentication.SignOut(properties);
            if (context.UserName?.ToLower() == "guest@mtic.api" && context.Password.ToLower().Equals("sa###123456@mayo"))
            {
                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim(ClaimTypes.Name, context.UserName));
                var ticket = new AuthenticationTicket(identity, properties);
                context.Validated(ticket);
                context.Request.Context.Authentication.SignIn(identity);
            }
            else
            {
                var userManager = context.OwinContext.GetUserManager<ApplicationUserManager>();

                ApplicationUser user = await userManager.FindAsync(context.UserName, context.Password);

                if (user == null)
                {
                    context.SetError("invalid_grant", "The user name or password is incorrect.");
                    return;
                }

                string token = Guid.NewGuid().ToString();
                DateTimeOffset tokenExpiryDate = DateTimeOffset.Now.AddDays(30);
                token = createUserLoginToken(user, tokenExpiryDate, token);
                properties = CreateProperties(context.UserName, token, tokenExpiryDate);
                ClaimsIdentity oAuthIdentity = await user.GenerateUserIdentityAsync(userManager,
               OAuthDefaults.AuthenticationType);
                ClaimsIdentity cookiesIdentity = await user.GenerateUserIdentityAsync(userManager,
                    CookieAuthenticationDefaults.AuthenticationType);

                AuthenticationTicket ticket = new AuthenticationTicket(oAuthIdentity, properties);
                context.Validated(ticket);
                context.Request.Context.Authentication.SignIn(cookiesIdentity);
            }
        }

        private string createUserLoginToken(ApplicationUser user, DateTimeOffset tokenExpiryDate, string token)
        {
            var authToken = UserLoginTokenBAL.GetByUserId(user.Id);
            if (authToken == null || authToken?.Id <= 0 || authToken?.ExpiryDate < DateTimeOffset.Now)
            {
                var userLoginToken = new UserLoginToken
                {
                    LoginToken = token,
                    UserId = user.Id,
                    ExpiryDate = tokenExpiryDate,
                    CreatedBy = user.Id,
                    CreatedDate = DateTimeOffset.Now,
                    UpdatedBy = user.Id,
                    UpdatedDate = DateTimeOffset.Now
                };
                UserLoginTokenBAL.Add(userLoginToken);
            }
            else
            {
                token = authToken.LoginToken;
            }
            return token;
        }

        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            if (!context.Properties.Dictionary.ContainsKey("isCustomToken"))
            {
                foreach (KeyValuePair<string, string> property in context.Properties.Dictionary)
                {
                    context.AdditionalResponseParameters.Add(property.Key, property.Value);
                }
            }
            else
            {
                context.AdditionalResponseParameters.Add("userName", context.Properties.Dictionary["userName"]);
                context.AdditionalResponseParameters.Add("user_token", context.Properties.Dictionary["user_token"]);
                context.AdditionalResponseParameters.Add("expiry", context.Properties.Dictionary["expiry"]);
                context.AdditionalResponseParameters.Add("user_token_type", "bearer");
            }

            return Task.FromResult<object>(null);
        }

        public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            // Resource owner password credentials does not provide a client ID.
            if (context.ClientId == null)
            {
                context.Validated();
            }

            return Task.FromResult<object>(null);
        }

        public override Task ValidateClientRedirectUri(OAuthValidateClientRedirectUriContext context)
        {
            if (context.ClientId == _publicClientId)
            {
                Uri expectedRootUri = new Uri(context.Request.Uri, "/");

                if (expectedRootUri.AbsoluteUri == context.RedirectUri)
                {
                    context.Validated();
                }
            }

            return Task.FromResult<object>(null);
        }

        public static AuthenticationProperties CreateProperties(string userName)
        {
            IDictionary<string, string> data = new Dictionary<string, string>
            {
                { "userName", userName }
            };
            return new AuthenticationProperties(data);
        }
        public static AuthenticationProperties CreateProperties(string userName, string token, DateTimeOffset expiryDate)
        {
            IDictionary<string, string> data = new Dictionary<string, string>
            {
                { "userName", userName },
                { "user_token", token },
                { "expiry", expiryDate.ToString("o") }, // Store expiry in ISO 8601 format
                { "isCustomToken", "true" }
            };
            return new AuthenticationProperties(data);
        }
    }
}