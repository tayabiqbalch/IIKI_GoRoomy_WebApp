using IIKI.GoRoomy.WebApp.Utility;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Configuration;
using System.Security.Claims;
using System.Threading.Tasks;

namespace IIKI.GoRoomy.WebApp.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit https://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            try
            {

                // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
                var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
                // Add custom user claims here

                string TempMainUserId = ClaimsExtension.TempMainUserId;
                string TempRoleId = ClaimsExtension.TempRoleId;
                string TempRoleName = ClaimsExtension.TempRoleName;
                string TempEmail = ClaimsExtension.TempEmail;
                string TempAdminUserId = ClaimsExtension.TempAdminUserId;

                ClaimsExtension.ClearSession();
                string SessionID = userIdentity.SessionId();
                string UserId = userIdentity.GetUserId();
                string email = TempEmail != null ? TempEmail : userIdentity.Name;
                var currentUserRole = await manager.GetRolesAsync(UserId);
                //await manager.UpdateSecurityStampAsync(UserId);
                string RoleName = "Developer";
                if (currentUserRole.Count > 0)
                {
                    RoleName = currentUserRole[0];
                }
                //if (TempMainUserId != null)
                //{
                //    userIdentity.SetMainUserId(TempMainUserId);
                //}

                //if (TempRoleId != null)
                //{
                //    userIdentity.SetRoleId(TempRoleId);
                //}

                //userIdentity.InitializeSession(TempAdminUserId, TempMainUserId, UserId, email, TempRoleId, RoleName, SessionID, IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("WebsiteID"), true);
                userIdentity.InitializeUserSession(UserId, email, RoleName, TempAdminUserId, TempMainUserId, TempRoleId, SessionID, IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("WebsiteID"), true);

                //if (TempAdminUserId != null)
                //{
                //    userIdentity.SetSessionAdminUserId(TempAdminUserId);
                //}

                userIdentity.GetNavigationClaim("__ALL__");

                return userIdentity;

            }
            catch (System.Exception ex)
            {

                throw ex;
            }
        }
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager, string authenticationType)
        {
            try
            {

                // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
                var userIdentity = await manager.CreateIdentityAsync(this, authenticationType);
                // Add custom user claims here

                string TempMainUserId = ClaimsExtension.TempMainUserId;
                string TempRoleId = ClaimsExtension.TempRoleId;
                string TempRoleName = ClaimsExtension.TempRoleName;
                string TempEmail = ClaimsExtension.TempEmail;
                string TempAdminUserId = ClaimsExtension.TempAdminUserId;

                ClaimsExtension.ClearSession();
                string SessionID = userIdentity.SessionId();
                string UserId = userIdentity.GetUserId();
                string email = TempEmail != null ? TempEmail : userIdentity.Name;
                var currentUserRole = await manager.GetRolesAsync(UserId);
                //await manager.UpdateSecurityStampAsync(UserId);
                string RoleName = "Developer";
                if (currentUserRole.Count > 0)
                {
                    RoleName = currentUserRole[0];
                }
                //if (TempMainUserId != null)
                //{
                //    userIdentity.SetMainUserId(TempMainUserId);
                //}

                //if (TempRoleId != null)
                //{
                //    userIdentity.SetRoleId(TempRoleId);
                //}

                //userIdentity.InitializeSession(TempAdminUserId, TempMainUserId, UserId, email, TempRoleId, RoleName, SessionID, IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("WebsiteID"), true);
                userIdentity.InitializeUserSession(UserId, email, RoleName, TempAdminUserId, TempMainUserId, TempRoleId, SessionID, IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("WebsiteID"), true);

                //if (TempAdminUserId != null)
                //{
                //    userIdentity.SetSessionAdminUserId(TempAdminUserId);
                //}

                userIdentity.GetNavigationClaim("__ALL__");

                return userIdentity;

            }
            catch (System.Exception ex)
            {

                throw ex;
            }
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