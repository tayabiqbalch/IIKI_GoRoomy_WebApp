using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    [Authorize(Roles = "SuperAdmin")]
    public class UserRolesController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {

        //[HasPermission("GENERALAUTHENTICATION")]
        public ActionResult Index()
        {
            try
            {
                List<AspNetRole> rolesList = AspNetRoleBAL.GetAspRoles();
                return View(rolesList);


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        //[HasPermission("GENERALAUTHENTICATION")]
        public ActionResult AddEdit(string Id = null)
        {
            try
            {
                //List<MainModule> lMainModule = UserPermissionsBAL.GetUserModules(CurrentUser.UserId, CurrentUser.MainUserId, CurrentUser.RoleId, 1);
                List<UserMainModule> lMainModule = UserPermissionsBAL.GetUserModules("__ALL__", CurrentUser.MainUserId, CurrentUser.RoleId, 1);

                if (Id != null && Id.Length > 0)
                {
                    RolesDefaultPermission permission = AspNetRoleBAL.GetRolesDefaultPermissions(Id);

                    if (permission != null)
                    {
                        ViewBag.EditUser = permission;
                    }
                    else
                    {
                        ViewBag.EditUser = string.Empty;
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
        //[HasPermission("GENERALAUTHENTICATION")]
        public ActionResult AddEdit(string RoleName, string RoleId, int[] AreaRuleIds, int[] ModuleIds)
        {
            try
            {
                if (AreaRuleIds == null)
                {
                    return RedirectToAction("Index", "UserRoles", new { area = "Manage", response = "No rights Assigned." });
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

                string AllotedRules = new string(AreaRules);
                string AllotedModules = new string(Modules);


                var foundIndexes = new List<int>();
                for (int i = 0; i < AllotedRules.Length; i++)
                {
                    if (AllotedRules[i] == '0')
                        foundIndexes.Add(i);
                }

                // create a new string with array contents.



                //var result = UserPermissionsBAL.UpdateMemberRights(RoleId, CurrentUser.SessionAdminUserId, CurrentUser.UserId, AllotedRules);

                var result1 = AspNetRoleBAL.UpdateRolesDefaultPermissions(RoleId, CurrentUser.SessionAdminUserId, CurrentUser.UserId, AllotedRules, AllotedModules);

                if (result1 == false)
                {
                    return RedirectToAction("Index", "UserRoles", new { area = "Manage", response = "Rights Could not be Added" });
                }

                return RedirectToAction("Index", "UserRoles", new { area = "Manage" });


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}