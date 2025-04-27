using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using System;
using System.Configuration;
using System.IO;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    public class ContactDocumentsController : WebAppBaseController
    {
        // GET: ContactDocument
        public ActionResult Index(long Id)
        {
            try
            {
                var list = ContactDocumentBAL.GetList(Id);
                var contact = ContactBAL.Get(Id);
                ViewBag.Contact = contact;
                return View(list);
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public ActionResult _AddEditSubmitModal(int ContactId = 0)
        {
            try
            {
                var obj = ContactDocumentBAL.Get(0);
                obj.ContactId = ContactId;
                ViewBag.Title = IIKI.BaseApp.Localization.Resources.CommonLabels.TitleCreate;
                var docTypeList = DocumentTypeBAL.GetList(IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted);
                ViewBag.DocumentTypeList = docTypeList;
                obj.IsActive = true;

                return PartialView(obj);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult _AddEdit(ContactDocument oObject, string formaction = "save")
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (oObject.IsActive)
                        oObject.RecordStatus = 1;
                    else
                        oObject.RecordStatus = 0;

                    ////string FileBaseURL = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("ContactDocumentsPath") + "/" + oObject.ContactId + "/";

                    string ActualURL = "/" + oObject.ContactId + "/";
                    string FileBaseURL = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("ContactDocumentsPath") + ActualURL;

                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                    if (Request.Files.Count > 0)
                    {
                        for (int i = 0; i < Request.Files.Count; i++)
                        {
                            var file = Request.Files[i];
                            if (file != null && file.ContentLength > 0)
                            {
                                var fileName = Path.GetFileNameWithoutExtension(file.FileName);
                                oObject.Document.DocumentName = fileName;
                                string ext = Path.GetExtension(file.FileName);
                                oObject.Document.DocumentExtension = ext;
                                if (ext.ToLower().Equals(".pdf"))
                                    oObject.Document.FileType = "pdf";
                                else if (ext.ToLower().Equals(".png") || ext.ToLower().Equals(".jpg"))
                                    oObject.Document.FileType = "img";
                                else
                                    oObject.Document.FileType = "doc";

                                if (!Directory.Exists(Server.MapPath(FileBaseURL)))
                                {
                                    Directory.CreateDirectory(Server.MapPath(FileBaseURL));
                                }
                                string newFileName = CommonBAL.RemoveSpecialCharacters(fileName) + ext;
                                file.SaveAs(Path.Combine(Server.MapPath(FileBaseURL), newFileName));
                                oObject.Document.DocumentPath = ActualURL + newFileName;
                                oObject.Document.DocumentTypeId = oObject.DocumentTypeId;
                                long DocumentId = DocumentBAL.Add(oObject.Document);
                                oObject.DocumentId = DocumentId;
                                oObject.DocumentId = DocumentId;
                                DocumentId = ContactDocumentBAL.Add(oObject);

                                AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                                alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                                TempData["AlertMessage"] = alert;
                                return RedirectToAction("Index", new { Id = oObject.ContactId });

                            }
                        }
                    }


                    AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.DANGER, AlertMessageType, IIKI.BaseApp.Common.CommonStatus.AlertMessageType.INVALIDMODEL);
                    TempData["AlertMessage"] = alert;
                    return RedirectToAction("Index", new { Id = oObject.ContactId });

                }
                else
                {

                    var docTypeList = DocumentTypeBAL.GetList(IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted);
                    ViewBag.DocumentTypeList = docTypeList;

                    ViewBag.Title = IIKI.BaseApp.Localization.Resources.CommonLabels.TitleCreate;

                    return PartialView(oObject);
                }
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
                var obj = ContactDocumentBAL.Get(DeleteRecordId);

                if (System.IO.File.Exists(Server.MapPath(obj.DocumentFullName)))
                {
                    System.IO.File.Delete(Server.MapPath(obj.DocumentFullName));
                }
                DocumentBAL.Delete(DocumentBAL.Get(obj.DocumentId));
                ContactDocumentBAL.Delete(obj);

                int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                TempData["AlertMessage"] = alert;

                return RedirectToAction("Index", new { Id = obj.ContactId });

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
                var obj = ContactDocumentBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                ContactDocumentBAL.Update(obj);
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



    }
}