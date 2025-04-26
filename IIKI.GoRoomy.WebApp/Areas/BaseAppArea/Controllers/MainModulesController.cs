using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    [Authorize]
    public class MainModulesController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {
        // GET: SuperAdmin/MainModule
        /// <summary>
        /// Main Module
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            try
            {
                List<MainModule> rolesList = MainModuleBAL.GetList();
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

                var obj = MainModuleBAL.Get(Id);
                obj = GetAddEditObject(obj);

                return View(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private MainModule GetAddEditObject(MainModule obj)
        {
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
            return obj;
        }
        [HttpPost]
        public ActionResult AddEdit(MainModule oObject, string formaction = "save")
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
                        var updated = MainModuleBAL.Update(oObject);
                    }
                    else
                    {
                        var inserted = MainModuleBAL.Add(oObject);
                    }
                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObject.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = CommonBAL.SetAlertMessage(1, AlertMessageType);
                    TempData["AlertMessage"] = alert;

                    return RedirectToAction("Index");
                }
                oObject = GetAddEditObject(oObject);
                return View(oObject);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public PartialViewResult _AddEditPopup(int Id = 0, string modalId = "AddEditModal", bool isformSubmit = false)
        {
            try
            {
                var obj = MainModuleBAL.Get(Id);
                obj = GetAddEditObject(obj);
                return PartialView("_AddEditModalPopup", new AddEditModalPopupViewModel() { Model = obj, Id = Id, ModalFormId = modalId, IsFormSubmit=isformSubmit });
                //return View(rolesList);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult _AddEdit(MainModule oObject, string formaction = "save")
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
                        var updated = MainModuleBAL.Update(oObject);
                    }
                    else
                    {
                        var inserted = MainModuleBAL.Add(oObject);
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
                var obj = MainModuleBAL.Get(DeleteRecordId);
                MainModuleBAL.Delete(obj);
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
                var obj = MainModuleBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                MainModuleBAL.Update(obj);
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