using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Common;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    public class UnitofMeasurementsController : WebAppBaseController
    {
        // GET: Cast
        public ActionResult Index()
        {
            var list = UnitofMeasurementBAL.GetList();
            return View(list);
        }

        public ActionResult AddEdit(long Id = 0)
        {
            try
            {

                var obj = UnitofMeasurementBAL.Get(Id);
                obj=GetAddEditObject(obj);
                return View(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private UnitofMeasurement GetAddEditObject(UnitofMeasurement obj)
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
        public ActionResult AddEdit(UnitofMeasurement oObject, string formaction = "save")
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (oObject.IsActive)
                        oObject.RecordStatus = 1;
                    else
                        oObject.RecordStatus = 0;

                    oObject.UpdatedBy = CurrentUser.SessionUserId;
                    oObject.UpdatedDate = DateTime.UtcNow;
                    if (oObject.Id > 0)
                    {
                        var updated = UnitofMeasurementBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = UnitofMeasurementBAL.Add(oObject);
                    }
                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObject.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                    TempData["AlertMessage"] = alert;
                    if (formaction.Trim().Equals("saveadd"))
                    {
                        return RedirectToAction("AddEdit", new { Id = 0 }); ;
                    }
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
                var obj = UnitofMeasurementBAL.Get(Id);

                obj=GetAddEditObject(obj);
                return PartialView("_AddEditModalPopup", new AddEditModalPopupViewModel() { Model = obj, Id = Id, ModalFormId = modalId, IsFormSubmit=isformSubmit });
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult _AddEdit(UnitofMeasurement oObject, string formaction = "save")
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (oObject.IsActive)
                        oObject.RecordStatus = 1;
                    else
                        oObject.RecordStatus = 0;

                    oObject.UpdatedBy = CurrentUser.SessionUserId;
                    oObject.UpdatedDate = DateTime.UtcNow;
                    if (oObject.Id > 0)
                    {
                        var updated = UnitofMeasurementBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = UnitofMeasurementBAL.Add(oObject);
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
                var obj = UnitofMeasurementBAL.Get(DeleteRecordId);
                UnitofMeasurementBAL.Delete(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
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
                var obj = UnitofMeasurementBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                UnitofMeasurementBAL.Update(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                TempData["AlertMessage"] = alert;

                return RedirectToAction("Index");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        [HttpPost]
        public ActionResult SearchDataTableRecords(IIKI.BaseApp.Common.CommonObjects.DataTablesParam request, bool IsServerSide = false)
        {

            int SortColumn = 2;
            string SortOrder = "DESC";
            try
            {
                if (request.length <= 0)
                {
                    request.length = IIKI.BaseApp.Common.CommonStatus.GirdPageSettings.PageSize;
                }
                if (request.order != null)
                {
                    if (request.order.Count <= 0)
                    {
                        SortColumn = IIKI.BaseApp.Common.CommonStatus.GirdPageSettings.SortColumn;
                        SortOrder = IIKI.BaseApp.Common.CommonStatus.GirdPageSettings.SortOrder;
                    }
                    else
                    {
                        SortColumn = request.order[0].column;
                        SortOrder = request.order[0].dir;
                    }
                }


                DateTimeOffset start = DateTimeOffset.MinValue;
                DateTimeOffset end = DateTimeOffset.MaxValue;

                List<UnitofMeasurement> list = new List<UnitofMeasurement>();
                object[] methodParams = new object[] { IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                var response = CommonBAL.GenerateDataTablesResponseData(list, request, new UnitofMeasurementBAL(), methodParams, IsServerSide);

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchUserDetails Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }

    }
}