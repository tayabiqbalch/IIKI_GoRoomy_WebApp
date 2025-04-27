using System.Security.Claims;
using System.Threading.Tasks;
using IIKI.BaseApp.Business.Objects;
using IIKI.GoRoomy.WebApi.Utility;
using System.Web.Helpers;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;

namespace IIKI.GoRoomy.WebApi.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit https://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager, string authenticationType)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, authenticationType);
            //// Add custom user claims here

            //string TempMainUserId = ClaimsExtension.TempMainUserId;
            //string TempRoleId = ClaimsExtension.TempRoleId;
            //string TempRoleName = ClaimsExtension.TempRoleName;
            //string TempEmail = ClaimsExtension.TempEmail;
            //string TempAdminUserId = ClaimsExtension.TempAdminUserId;

            //ClaimsExtension.ClearSession();
            //string SessionID = userIdentity.SessionId();
            //string UserId = userIdentity.GetUserId();
            //string email = TempEmail ?? userIdentity.GetUserEmail();
            //var currentUserRole = userIdentity.GetRoleName();
            ////await manager.UpdateSecurityStampAsync(UserId);
            //string RoleName = "Developer";
            //if (!string.IsNullOrWhiteSpace(currentUserRole))
            //{
            //    RoleName = currentUserRole;
            //}
            //userIdentity.InitializeUserSession(UserId, email, RoleName, TempAdminUserId, TempMainUserId, TempRoleId, SessionID, IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("WebsiteID"), true);
            return userIdentity;
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(string ConnectionString = "DefaultConnection")
            : base(ConnectionString, throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}