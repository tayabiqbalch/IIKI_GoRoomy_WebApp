using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.GoRoomy.Business.Methods;
using IIKI.GoRoomy.Business.Objects;
using IIKI.GoRoomy.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    public class HotelBookingsController : WebAppBaseController
    {
        // GET: Cast
        public ActionResult Index(int status = (int)HotelReservationStatus.AddedToCart)
        {
            var list = HotelReservationBAL.GetListByUser(ReservationStatusId: status);
            var obj = list.FirstOrDefault();
            if (obj == null)
            {
                obj = new HotelReservation();  // Create a new instance of the type dynamically
            }

            TempData[$"{nameof(obj.HotelId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(HotelBAL.GetList(), obj, nameof(obj.HotelId));
            TempData[$"{nameof(obj.HotelRoomId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(new List<HotelRoom>(), obj, nameof(obj.HotelRoomId));
            TempData[$"{nameof(obj.ReservationStatusId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(CommonStatusAndTypeBAL.GetList((int)IIKI.GoRoomy.Common.CommonStatusAndTypes.ReservationStatus), obj, nameof(obj.ReservationStatusId));
            TempData[$"{nameof(obj.ReservationMadeByStatusId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(CommonStatusAndTypeBAL.GetList((int)IIKI.GoRoomy.Common.CommonStatusAndTypes.ReservationMadeBy), obj, nameof(obj.ReservationMadeByStatusId));
            TempData[$"{nameof(obj.PaymentMethodId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(CommonStatusAndTypeBAL.GetList((int)IIKI.GoRoomy.Common.CommonStatusAndTypes.PaymentMethod), obj, nameof(obj.PaymentMethodId));
            TempData[$"{nameof(obj.PromotionId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(PromotionBAL.GetList(), obj, nameof(obj.PromotionId));

            return View(list);
        }

        public ActionResult AddEdit(long Id = 0)
        {
            try
            {
                var obj = HotelReservationBAL.Get(Id);

                obj = GetAddEditObject(obj);
                return View(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private HotelReservation GetAddEditObject(HotelReservation obj)
        {
            TempData[$"{nameof(obj.HotelId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(HotelBAL.GetList(), obj, nameof(obj.HotelId));
            TempData[$"{nameof(obj.HotelRoomId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(new List<HotelRoom>(), obj, nameof(obj.HotelRoomId));
            TempData[$"{nameof(obj.ReservationStatusId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(CommonStatusAndTypeBAL.GetList((int)IIKI.GoRoomy.Common.CommonStatusAndTypes.ReservationStatus), obj, nameof(obj.ReservationStatusId));
            TempData[$"{nameof(obj.ReservationMadeByStatusId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(CommonStatusAndTypeBAL.GetList((int)IIKI.GoRoomy.Common.CommonStatusAndTypes.ReservationMadeBy), obj, nameof(obj.ReservationMadeByStatusId));
            TempData[$"{nameof(obj.PaymentMethodId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(CommonStatusAndTypeBAL.GetList((int)IIKI.GoRoomy.Common.CommonStatusAndTypes.PaymentMethod), obj, nameof(obj.PaymentMethodId));
            TempData[$"{nameof(obj.PromotionId)}List"] = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDropDownSelect(PromotionBAL.GetList(), obj, nameof(obj.PromotionId));
            
            
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
        public ActionResult AddEdit(HotelReservation oObject, string formaction = "save")
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
                        var updated = HotelReservationBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = HotelReservationBAL.Add(oObject);
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
                var obj = HotelReservationBAL.Get(Id);

                obj = GetAddEditObject(obj);
                return PartialView("_AddEditModalPopup", new IIKI.BaseApp.Business.Objects.AddEditModalPopupViewModel() { Model = obj, Id = Id, ModalFormId = modalId, IsFormSubmit = isformSubmit });
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult _AddEdit(HotelReservation oObject, string formaction = "save")
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
                        var updated = HotelReservationBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = HotelReservationBAL.Add(oObject);
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
                var obj = HotelReservationBAL.Get(DeleteRecordId);
                HotelReservationBAL.Delete(obj);
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
                var obj = HotelReservationBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                HotelReservationBAL.Update(obj);
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
                var paramsList = ((System.Web.HttpRequestWrapper)Request).Params;
                HotelReservation obj = new HotelReservation();

                // Check for HotelId
                if (paramsList.AllKeys.Contains("HotelId"))
                {
                    obj.HotelId = long.TryParse(paramsList["HotelId"], out long hotelId) ? hotelId : 0;
                }

                // Check for HotelRoomId
                if (paramsList.AllKeys.Contains("HotelRoomId"))
                {
                    obj.HotelRoomId = long.TryParse(paramsList["HotelRoomId"], out long hotelRoomId) ? hotelRoomId : 0;
                }

                // Check for PaymentMethodId
                if (paramsList.AllKeys.Contains("PaymentMethodId"))
                {
                    obj.PaymentMethodId = int.TryParse(paramsList["PaymentMethodId"], out int paymentMethodId) ? paymentMethodId : 0;
                }

                // Check for PromotionId
                if (paramsList.AllKeys.Contains("PromotionId"))
                {
                    obj.PromotionId = long.TryParse(paramsList["PromotionId"], out long promotionId) ? promotionId : 0;
                }

                // Check for ReservationStatusId
                if (paramsList.AllKeys.Contains("ReservationStatusId"))
                {
                    obj.ReservationStatusId = int.TryParse(paramsList["ReservationStatusId"], out int reservationStatusId) ? reservationStatusId : 0;
                }

                // Check for ReservationMadeByStatusId
                if (paramsList.AllKeys.Contains("ReservationMadeByStatusId"))
                {
                    obj.ReservationMadeByStatusId = int.TryParse(paramsList["ReservationMadeByStatusId"], out int reservationMadeByStatusId) ? reservationMadeByStatusId : 0;
                }

                // Check for UserId
                if (paramsList.AllKeys.Contains("UserId"))
                {
                    obj.UserId = !string.IsNullOrEmpty(paramsList["UserId"]) ? paramsList["UserId"] : string.Empty;
                }

                // Check for SearchString
                if (paramsList.AllKeys.Contains("SearchString"))
                {
                    obj.SearchString = !string.IsNullOrEmpty(paramsList["SearchString"]) ? paramsList["SearchString"] : string.Empty;
                }


                List<HotelReservation> list = HotelReservationBAL.GetList(obj);

                object[] methodParams = new object[] { 0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = IIKI.BaseApp.Business.Methods.CommonBAL.GenerateDataTablesResponseData(list, request, new HotelReservationBAL(), methodParams, IsServerSide);

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}