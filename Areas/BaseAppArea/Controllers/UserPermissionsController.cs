using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    [Authorize]
    public class UserPermissionsController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult AddEdit(string Id = null, string email = null, string role = null)
        {
            try
            {


                string UserId = Id;
                UserInfo User = UsersProfileBAL.GetUserInfo(Id, email, null, role);

                List<UserMainModule> lMainModule = UserPermissionsBAL.GetUserModules(UserId, User.MainUserId, User.RoleId, 0);

                var mm = lMainModule.Where(x => x.Id == 1).ToList();

                if (Id != null && Id.Length > 0 && email != null && role != null)
                {

                    //var claimIdentity = (ClaimsIdentity)HttpContext.User.Identity;
                    //var roleClaims = claimIdentity.Claims.Where(c => c.Type == ClaimTypes.Role);
                    //var userRole = UserManager.GetRolesAsync(Id);
                    // var role = CurrentUser.RoleName.Equals("Employee") ? "Employee" : CurrentUser.RoleName.Equals("Admin") ?"Admin":"HR";

                    if (User != null)
                    {
                        ViewBag.EditUser = User;
                    }
                }

                return View(lMainModule);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult AddEdit(string SubUserEmail, string SubUserId, int[] AreaRuleIds, int[] ModuleIds)
        {
            try
            {
                if (AreaRuleIds.Length <= 0)
                {
                    return RedirectToAction("Index", "ManageUsers", new { response = "No rights Assigned. User cannot be created." });
                }

                char[] AreaRules = "0".PadLeft(Convert.ToInt32(UserPermissionsBAL.LoadAreaRulesMax()), '0').ToCharArray();

                foreach (var ruleId in AreaRuleIds)
                {
                    AreaRules[ruleId - 1] = '1';
                }
                char[] Modules = "0".PadLeft(Convert.ToInt32(UserPermissionsBAL.LoadModulesMax()), '0').ToCharArray();
                foreach (var moduleId in  ModuleIds)
                {
                    Modules[moduleId - 1] = '1';
                }

                try
                {
                    string AllotedRules = new string(AreaRules);
                    string AllotedModules = new string(Modules);


                    //var foundIndexes = new List<int>();
                    //for (int i = 0; i < AllotedRules.Length; i++)
                    //{
                    //    if (AllotedRules[i] == '0')
                    //        foundIndexes.Add(i);
                    //}

                    //// create a new string with array contents.

                    //string subUserRights = "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";

                    //char[] charArr = subUserRights.ToCharArray();
                    //foreach (var item in foundIndexes)
                    //{
                    //    charArr[item] = '0'; // freely modify the array
                    //}

                    //subUserRights = new string(charArr);

                    var result = UserPermissionsBAL.UpdateMemberRights(SubUserId, CurrentUser.SessionAdminUserId, CurrentUser.UserId, AllotedRules, AllotedModules);

                    //if (result <= 0)
                    //{
                    //    return RedirectToAction("Index", "Members", new { area = "Manage", response = "User Could not be Added" });
                    //}
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                return RedirectToAction("Index", "ManageUsers");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpGet]
        public ActionResult UserRightsAddEdit(string Id = null, string email = null, string role = null)
        {
            try
            {
                List<UserMainModule> lMainModule = UserPermissionsBAL.GetUserModules(CurrentUser.UserId, CurrentUser.MainUserId, CurrentUser.RoleId, 0).Where(x => x.ModuleCode == "Admin").ToList();

                var mm = lMainModule.Where(x => x.Id == 1).ToList();

                if (Id != null && Id.Length > 0 && email != null && role != null)
                {
                    UserInfo User = UsersProfileBAL.GetUserInfo(Id, email, null, role);

                    if (User != null)
                    {
                        ViewBag.EditUser = User;
                    }
                }

                return View(lMainModule);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult UserRightsAddEdit(string SubUserEmail, string SubUserId, int[] AreaRuleIds, int[] ModuleIds)
        {
            try
            {
                if (AreaRuleIds.Length <= 0)
                {
                    return RedirectToAction("Users", "UserRoles", new { response = "No rights Assigned. User cannot be created." });
                }

                char[] AreaRules = "0".PadLeft(Convert.ToInt32(UserPermissionsBAL.LoadAreaRulesMax()), '0').ToCharArray();

                foreach (var ruleId in AreaRuleIds)
                {
                    AreaRules[ruleId - 1] = '1';
                }
                char[] Modules = "0".PadLeft(Convert.ToInt32(UserPermissionsBAL.LoadModulesMax()), '0').ToCharArray();
                foreach (var moduleId in ModuleIds)
                {
                    Modules[moduleId - 1] = '1';
                }

                try
                {
                    string AllotedRules = new string(AreaRules);
                    string AllotedModules = new string(Modules);
                    var result = UserPermissionsBAL.UpdateMemberRights(SubUserId, CurrentUser.SessionAdminUserId, CurrentUser.UserId, AllotedRules, AllotedModules);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                return RedirectToAction("Users", "UserRoles");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}