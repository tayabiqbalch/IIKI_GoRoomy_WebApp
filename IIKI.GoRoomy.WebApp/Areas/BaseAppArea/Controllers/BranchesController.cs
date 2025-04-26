using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Common;
using IIKI.BaseApp.Localization.Resources;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    [Authorize]
    public class BranchesController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {

        // GET: Branches
        public ActionResult Index()
        {
            try
            {

                //var list = BranchBAL.GetList();
                return View(new List<Branch>());

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
                var obj = BranchBAL.Get(Id);
                var branchViewModel = GetAddEditObject(obj);
                return View(branchViewModel);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private BranchViewModel GetAddEditObject(Branch obj)
        {
            BranchViewModel branchViewModel = new BranchViewModel();

            var objCompanies = CompanyBAL.GetList();
            var objCountries = CountryBAL.GetList();
            branchViewModel.Branch = obj;
            branchViewModel.Companies = objCompanies;
            branchViewModel.Countries = objCountries;

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
            return branchViewModel;
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddEdit(BranchViewModel oObject, string formaction = "save")
        {
            try
            {
                var oObject1 = oObject.Branch;

                if (ModelState.IsValid)
                {
                    string FileBaseURL = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("ResourcesPath");

                    if (oObject1.IsActive)
                    {
                        oObject1.RecordStatus = 1;
                    }
                    else
                    {
                        oObject1.RecordStatus = 0;
                    }

                    if (oObject1.Id > 0)
                    {
                        oObject1.UpdatedDate = DateTime.UtcNow;
                        oObject1.UpdatedBy = CurrentUser.SessionUserId;
                        BranchBAL.Update(oObject1);
                    }
                    else
                    {
                        oObject1.CreatedDate = DateTime.UtcNow;
                        oObject1.CreatedBy = CurrentUser.SessionUserId;
                        oObject1.Id = BranchBAL.Add(oObject1);
                    }


                    if (Request.Files.Count > 0)
                    {
                        oObject1 = BranchBAL.Get(oObject1.Id);

                        //var file = Request.Files[0];
                        for (int i = 0; i < Request.Files.Count; i++)
                        {
                            var file = Request.Files[i];
                            if (file != null && file.ContentLength > 0)
                            {
                                var fileName = Path.GetFileName(file.FileName);
                                string ext = Path.GetExtension(file.FileName);

                                string ActualURL = "/BranchLogo/" + "/" + oObject1.Id + "/";
                                FileBaseURL = FileBaseURL + ActualURL;
                                if (!Directory.Exists(Server.MapPath(FileBaseURL)))
                                {
                                    Directory.CreateDirectory(Server.MapPath(FileBaseURL));
                                }
                                string newFileName = "logo" + ext;
                                FileBaseURL = Path.Combine(Server.MapPath(FileBaseURL), newFileName);
                                file.SaveAs(FileBaseURL);
                                ActualURL = ActualURL + newFileName;
                                oObject1.BranchLogo = ActualURL;
                                BranchBAL.Update(oObject1);
                            }
                        }
                    }

                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObject1.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = CommonBAL.SetAlertMessage(1, AlertMessageType);
                    TempData["AlertMessage"] = alert;
                    return RedirectToAction("Index");
                }
                oObject = GetAddEditObject(oObject.Branch);
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
                var obj = BranchBAL.Get(DeleteRecordId);
                BranchBAL.Delete(obj);
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
                var obj = BranchBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                BranchBAL.Update(obj);
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

                List<Branch> list = new List<Branch>();
                object[] methodParams= new object[] { 0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = CommonBAL.GenerateDataTablesResponseData(list, request, new BranchBAL(), methodParams, IsServerSide);
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
