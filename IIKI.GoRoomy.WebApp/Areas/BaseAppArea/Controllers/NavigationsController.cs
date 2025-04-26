using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    [Authorize]
    public class NavigationsController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {
        // GET: SuperAdmin/Navigation

        /// <summary>
        /// Application Navigations
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            try
            {
                List<Navigation> rolesList = NavigationBAL.GetList();
                return View(rolesList);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ActionResult AddEdit(long Id = 0)
        {
            try
            {

                Navigation obj = new Navigation();
                if (Id > 0)
                {
                    obj = NavigationBAL.Get(Id);
                }
                obj=GetAddEditObject(obj);
                return View(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private Navigation GetAddEditObject(Navigation obj)
        {
            var ApplicationAreaList = CommonBAL.GenerateDropDownSelect(ApplicationAreaBAL.GetList(), obj, nameof(obj.ParentId));
            ViewBag.ApplicationAreaList = ApplicationAreaList;
            TempData[$"{nameof(obj.ApplicationArea)}List"] = ApplicationAreaList;
            var oPermissions = CommonBAL.GenerateDropDownSelect(PermissionDefinitionBAL.GetList(), obj, nameof(obj.ParentId));

            ViewBag.PermissionsList = oPermissions;
            TempData[$"{nameof(obj.PermissionsList)}List"] = oPermissions;

            var parentList = CommonBAL.GenerateDropDownSelect(NavigationBAL.GetParentsList(), obj, nameof(obj.ParentId));
            ViewBag.NavigationParentList = parentList;
            TempData[$"{nameof(obj.ParentId)}List"] = parentList;

            ViewBag.Title = IIKI.BaseApp.Localization.Resources.CommonLabels.TitleCreate;
            if (obj.Id > 0)
            {
                ViewBag.Title = IIKI.BaseApp.Localization.Resources.CommonLabels.TitleEdit;
                obj.IsActive = obj.RecordStatus == 1 ? true : false;
            }
            else
            {
                obj.IsActive = true;
            }
            obj.PermissionsList = string.IsNullOrWhiteSpace(obj.Permissions)
    ? Array.Empty<int>()
    : obj.Permissions.Split(',')
                    .Select(p => int.TryParse(p, out var parsedInt) ? parsedInt : (int?)null)
                    .Where(p => p.HasValue)
                    .Select(p => p.Value)
                    .ToArray();
            return obj;
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddEdit(Navigation oObject, string formaction = "save")
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (oObject.IsActive)
                        oObject.RecordStatus = 1;
                    else
                        oObject.RecordStatus = 0;
                    if (oObject.ApplicationAreaId != null)
                    {
                        var oApplicationArea = ApplicationAreaBAL.Get(oObject.ApplicationAreaId.Value);
                        oObject.ApplicationArea = oApplicationArea.ApplicationAreaCode;
                    }
                    if (oObject.PermissionsList != null)
                        oObject.Permissions = String.Join(",", oObject.PermissionsList);
                    oObject.RoleId = CurrentUser.RoleId;
                    
                    var inserted = NavigationBAL.AddEdit(oObject);
                    
                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObject.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = CommonBAL.SetAlertMessage(1, AlertMessageType);
                    TempData["AlertMessage"] = alert;

                    return RedirectToAction("Index");
                }
                oObject=GetAddEditObject(oObject);
                return View(oObject);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult _AddEditModal(int Id = 0, string modalId = "AddEditModal", bool isformSubmit = false)
        {
            try
            {
                var obj = NavigationBAL.Get(Id);

                obj = GetAddEditObject(obj);
                return PartialView("_AddEditModalPopup", new AddEditModalPopupViewModel() { Model = obj, Id = Id, ModalFormId = modalId, IsFormSubmit=isformSubmit });
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult _AddEdit(Navigation oObject, string formaction = "save")
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (oObject.IsActive)
                        oObject.RecordStatus = 1;
                    else
                        oObject.RecordStatus = 0;

                    if (oObject.Id > 0)
                    {
                        var updated = NavigationBAL.Update(oObject);
                    }
                    else
                    {
                        var inserted = NavigationBAL.Add(oObject);
                    }
                    if (formaction.Trim().Equals("saveadd"))
                    {
                        return Content(IIKI.BaseApp.Common.CommonStatus.RecordSaveStatus.RecordSavedAddText);
                    }
                    return Content(IIKI.BaseApp.Common.CommonStatus.RecordSaveStatus.RecordSavedText);

                }
                else
                    return Content(IIKI.BaseApp.Common.CommonStatus.RecordSaveStatus.InvalidModelText);

            }
            catch (Exception ex)
            {
                return Content("Exception : " + ex.Message);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteRecord(long DeleteRecordId)
        {
            try
            {
                var obj = NavigationBAL.Get(DeleteRecordId);
                NavigationBAL.Delete(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = CommonBAL.SetAlertMessage(1, AlertMessageType);
                TempData["AlertMessage"] = alert;

                return RedirectToAction("Index");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult MarkAsDeleteRecord(long DeleteRecordId)
        {
            try
            {
                var obj = NavigationBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                NavigationBAL.Update(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = CommonBAL.SetAlertMessage(1, AlertMessageType);
                TempData["AlertMessage"] = alert;

                return RedirectToAction("Index");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


    }
}