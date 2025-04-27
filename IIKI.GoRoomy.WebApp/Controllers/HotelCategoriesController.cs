using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Common;
using IIKI.GoRoomy.Business.Methods;
using IIKI.GoRoomy.Business.Objects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    public class HotelCategoriesController : WebAppBaseController
    {
        // GET: Cast
        public ActionResult Index()
        {
            var list = HotelCategoryBAL.GetList();
            return View(list);
        }

        public ActionResult AddEdit(long Id = 0)
        {
            try
            {
                var obj = HotelCategoryBAL.Get(Id);

                obj = GetAddEditObject(obj);
                return View(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private HotelCategory GetAddEditObject(HotelCategory obj)
        {

            var parentList = HotelCategoryBAL.GetParentsList();
            parentList = parentList.Where(x => x.Id != obj.Id).ToList();
            //parentList.Insert(0, new HotelCategory { Id = 0, CategoryName = "--SELECT---" });
            var dpdParentList = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(parentList, obj, nameof(obj.ParentId));
            TempData[$"{nameof(obj.ParentId)}List"] = dpdParentList;
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
        public ActionResult AddEdit(HotelCategory oObject, string formaction = "save")
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
                        var updated = HotelCategoryBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = HotelCategoryBAL.Add(oObject);
                    }
                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObject.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = IIKI.BaseApp.Business.Methods.CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
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
                var obj = HotelCategoryBAL.Get(Id);

                obj=GetAddEditObject(obj);
                return PartialView("_AddEditModalPopup", new IIKI.BaseApp.Business.Objects.AddEditModalPopupViewModel() { Model = obj, Id = Id, ModalFormId = modalId, IsFormSubmit=isformSubmit });
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult _AddEdit(HotelCategory oObject, string formaction = "save")
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
                        var updated = HotelCategoryBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = HotelCategoryBAL.Add(oObject);
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
                var obj = HotelCategoryBAL.Get(DeleteRecordId);
                HotelCategoryBAL.Delete(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = IIKI.BaseApp.Business.Methods.CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
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
                var obj = HotelCategoryBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                HotelCategoryBAL.Update(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = IIKI.BaseApp.Business.Methods.CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
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
            IIKI.BaseApp.Common.CommonObjects.DataTablesResponseData response;
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

                List<HotelCategory> list = new List<HotelCategory>();
                
                object[] methodParams = new object[] {0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDataTablesResponseData(list, request, new HotelCategoryBAL(), methodParams, IsServerSide);

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchUserDetails Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }


        [HttpPost]
        public ActionResult GetSubHotelCategoryJson(long Id = 0)
        {

            try
            {

                var list = HotelCategoryBAL.GetList(Id);

                var selectList = new SelectList(list, "Id", "CastName", 0);
                return Json(list, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchUserDetails Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }


    }
}