using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using static IIKI.BaseApp.Common.CommonObjects;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    public class ProductsController : WebAppBaseController
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddEdit(long Id = 0)
        {
            try
            {
                var obj = ProductBAL.Get(Id);
                obj=GetAddEditObject(obj);
                List<HtmlTabs> listTabs = new List<HtmlTabs>();
                listTabs.Add(new HtmlTabs { TabName = "ProductInfo", TabModel = obj });
                obj.TabsList = listTabs;
                return View(obj);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private Product GetAddEditObject(Product obj)
        {
            var ProductParentList = ProductBAL.GetParentsList();
            if (obj.ParentId == 0)
                ProductParentList = ProductParentList.Where(x => x.Id != obj.Id).ToList();
            TempData[nameof(obj.ParentId) + "List"] = CommonBAL.GenerateDropDownSelect(ProductParentList, obj, nameof(obj.ParentId));

            var ProductCategoryList = ProductCategoryBAL.GetList();
            TempData[nameof(obj.ProductCategoryId) + "List"] = CommonBAL.GenerateDropDownSelect(ProductCategoryList, obj, nameof(obj.ProductCategoryId));

            var UOMList = UnitofMeasurementBAL.GetList();
            TempData[nameof(obj.UnitOfMeasurementId) + "List"] = CommonBAL.GenerateDropDownSelect(UOMList, obj, nameof(obj.UnitOfMeasurementId));

            TempData[nameof(obj.RecordStatus) + "List"] = CommonBAL.GetRecordStatuses(obj.Id);
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
        public ActionResult AddEdit(Product oObject, string formaction = "save")
        {
            try
            {
                if (ModelState.IsValid)
                {
                    oObject.UpdatedBy = CurrentUser.SessionUserId;
                    oObject.UpdatedDate = DateTime.UtcNow;
                    if (oObject.Id > 0)
                    {
                        var updated = ProductBAL.Update(oObject);
                    }
                    else
                    {
                        oObject.CreatedBy = CurrentUser.SessionUserId;
                        oObject.CreatedDate = DateTime.UtcNow;
                        var inserted = ProductBAL.Add(oObject);
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

                oObject= GetAddEditObject(oObject);
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
                var obj = ProductBAL.Get(DeleteRecordId);
                ProductBAL.Delete(obj);
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
                var obj = ProductBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                ProductBAL.Update(obj);
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

                List<Product> list = new List<Product>();

                object[] methodParams = new object[] {0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = CommonBAL.GenerateDataTablesResponseData(list, request, new ProductBAL(), methodParams, IsServerSide);

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchProducts Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }

    }
}