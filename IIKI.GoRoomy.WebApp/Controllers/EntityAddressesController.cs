using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Localization.Resources;
using System;
using System.Collections.Generic;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Web.Mvc;
using static IIKI.BaseApp.Common.CommonStatus;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    public class EntityAddressesController : WebAppBaseController
    {
        // GET: EntityAddresses
        public ActionResult Index(string EntityTypeId, string EntityId)
        {
            try
            {
                int typeId = EntityTypeId.DecryptQueryString<int>();
                long recordId = EntityId.DecryptQueryString<long>();

                {
                    switch ((Common.EntityTypes)typeId)
                    {
                        case Common.EntityTypes.Hotels:
                            if (recordId == 0)
                            {
                                return RedirectToAction("Index", "Hotels");
                            }
                            break;
                        default:
                            if (recordId == 0)
                            {
                                return RedirectToAction("Index", "Dashboard");
                            }

                            break;
                    }
                }
                ViewBag.EntityId = recordId;
                ViewBag.EntityTypeId = typeId;
                var list = EntityAddressBAL.GetList(typeId, recordId);
                return View(list);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ActionResult AddEdit(long Id, int EntityTypeId = 0, long EntityId = 0)
        {
            try
            {
                //long contactId = Convert.ToInt64(ContactId.DecryptQueryString());

                //if (!ContactAddressBAL.CheckRecordExistsById(UserId, pEntityTypeId: (int)IIKI.BaseApp.Common.EntityTypes.Users, pColumnName: "Id"))
                //    throw new Exception($"No {IIKI.BaseApp.Common.EntityTypes.Users} found with specified id.");

                //if (!ContactAddressBAL.CheckRecordExistsById(contactId.ToString(), pEntityTypeId: (int)IIKI.BaseApp.Common.EntityTypes.Contacts, pColumnName: "Id"))
                //    throw new Exception($"No {IIKI.BaseApp.Common.EntityTypes.Contacts} found with specified id.");

                var obj = EntityAddressBAL.Get(Id);
                //obj.ContactId = Id > 0 ? obj.ContactId : contactId;
                //obj.UserId = Id > 0 ? obj.UserId : UserId;
                if (obj.Id == 0 && (EntityTypeId == 0 || EntityId == 0))
                {
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.DANGER, IIKI.BaseApp.Common.CommonStatus.AlertActionType.Other, IIKI.BaseApp.Common.CommonStatus.AlertMessageType.BLOCKED);
                    TempData["AlertMessage"] = alert;
                    return RedirectToAction("Index", "Dashboard", new { ErrorMessage = "Invalid entity type or entity not defined in the system. Please use the correct method to edit the entity record." });
                }
                else if (obj.Id == 0)
                {
                    obj.EntityTypeId = EntityTypeId;
                    obj.EntityId = EntityId;
                }

                var AddressViewModel = GetAddEditObject(obj);



                return View(AddressViewModel);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        private AddressViewModel GetAddEditObject(EntityAddress obj)
        {

            Address objAddresses = new Address();
            // Define custom mapping for mismatched property names
            var customMappings = new Dictionary<string, string>
                {
                    { "Id", "AddressId" } // Map destination.Id to source.AddressId
                };
            IIKI.BaseApp.Common.Mapper.MapProperties(obj, objAddresses, customMappings);

            //var objAddresses = AddressBAL.Get(obj.AddressId);

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
            AddressViewModel AddressViewModel = new AddressViewModel();
            AddressViewModel.Address = objAddresses;
            AddressViewModel.EntityAddress = obj;
            AddressViewModel.Address.Countries = CountryBAL.GetList();
            AddressViewModel.Address.AddressTypes = AddressTypeBAL.GetList();
            return AddressViewModel;
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddEdit(AddressViewModel oObject, string formaction = "save")
        {
            try
            {
                var oObjectAddress = oObject.Address;

                var oObjectEntityAddress = oObject.EntityAddress;
                if (ModelState.IsValid)
                {
                    if (oObjectEntityAddress.IsActive)
                    {
                        oObjectEntityAddress.RecordStatus = 1;
                    }
                    else
                    {
                        oObjectEntityAddress.RecordStatus = 0;
                    }


                    EntityAddress defaultAddress = new EntityAddress();
                    defaultAddress = EntityAddressBAL.GetDefault(oObjectEntityAddress.EntityTypeId, oObjectEntityAddress.EntityId);


                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);


                    if ((oObjectEntityAddress.AddressTypeId <= 0))
                        oObjectEntityAddress.AddressTypeId = 3;

                    if (oObjectEntityAddress.IsDefault && oObjectEntityAddress.Id != defaultAddress.Id)
                    {
                        if (defaultAddress.Id > 0)
                        {
                            defaultAddress.IsDefault = false;
                            EntityAddressBAL.Update(defaultAddress);
                        }
                    }
                    else if (defaultAddress.Id > 0 && oObjectEntityAddress.Id == defaultAddress.Id)
                    {
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                        alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.WARNING, AlertMessageType, IIKI.BaseApp.Common.CommonStatus.AlertMessageType.DEFAULTBLOCKED);
                        TempData["AlertMessage"] = alert;
                        return RedirectToAction("Index", new { EntityTypeId = oObjectEntityAddress.EntityTypeId.EncryptQueryString(), EntityId = oObjectEntityAddress.EntityId.EncryptQueryString() });
                    }

                    if (oObjectAddress.Id > 0 && TryValidateModel(oObjectAddress))
                    {
                        AddressBAL.Update(oObjectAddress);
                    }
                    else if (oObjectAddress.Id <= 0 && TryValidateModel(oObjectAddress))
                    {
                        oObjectAddress.Id = AddressBAL.Add(oObjectAddress);
                    }

                    oObjectEntityAddress.AddressId = oObjectAddress.Id;
                    if (oObjectEntityAddress.Id > 0 && TryValidateModel(oObject))
                    {
                        oObjectEntityAddress.UpdatedDate = DateTime.UtcNow;
                        oObjectEntityAddress.UpdatedBy = CurrentUser.SessionUserId;
                        EntityAddressBAL.Update(oObjectEntityAddress);
                    }
                    else if (oObjectEntityAddress.Id <= 0 && TryValidateModel(oObject))
                    {
                        oObjectEntityAddress.CreatedDate = DateTime.UtcNow;
                        oObjectEntityAddress.CreatedBy = CurrentUser.SessionUserId;
                        oObjectEntityAddress.Id = EntityAddressBAL.Add(oObjectEntityAddress);
                    }


                    AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObjectEntityAddress.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                    TempData["AlertMessage"] = alert;
                    return RedirectToAction("Index", new { EntityTypeId = oObjectEntityAddress.EntityTypeId.EncryptQueryString(), EntityId = oObjectEntityAddress.EntityId.EncryptQueryString() });
                }

                ViewBag.Title = CommonLabels.TitleCreate;
                if (oObjectEntityAddress.Id > 0)
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
                var obj = EntityAddressBAL.Get(DeleteRecordId);

                AddressBAL.Delete(new Address { Id = obj.AddressId });

                EntityAddressBAL.Delete(obj);

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
                var obj = EntityAddressBAL.Get(MarkAsDeleteRecordId);
                if (!obj.IsDefault)
                {
                    obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                    obj.UpdatedDate = DateTime.UtcNow;
                    obj.UpdatedBy = CurrentUser.SessionUserId;
                    EntityAddressBAL.Update(obj);
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
                return RedirectToAction("Index", new { EntityTypeId = obj.EntityTypeId.EncryptQueryString(), EntityId = obj.EntityId.EncryptQueryString() });

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}