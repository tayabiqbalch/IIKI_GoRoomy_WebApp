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
    public class CompaniesController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {

        // GET: Companies
        public ActionResult Index()
        {
            try
            {
                var list = CompanyBAL.GetList();

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
                var obj = CompanyBAL.Get(Id);
                var companyViewModel = GetAddEditObject(obj);
                return View(companyViewModel);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private CompanyViewModel GetAddEditObject(Company obj)
        {

            CompanyViewModel companyViewModel = new CompanyViewModel();
            AddressViewModel addressViewModel = new AddressViewModel();
            ICompanyTypeBAL iCompanyTypeBAL = new CompanyTypeBAL();
            var objCompanyTypes = iCompanyTypeBAL.GetList();
            var objCountries = CountryBAL.GetList();
            companyViewModel.Company = obj;
            companyViewModel.CompanyTypes = objCompanyTypes;
            companyViewModel.Countries = objCountries;

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
            return companyViewModel;
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddEdit(CompanyViewModel oObject, string formaction = "save")
        {
            try
            {
                var oObject1 = oObject.Company;
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
                        CompanyBAL.Update(oObject1);
                    }
                    else
                    {
                        oObject1.CreatedDate = DateTime.UtcNow;
                        oObject1.CreatedBy = CurrentUser.SessionUserId;
                        oObject1.Id = CompanyBAL.Add(oObject1);
                    }


                    if (Request.Files.Count > 0)
                    {
                        oObject1 = CompanyBAL.Get(oObject1.Id);

                        //var file = Request.Files[0];
                        for (int i = 0; i < Request.Files.Count; i++)
                        {
                            var file = Request.Files[i];
                            if (file != null && file.ContentLength > 0)
                            {
                                var fileName = Path.GetFileName(file.FileName);
                                string ext = Path.GetExtension(file.FileName);

                                string ActualURL = "/CompanyLogo/" + "/" + oObject1.Id + "/";
                                FileBaseURL = FileBaseURL + ActualURL;
                                if (!Directory.Exists(Server.MapPath(FileBaseURL)))
                                {
                                    Directory.CreateDirectory(Server.MapPath(FileBaseURL));
                                }
                                string newFileName = "logo" + ext;
                                FileBaseURL = Path.Combine(Server.MapPath(FileBaseURL), newFileName);
                                file.SaveAs(FileBaseURL);
                                ActualURL = ActualURL + newFileName;
                                oObject1.CompanyLogo = ActualURL;
                                CompanyBAL.Update(oObject1);
                            }
                        }
                    }

                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObject1.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                    TempData["AlertMessage"] = alert;
                    return RedirectToAction("Index");
                }

                oObject = GetAddEditObject(oObject.Company);
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
                var obj = CompanyBAL.Get(DeleteRecordId);
                CompanyBAL.Delete(obj);
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
                var obj = CompanyBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                CompanyBAL.Update(obj);
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

                List<Company> list = new List<Company>();

                object[] methodParams = new object[] {0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = CommonBAL.GenerateDataTablesResponseData(list, request, new CompanyBAL(), methodParams, IsServerSide);


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
