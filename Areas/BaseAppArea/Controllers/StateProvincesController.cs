using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Business.Objects.BaseAppModel;
using IIKI.BaseApp.Common;
using IIKI.BaseApp.Localization.Resources;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    public class StateProvincesController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {
        // GET: Admin/StateProvince
        public ActionResult Index()
        {
            try
            {

                //var list = StateProvinceBAL.GetList();
                var list = new List<StateProvince>();
                return View(list);

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

                var obj = StateProvinceBAL.Get(Id);
                
                return View(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private StateProvince GetAddEditObject(StateProvince obj)
        {
            ViewBag.Title = CommonLabels.TitleCreate;
            if (obj.Id > 0)
            {
                ViewBag.Title = CommonLabels.TitleEdit;
                obj.IsActive = obj.RecordStatus == 1 ? true : false;
            }
            else
            {
                obj.IsActive = true;
            }
            obj.Countries = CountryBAL.GetList();
            return obj;
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddEdit(StateProvince oObject, string formaction = "save")
        {
            try
            {

                if (ModelState.IsValid)
                {
                    if (oObject.IsActive)
                        oObject.RecordStatus = 1;
                    else
                        oObject.RecordStatus = 0;

                    StateProvinceBAL.AddEdit(oObject);

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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteRecord(long DeleteRecordId)
        {
            try
            {
                var obj = StateProvinceBAL.Get(DeleteRecordId);
                StateProvinceBAL.Delete(obj);
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
                var obj = StateProvinceBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                StateProvinceBAL.Update(obj);
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

                List<StateProvince> list = new List<StateProvince>();

                object[] methodParams = new object[] { IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = CommonBAL.GenerateDataTablesResponseData(list, request, new CountryBAL(), methodParams, IsServerSide);

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