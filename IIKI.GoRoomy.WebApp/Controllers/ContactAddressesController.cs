using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Localization.Resources;
using System;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    public class ContactAddressesController : WebAppBaseController
    {
        // GET: ContactAddress
        public ActionResult Index(long Id, string EntityId)
        {
            try
            {
                ViewBag.ContactId = Id;
                ViewBag.UserId = EntityId;
                var list = ContactAddressBAL.GetList(EntityId, Id, false);
                return View(list);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult AddEdit(long Id, string ContactId, string UserId)
        {
            try
            {
                long contactId = Convert.ToInt64(ContactId.Decrypt());

                if (!ContactAddressBAL.CheckRecordExistsById(UserId, pEntityTypeId: (int)IIKI.BaseApp.Common.EntityTypes.Users, pColumnName: "Id"))
                    throw new Exception($"No {IIKI.BaseApp.Common.EntityTypes.Users} found with specified id.");

                if (!ContactAddressBAL.CheckRecordExistsById(contactId.ToString(), pEntityTypeId: (int)IIKI.BaseApp.Common.EntityTypes.Contacts, pColumnName: "Id"))
                    throw new Exception($"No {IIKI.BaseApp.Common.EntityTypes.Contacts} found with specified id.");

                AddressViewModel AddressViewModel = new AddressViewModel();
                var obj = ContactAddressBAL.Get(Id);
                obj.ContactId = Id > 0 ? obj.ContactId : contactId;
                obj.UserId = Id > 0 ? obj.UserId : UserId;
                var objAddresses = AddressBAL.Get(obj.AddressId);
                objAddresses.AddressTypes = AddressTypeBAL.GetList();
                AddressViewModel.Address = objAddresses;
                AddressViewModel.ContactAddress = obj;
                AddressViewModel.Address.Countries = CountryBAL.GetList();

                ViewBag.Title = CommonLabels.TitleCreate;
                if (Id > 0)
                {
                    ViewBag.Title = CommonLabels.TitleEdit;

                    obj.IsActive = obj.RecordStatus == 1 ? true : false;
                }
                else
                {
                    obj.IsActive = true;
                }


                return View(AddressViewModel);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddEdit(AddressViewModel oObject, string formaction = "save")
        {
            try
            {
                var oObjectAddress = oObject.Address;
                var oObjectContactAddress = oObject.ContactAddress;
                if (ModelState.IsValid)
                {
                    if (oObjectContactAddress.IsActive)
                    {
                        oObjectContactAddress.RecordStatus = 1;
                    }
                    else
                    {
                        oObjectContactAddress.RecordStatus = 0;
                    }


                    ContactAddress defaultContactAddress = new ContactAddress();
                    defaultContactAddress = ContactAddressBAL.GetDefault(null, oObjectContactAddress.ContactId);


                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);


                    if ((oObjectContactAddress.AddressTypeId <= 0))
                        oObjectContactAddress.AddressTypeId = 3;

                    if (oObjectContactAddress.IsDefault && oObjectContactAddress.Id != defaultContactAddress.Id)
                    {
                        if (defaultContactAddress.Id > 0)
                        {
                            defaultContactAddress.IsDefault = false;
                            ContactAddressBAL.Update(defaultContactAddress);
                        }
                    }
                    else if (defaultContactAddress.Id > 0 && oObjectContactAddress.Id == defaultContactAddress.Id)
                    {
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                        alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.WARNING, AlertMessageType, IIKI.BaseApp.Common.CommonStatus.AlertMessageType.DEFAULTBLOCKED);
                        TempData["AlertMessage"] = alert;
                        return RedirectToAction("Index", new { Id = oObjectContactAddress.ContactId, EntityId = oObjectContactAddress.UserId });
                    }

                    if (oObjectAddress.Id > 0 && TryValidateModel(oObjectAddress))
                    {
                        AddressBAL.Update(oObjectAddress);
                    }
                    else if (oObjectAddress.Id <= 0 && TryValidateModel(oObjectAddress))
                    {
                        oObjectAddress.Id = AddressBAL.Add(oObjectAddress);
                    }

                    oObjectContactAddress.AddressId = oObjectAddress.Id;
                    if (oObjectContactAddress.Id > 0 && TryValidateModel(oObjectContactAddress))
                    {
                        oObjectContactAddress.UpdatedDate = DateTime.UtcNow;
                        oObjectContactAddress.UpdatedBy = CurrentUser.SessionUserId;
                        ContactAddressBAL.Update(oObjectContactAddress);
                    }
                    else if (oObjectContactAddress.Id <= 0 && TryValidateModel(oObjectContactAddress))
                    {
                        oObjectContactAddress.CreatedDate = DateTime.UtcNow;
                        oObjectContactAddress.CreatedBy = CurrentUser.SessionUserId;
                        oObjectContactAddress.Id = ContactAddressBAL.Add(oObjectContactAddress);
                    }


                    AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObjectContactAddress.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                    TempData["AlertMessage"] = alert;
                    return RedirectToAction("Index", new { Id = oObjectContactAddress.ContactId, EntityId = oObjectContactAddress.UserId });
                }

                ViewBag.Title = CommonLabels.TitleCreate;
                if (oObjectContactAddress.Id > 0)
                {
                    ViewBag.Title = CommonLabels.TitleEdit;

                }

                oObject.Address.Countries = CountryBAL.GetList();

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
                var obj = ContactAddressBAL.Get(DeleteRecordId);

                AddressBAL.Delete(new Address { Id = obj.AddressId });

                ContactAddressBAL.Delete(obj);

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
        public ActionResult MarkAsDeleteRecord(long MarkAsDeleteRecordId)
        {
            try
            {
                var obj = ContactAddressBAL.Get(MarkAsDeleteRecordId);
                if (!obj.IsDefault)
                {
                    obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                    obj.UpdatedDate = DateTime.UtcNow;
                    obj.UpdatedBy = CurrentUser.SessionUserId;
                    ContactAddressBAL.Update(obj);
                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                    TempData["AlertMessage"] = alert;
                }
                else
                {
                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.WARNING, AlertMessageType, IIKI.BaseApp.Common.CommonStatus.AlertMessageType.DEFAULTBLOCKED);
                    TempData["AlertMessage"] = alert;
                }
                return RedirectToAction("Index", new { Id = obj.Id, EntityId = obj.UserId });

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}