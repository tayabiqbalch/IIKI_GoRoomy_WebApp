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
    public class HotelRoomSlotsController : WebAppBaseController
    {
        // GET: Cast
        public ActionResult Index(string MotelId, string MotelRoomId)
        {
            long hotelId = MotelId.DecryptQueryString<long>();
            long roomId = MotelRoomId.DecryptQueryString<long>();
            if (hotelId == 0 || roomId == 0)
                return RedirectToAction("Index", "Hotels");

            ViewBag.DefaultHotelId = hotelId;
            ViewBag.DefaultRoomId = roomId;
            //var list = HotelRoomSlotBAL.GetList(roomId);
            var room = HotelRoomBAL.Get(roomId);
            
            ViewBag.Title = string.Format("Room {0} Slots: {1}", string.IsNullOrEmpty(room?.RoomNumber) ? "" : "(" + room?.RoomNumber + ")", room?.HotelName ?? "");

            return View(new List<HotelRoomSlot>());
        }

        public ActionResult AddEdit(long Id = 0, string MotelId = null, string MotelRoomId = null)
        {
            try
            {
                if (string.IsNullOrEmpty(MotelId) || string.IsNullOrEmpty(MotelRoomId))
                    return RedirectToAction("Index", "Hotels");

                long hotelId = MotelId.DecryptQueryString<long>();
                long roomId = MotelRoomId.DecryptQueryString<long>();

                var obj = HotelRoomSlotBAL.Get(Id, roomId);

                if (obj.HotelId <= 0 && hotelId > 0)
                    obj.HotelId = hotelId;
                if (obj.HotelRoomId <= 0 && roomId > 0)
                    obj.HotelRoomId = roomId;

                obj = GetAddEditObject(obj);
                return View(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        private HotelRoomSlot GetAddEditObject(HotelRoomSlot obj)
        {
            var ddlHotelSlotId = HotelSlotBAL.GetList();
            var ddlHotelSlotIdSelectList = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(ddlHotelSlotId, obj, nameof(obj.HotelSlotId), obj.HotelSlotId);
            TempData[$"{nameof(obj.HotelSlotId)}List"] = ddlHotelSlotIdSelectList;

            string title = $"Room ({obj.RoomNumber})  {IIKI.GoRoomy.Localization.Resources.HotelSlotLabels.AddEditTitle} : {obj.HotelName}";

            if (obj.Id > 0)
            {
                title = $"{IIKI.BaseApp.Localization.Resources.CommonLabels.TitleEdit} {title}";
                obj.IsActive = obj.RecordStatus == 1;
            }
            else
            {
                title = $"{IIKI.BaseApp.Localization.Resources.CommonLabels.TitleCreate} {title}";
                obj.IsActive = true;
            }
            ViewBag.Title = title;

            return obj;
        }

        [HttpPost]
        public ActionResult AddEdit(HotelRoomSlot oObject, string formaction = "save")
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
                        var updated = HotelRoomSlotBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = HotelRoomSlotBAL.Add(oObject);
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
                    return RedirectToAction("Index", new { MotelId = oObject.HotelId.EncryptQueryString(), MotelRoomId = oObject.HotelRoomId.EncryptQueryString() });
                }
                oObject = GetAddEditObject(oObject);
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
                var obj = HotelRoomSlotBAL.Get(Id);

                obj = GetAddEditObject(obj);
                return PartialView("_AddEditModalPopup", new IIKI.BaseApp.Business.Objects.AddEditModalPopupViewModel() { Model = obj, Id = Id, ModalFormId = modalId, IsFormSubmit = isformSubmit });
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult _AddEdit(HotelRoomSlot oObject, string formaction = "save")
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
                        var updated = HotelRoomSlotBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = HotelRoomSlotBAL.Add(oObject);
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
                var obj = HotelRoomSlotBAL.Get(DeleteRecordId);
                HotelRoomSlotBAL.Delete(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = IIKI.BaseApp.Business.Methods.CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                TempData["AlertMessage"] = alert;

                return RedirectToAction("Index", new { MotelId = obj.HotelId.EncryptQueryString(), MotelRoomId = obj.HotelRoomId.EncryptQueryString() });

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
                var obj = HotelRoomSlotBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                HotelRoomSlotBAL.Update(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = IIKI.BaseApp.Business.Methods.CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                TempData["AlertMessage"] = alert;

                return RedirectToAction("Index", new { MotelId = obj.HotelId.EncryptQueryString(), MotelRoomId = obj.HotelRoomId.EncryptQueryString() });

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        [HttpPost]
        public ActionResult SearchDataTableRecords(IIKI.BaseApp.Common.CommonObjects.DataTablesParam request, long roomId, bool IsServerSide = false)
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

                List<HotelRoomSlot> list = new List<HotelRoomSlot>();

                //ViewBag.DefaultHotelId = hotelId;
                //ViewBag.DefaultRoomId = roomId;

                string search = request.search.value;

                list = HotelRoomSlotBAL.GetList(roomId, search);

                object[] methodParams = new object[] { 0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDataTablesResponseData(list, request, new HotelRoomSlotBAL(), methodParams, IsServerSide);

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchHotelRooms Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult GetSubHotelJson(long Id = 0)
        {

            try
            {

                var list = HotelRoomSlotBAL.GetList();

                var selectList = new SelectList(list, "Id", "CastName", 0);
                return Json(list, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("HotelRooms Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }


    }
}