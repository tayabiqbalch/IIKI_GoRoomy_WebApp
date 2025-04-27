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
    public class HotelRoomsController : WebAppBaseController
    {
        // GET: Cast
        public ActionResult Index(string MotelId)
        {
            long hotelId = MotelId.DecryptQueryString<long>();
            if (hotelId == 0)
                return RedirectToAction("Index", "Hotels");

            ViewBag.DefaultHotelId = hotelId;
            var list = HotelRoomBAL.GetList(hotelId);
            ViewBag.Title = $"Rooms: {list.FirstOrDefault()?.HotelName}";
            return View(list);
        }

        public ActionResult AddEdit(string MotelId = null, long Id = 0)
        {
            try
            {
                if (string.IsNullOrEmpty(MotelId))
                    return RedirectToAction("Index", "Hotels");

                long hotelId = MotelId.DecryptQueryString<long>();

                var obj = HotelRoomBAL.Get(Id, hotelId);

                if (obj.HotelId <= 0 && hotelId > 0)
                    obj.HotelId = hotelId;

                obj = GetAddEditObject(obj);
                return View(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        private HotelRoom GetAddEditObject(HotelRoom obj)
        {
            var ddlSelectData = HotelBAL.GetList();
            var ddlSelectList = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(ddlSelectData, obj, nameof(obj.HotelId), obj.HotelId);
            TempData[$"{nameof(obj.HotelId)}List"] = ddlSelectList;

            var ddlSelectData1 = HotelRoomTypeBAL.GetList(HotelId: obj.HotelId);
            var ddlSelectList1 = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(ddlSelectData1, obj, nameof(obj.RoomTypeId), obj.RoomTypeId);
            TempData[$"{nameof(obj.RoomTypeId)}List"] = ddlSelectList1;
            var oSlots = BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(IIKI.GoRoomy.Business.Methods.HotelSlotBAL.GetList(), obj);

            ViewBag.RoomSlotsList = oSlots;
            TempData[$"{nameof(obj.RoomSlotsIdsList)}List"] = oSlots;

            string title = $"{IIKI.BaseApp.Localization.Resources.CommonLabels.TitleEdit} {IIKI.GoRoomy.Localization.Resources.HotelRoomLabels.AddEditTitle}";

            if (obj.Id > 0)
            {
                title = $"{IIKI.BaseApp.Localization.Resources.CommonLabels.TitleEdit} ({obj.RoomNumber}) {IIKI.GoRoomy.Localization.Resources.HotelRoomLabels.AddEditTitle}: {obj.HotelName}";
                obj.IsActive = obj.RecordStatus == 1;
            }
            else
            {
                title = $"{IIKI.BaseApp.Localization.Resources.CommonLabels.TitleCreate} {IIKI.GoRoomy.Localization.Resources.HotelRoomLabels.AddEditTitle}: {obj.HotelName}";
                obj.IsActive = true;
            }
            ViewBag.Title = title;
            
            obj.RoomSlotsIdsList = string.IsNullOrWhiteSpace(obj.RoomSlotsIdsCSV) ? Array.Empty<int>()
                : obj.RoomSlotsIdsCSV.Split(',')
                    .Select(p => int.TryParse(p, out var parsedInt) ? parsedInt : (int?)null)
                    .Where(p => p.HasValue)
                    .Select(p => p.Value)
                    .ToArray();


            return obj;
        }

        [HttpPost]
        public ActionResult AddEdit(HotelRoom oObject, string formaction = "save")
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

                    if (oObject.RoomSlotsIdsList != null)
                        oObject.RoomSlotsIdsCSV = String.Join(",", oObject.RoomSlotsIdsList);

                    if (oObject.Id > 0)
                    {
                        var updated = HotelRoomBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = HotelRoomBAL.Add(oObject);
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
                    return RedirectToAction("Index", new { MotelId = oObject.HotelId.EncryptQueryString() });
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
                var obj = HotelRoomBAL.Get(Id);

                obj = GetAddEditObject(obj);
                return PartialView("_AddEditModalPopup", new IIKI.BaseApp.Business.Objects.AddEditModalPopupViewModel() { Model = obj, Id = Id, ModalFormId = modalId, IsFormSubmit = isformSubmit });
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult _AddEdit(HotelRoom oObject, string formaction = "save")
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
                        var updated = HotelRoomBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = HotelRoomBAL.Add(oObject);
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
                var obj = HotelRoomBAL.Get(DeleteRecordId);
                HotelRoomBAL.Delete(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = IIKI.BaseApp.Business.Methods.CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                TempData["AlertMessage"] = alert;

                return RedirectToAction("Index", new { MotelId = obj.HotelId.EncryptQueryString() });

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
                var obj = HotelRoomBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                HotelRoomBAL.Update(obj);
                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = IIKI.BaseApp.Business.Methods.CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                TempData["AlertMessage"] = alert;

                return RedirectToAction("Index", new { MotelId = obj.HotelId.EncryptQueryString() });

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

                List<HotelRoom> list = new List<HotelRoom>();

                object[] methodParams = new object[] { 0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDataTablesResponseData(list, request, new HotelRoomBAL(), methodParams, IsServerSide);

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchHotelRooms Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult GetByHotelJson(long Id = 0)
        {

            try
            {
                var list = HotelRoomBAL.GetList(Id);
                var obj = list.FirstOrDefault();
                if (obj == null)
                {
                    obj = new HotelRoom();  // Create a new instance of the type dynamically
                }
                var selectList = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(list, obj);
                //var selectList = new SelectList(list, "Id", "CastName", 0);
                return Json(selectList, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("HotelRooms Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }


    }
}