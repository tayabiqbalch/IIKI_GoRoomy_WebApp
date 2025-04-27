using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.GoRoomy.WebApi.Utility;
using Microsoft.AspNet.Identity;
using System.Security.Claims;
using System.Web.Http;

namespace IIKI.GoRoomy.WebApi.Controllers
{
    //[Authorize]//commented because we are no more use built in we are using cutom.
    [CustomAuthorize]
    public class BaseAPIController : ApiController
    {
        protected ClaimsIdentity UserIdentity => User != null ? (ClaimsIdentity)User.Identity : null;
        protected UserClaimInfo CurrentUser => UserIdentity != null ? UserIdentity.GetUserInfo() : new UserClaimInfo();

        protected string GetUserId(string tokenParam)
        {
            string userId = User.Identity.GetUserId();
            if (string.IsNullOrWhiteSpace(userId) && !string.IsNullOrWhiteSpace(tokenParam))
            {
                var token = UserLoginTokenBAL.GetByToken(tokenParam);
                if (token != null && token?.Id > 0)
                {
                    return token.UserId;
                }
            }
            return userId;
        }
    }

}