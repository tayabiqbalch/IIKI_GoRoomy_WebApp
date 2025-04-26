using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Localization.Resources;
using System;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    [Authorize]
    public class CompanyTypesController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {
        private readonly ICompanyTypeBAL iCompanyTypeBAL = new CompanyTypeBAL();
        private readonly IBaseGenericBAL<CompanyType> iBaseCompanyTypeBAL = new BaseGenericBAL<CompanyType>();
        public CompanyTypesController()
        {
            this.iCompanyTypeBAL = new CompanyTypeBAL();
            this.iBaseCompanyTypeBAL = new BaseGenericBAL<CompanyType>();
        }
        public CompanyTypesController(ICompanyTypeBAL _iCompanyTypeBAL, IBaseGenericBAL<CompanyType> _iBaseCompanyTypeBAL)
        {
            this.iCompanyTypeBAL = _iCompanyTypeBAL;
            this.iBaseCompanyTypeBAL = _iBaseCompanyTypeBAL;
        }

        public ActionResult Index()
        {
            try
            {

                var list = iCompanyTypeBAL.GetList();
                CompanyType oObject = new CompanyType() { Id = -1 };
                var listGeneric = iBaseCompanyTypeBAL.GetList(oObject);
                //ApplicationArea oObjectAA = new ApplicationArea() { RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.All, Command = Common.SQLCommandTypes.AllRecordStatus.ToString(), OffSet = 0, PageSize = 100, SortColumn = "0", SortOrder = "asc", };
                //IBaseGenericBAL<ApplicationArea> iBaseGenericBAL = new BaseGenericBAL<ApplicationArea>();
                //var listGeneric1 = iBaseGenericBAL.GetList(oObjectAA, "LEFT JOIN  dbo.tblApplicationAreas TPAA ON TPAA.Id=t.ParentId LEFT JOIN  dbo.tblMainModules TMM ON TMM.Id=t.ModuleId", ",TPAA.ApplicationAreaCode AS ParentApplicationAreaCode,TPAA.ApplicationAreaName AS ParentApplicationAreaName");

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
                var obj = iCompanyTypeBAL.Get(Id);
                obj = GetAddEditObject(obj);

                CompanyType oObject = new CompanyType() { Id = Id};
                var objGeneric = iBaseCompanyTypeBAL.Get(oObject);
                objGeneric = GetAddEditObject(objGeneric);
                return View(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private CompanyType GetAddEditObject(CompanyType obj)
        {
            ViewBag.Title = $"{CommonLabels.TitleCreate} {CompanyTypeLabels.AddEditTitle}";
            if (obj.Id > 0)
            {
                ViewBag.Title = $"{CommonLabels.TitleEdit} {CompanyTypeLabels.AddEditTitle}" ;
                obj.IsActive = obj.RecordStatus == 1 ? true : false;
            }
            else
            {
                obj.IsActive = true;
            }
            return obj;
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddEdit(CompanyType oObject, string formaction = "save")
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
                        //iCompanyTypeBAL.Update(oObject);
                        iBaseCompanyTypeBAL.UpdateUsingStoredProcedure(oObject, "[dbo].[usp_InsertUpdateCompanyType]");
                        //iBaseCompanyTypeBAL.Update(oObject);
                    }
                    else
                    {
                        iBaseCompanyTypeBAL.AddEditUsingStoredProcedure(oObject, "[dbo].[usp_InsertUpdateCompanyType]");
                        //iBaseCompanyTypeBAL.Add(oObject);
                    }
                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObject.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = CommonBAL.SetAlertMessage(1, AlertMessageType);
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
                var obj = iCompanyTypeBAL.Get(Id);

                obj = GetAddEditObject(obj);
                var model = new AddEditModalPopupViewModel() { Model = obj, Id = Id, ModalFormId = modalId, IsFormSubmit=isformSubmit };
                return PartialView("_AddEditModalPopup", model);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        [HttpPost]
        public ActionResult _AddEdit(CompanyType oObject, string formaction = "save")
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
                        var updated = iCompanyTypeBAL.Update(oObject);
                    }
                    else
                    {
                        var inserted = iCompanyTypeBAL.Add(oObject);
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
                var obj = iCompanyTypeBAL.Get(DeleteRecordId);
                iCompanyTypeBAL.Delete(obj);
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
                var obj = iCompanyTypeBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                iCompanyTypeBAL.Update(obj);
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
