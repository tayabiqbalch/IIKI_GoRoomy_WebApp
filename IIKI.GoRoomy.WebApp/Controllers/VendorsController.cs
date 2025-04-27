using IIKI.GoRoomy.WebApp.Utility;
using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Common;
using IIKI.BaseApp.Localization.Resources;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using IIKI.GoRoomy.WebApp.Controllers;

namespace IIKI.NoCoinApp.Web.Controllers
{
    [Authorize]
    public class VendorsController : WebAppBaseController
    {
        IdentityManager _identityManager;
        public VendorsController()
        {
            _identityManager = new IdentityManager();
        }
        // GET: Vendors
        public ActionResult Index()
        {
            try
            {
                return View(new List<Vendor>());

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
                var obj = VendorBAL.Get(Id);
                VendorViewModel vendorViewModel = GetAddEditObject(obj);
                return View(vendorViewModel);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private VendorViewModel GetAddEditObject(Vendor obj)
        {

            VendorViewModel vendorViewModel = new VendorViewModel();
            AddressViewModel addressViewModel = new AddressViewModel();

            var objContact = ContactBAL.Get(obj.ContactId);
            if (objContact.Id <= 0)
                objContact.BirthDate = DateTime.Now;
            var objContactAddresses = ContactAddressBAL.GetDefault(obj.UserId, obj.ContactId);
            var objAddress = AddressBAL.Get(objContactAddresses.AddressId);
            var objAddressTypes = AddressTypeBAL.GetList();
            objAddress.AddressTypes = objAddressTypes;
            vendorViewModel.Vendor = obj;
            objContact.LoginEmail = obj.LoginEmail;
            vendorViewModel.ContactViewModel.Contact = objContact;
            //VendorViewModel.Address = objAddress;
            vendorViewModel.AddressViewModel.Address = objAddress;
            vendorViewModel.AddressViewModel.ContactAddress = objContactAddresses;
            //VendorViewModel.ContactAddress = objContactAddresses;
            vendorViewModel.AddressViewModel.Address.Countries = CountryBAL.GetList();
            vendorViewModel.ContactViewModel.Castes = CommonBAL.GenerateDropDownSelect(CasteBAL.GetParentsList(), new Caste());
            if (objContact.CasteId > 0)
                vendorViewModel.ContactViewModel.SubCastes = CommonBAL.GenerateDropDownSelect(CasteBAL.GetList(objContact.CasteId), new Caste());
            else
                vendorViewModel.ContactViewModel.SubCastes = CommonBAL.GenerateDropDownSelect(new List<Caste>(), new Caste());

            vendorViewModel.ContactViewModel.Divisions = CommonBAL.GenerateDropDownSelect(DivisionBAL.GetList(), new Divisions());


            vendorViewModel.ContactViewModel.Genders = CommonBAL.GetGenders();
            vendorViewModel.ContactViewModel.MaritalStatuses = CommonBAL.GetMaritalStatuses();
            vendorViewModel.VendorTypes = CommonBAL.GetVendorTypes();

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
            return vendorViewModel;
        }
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[ValidateInput(false)]
        //public async Task<ActionResult> AddEdit_Test(VendorViewModel oObject, ContactViewModel c, string formaction = "save")
        //{
        //    return View();
        //}

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> AddEdit(ContactViewModel cObject, VendorViewModel oObject, AddressViewModel aObject, string formaction = "save")
        {
            //AddressViewModel AddressViewModel = new AddressViewModel();
            try
            {
                cObject.Contact.AboutContact = oObject.ContactViewModel.Contact.AboutContact;
                oObject.ContactViewModel = cObject;
                oObject.AddressViewModel = aObject;
                TryUpdateModel(oObject.Vendor);
                TryUpdateModel(oObject.ContactViewModel.Contact);
                TryUpdateModel(oObject.AddressViewModel.Address);
                TryUpdateModel(oObject.AddressViewModel.ContactAddress);
                TryUpdateModel(cObject.Contact);
                TryUpdateModel(cObject);
                TryUpdateModel(aObject.Address);
                TryUpdateModel(aObject.ContactAddress);
                TryUpdateModel(aObject);
                TryUpdateModel(oObject);
                //UpdateModel(oObject.Vendor);
                //UpdateModel(oObject.ContactViewModel.Contact);
                //UpdateModel(oObject.AddressViewModel.Address);
                //UpdateModel(oObject);
                ModelState.Clear();
                var modelStateErrors = this.ModelState.Keys.SelectMany(key => this.ModelState[key].Errors);

                //var oObjectVendor = oObject.Vendor;
                //var oObjectAddress = oObject.Address;
                //var oObjectContactAddress = oObject.ContactAddress;
                //var oObjectContact = oObject.Contact;
                if (ModelState.IsValid)
                {

                    if (cObject.Contact.Gender != null)
                    {
                        if (cObject.Contact.Gender.Equals("MALE"))
                        {
                            cObject.Contact.NameTitle = "Mr.";
                            cObject.Contact.NameTitleUrdu = "مسٹر";
                        }
                        else if (cObject.Contact.Gender.Equals("FEMALE"))
                        {
                            cObject.Contact.NameTitle = "Ms.";
                            cObject.Contact.NameTitleUrdu = "مس";
                        }
                    }

                    //using (var transaction = new System.Transactions.TransactionScope())
                    //{
                    if (cObject.Contact.BirthDate != DateTime.MinValue)
                    {
                        cObject.Contact.BirthDay = cObject.Contact.BirthDate.Day;
                        cObject.Contact.BirthMonth = cObject.Contact.BirthDate.Month;
                        cObject.Contact.BirthYear = cObject.Contact.BirthDate.Year;
                    }
                    cObject.Contact.ContactTypeId = 3;

                    aObject.ContactAddress.IsDefault = true;
                    aObject.ContactAddress.CreatedBy = CurrentUser.SessionUserId;
                    aObject.ContactAddress.UpdatedBy = CurrentUser.SessionUserId;
                    aObject.ContactAddress.CreatedDate = DateTimeOffset.UtcNow;
                    aObject.ContactAddress.UpdatedDate = DateTimeOffset.UtcNow;
                    if (aObject.ContactAddress.IsActive)
                    {
                        aObject.ContactAddress.RecordStatus = 1;
                    }
                    else
                    {
                        aObject.ContactAddress.RecordStatus = 0;
                    }

                    //Vendor

                    oObject.Vendor.CompanyId = CurrentUser.CompanyId;
                    oObject.Vendor.BranchId = CurrentUser.BranchId;
                    oObject.Vendor.MainUserId = CurrentUser.SessionUserId;
                    oObject.Vendor.CreatedBy = CurrentUser.SessionUserId;
                    oObject.Vendor.UpdatedBy = CurrentUser.SessionUserId;
                    oObject.Vendor.CreatedDate = DateTimeOffset.UtcNow;
                    oObject.Vendor.UpdatedDate = DateTimeOffset.UtcNow;

                    if (oObject.Vendor.IsActive)
                    {
                        oObject.Vendor.RecordStatus = 1;
                    }
                    else
                    {
                        oObject.Vendor.RecordStatus = 0;
                    }

                    if (Convert.ToBoolean(IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AllowtoCreateVendorUser")) && string.IsNullOrEmpty(oObject.Vendor.UserId))
                    {
                        cObject.Contact.IsAllowtoCreateUser = true;
                        string createdUserid = await _identityManager.RegisterNewIdentityUser(cObject.Contact.LoginEmail, "Vendor", cObject.Contact.Password, cObject.Contact.CellNumber, CurrentUser.CompanyId, CurrentUser.BranchId);
                        if (!string.IsNullOrEmpty(createdUserid))
                            oObject.Vendor.UserId = createdUserid;
                    }
                    else if (!string.IsNullOrEmpty(oObject.Vendor.UserId))
                    {
                        string createdUserid = null;
                        if (cObject.Contact.IsUpdateLoginEmail && !string.IsNullOrEmpty(cObject.Contact.LoginEmail))
                            createdUserid = await _identityManager.SetUserInfo(new SetUserInfoViewModel() { UserId = oObject.Vendor.UserId, Email = cObject.Contact.LoginEmail, NewPassword = cObject.Contact.Password, ConfirmPassword = cObject.Contact.ConfirmPassword });
                        else if (!string.IsNullOrEmpty(cObject.Contact.Password))
                            createdUserid = await _identityManager.SetNewPassword(new SetUserInfoViewModel() { UserId = oObject.Vendor.UserId, Email = cObject.Contact.LoginEmail, NewPassword = cObject.Contact.Password, ConfirmPassword = cObject.Contact.ConfirmPassword });
                    }

                    var oObjectContact = VendorBAL.AddEdit(oObject);

                    #region upload photo
                    if (Request.Files.Count > 0 && oObjectContact != null)
                    {
                        //var oObjectContact = ContactBAL.Get(oObjectVendor.ContactId);

                        //var file = Request.Files[0];
                        for (int i = 0; i < Request.Files.Count; i++)
                        {
                            var file = Request.Files[i];
                            if (file != null && file.ContentLength > 0 && oObjectContact.Id > 0)
                            {
                                var fileName = Path.GetFileNameWithoutExtension(file.FileName);
                                string ext = Path.GetExtension(file.FileName);

                                string ActualURL = "/" + oObjectContact.Id + "/";
                                string FileBaseURL = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("ProfileImagesPath") + ActualURL;
                                if (!Directory.Exists(Server.MapPath(FileBaseURL)))
                                {
                                    Directory.CreateDirectory(Server.MapPath(FileBaseURL));
                                }
                                string newFileName = CommonBAL.RemoveSpecialCharacters(fileName) + ext;
                                file.SaveAs(Path.Combine(Server.MapPath(FileBaseURL), newFileName));
                                ActualURL = ActualURL + newFileName;
                                oObjectContact.ContactImage = ActualURL;
                                ContactBAL.Update(oObjectContact);

                            }
                        }
                    }

                    #endregion


                    //    transaction.Complete();
                    //}
                    int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
                    if (oObject.Vendor.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                    TempData["AlertMessage"] = alert;
                    if (formaction.Trim().Equals("saveadd"))
                    {
                        return RedirectToAction("AddEdit", new { Id = 0 }); ;
                    }
                    return RedirectToAction("Index");
                }
                oObject = GetAddEditObject(oObject.Vendor);
                return View(oObject);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> AddEdit_Old(VendorViewModel oObject, string formaction = "save")
        //{
        //    AddressViewModel AddressViewModel = new AddressViewModel();
        //    try
        //    {
        //        var oObjectVendor = oObject.Vendor;
        //        var oObjectAddress = oObject.Address;
        //        var oObjectContactAddress = oObject.ContactAddress;
        //        var oObjectContact = oObject.Contact;
        //        if (ModelState.IsValid)
        //        {


        //            if (oObjectContact.Gender.Equals("MALE"))
        //            {
        //                oObjectContact.NameTitle = "Mr.";
        //                oObjectContact.NameTitleUrdu = "مسٹر";
        //            }
        //            else if (oObjectContact.Gender.Equals("FEMALE"))
        //            {
        //                oObjectContact.NameTitle = "Ms.";
        //                oObjectContact.NameTitleUrdu = "مس";
        //            }

        //            //using (var transaction = new System.Transactions.TransactionScope())
        //            //{
        //            if (oObjectContact.BirthDate != DateTime.MinValue)
        //            {
        //                oObjectContact.BirthDay = oObjectContact.BirthDate.Day;
        //                oObjectContact.BirthMonth = oObjectContact.BirthDate.Month;
        //                oObjectContact.BirthYear = oObjectContact.BirthDate.Year;
        //            }
        //            if (oObjectContact.Id > 0 && TryValidateModel(oObjectContact))
        //            {
        //                ContactBAL.Update(oObjectContact);
        //            }
        //            else if (oObjectContact.Id <= 0 && TryValidateModel(oObjectContact))
        //            {
        //                oObjectContact.ContactTypeId = 2;
        //                oObjectContact.Id = ContactBAL.Add(oObjectContact);
        //                oObjectVendor.ContactId = oObjectContact.Id;
        //            }


        //            if (oObjectAddress.Id > 0 && TryValidateModel(oObjectAddress))
        //            {
        //                AddressBAL.Update(oObjectAddress);
        //            }
        //            else if (oObjectAddress.Id <= 0 && TryValidateModel(oObjectAddress))
        //            {
        //                oObjectAddress.Id = AddressBAL.Add(oObjectAddress);
        //            }

        //            if ((oObjectAddress.AddressTypeId <= 0))
        //            {
        //                oObjectAddress.AddressTypeId = 3;
        //            }


        //            if (oObjectVendor.IsActive)
        //            {
        //                oObjectVendor.RecordStatus = 1;
        //            }
        //            else
        //            {
        //                oObjectVendor.RecordStatus = 0;
        //            }

        //            oObjectVendor.CompanyId = CurrentUser.CompanyId;
        //            oObjectVendor.BranchId = CurrentUser.BranchId;
        //            if (oObjectVendor.Id > 0 && TryValidateModel(oObjectVendor))
        //            {
        //                if (string.IsNullOrEmpty(oObjectVendor.CreatedBy))
        //                {
        //                    oObjectVendor.CreatedBy = CurrentUser.SessionUserId;
        //                    oObjectVendor.CreatedDate = DateTime.UtcNow;
        //                }
        //                oObjectVendor.UpdatedDate = DateTime.UtcNow;
        //                oObjectVendor.UpdatedBy = CurrentUser.SessionUserId;
        //                VendorBAL.Update(oObjectVendor);
        //            }
        //            else if (oObjectVendor.Id <= 0 && TryValidateModel(oObjectVendor))
        //            {
        //                oObjectVendor.CreatedDate = DateTime.UtcNow;
        //                oObjectVendor.CreatedBy = CurrentUser.SessionUserId;
        //                var createdUserid = await CommonIdentity.RegisterNewIdentityUser(oObjectContact.LoginEmail, "Vendor", oObjectContact.Password, oObjectContact.CellNumber, CurrentUser.CompanyId, CurrentUser.BranchId);
        //                UsersProfileBAL.AddUserInformation(createdUserid, oObjectContact.Id, CurrentUser.CompanyId, CurrentUser.BranchId);
        //                oObjectVendor.UserId = createdUserid;
        //                oObjectVendor.Id = VendorBAL.Add(oObjectVendor);
        //            }

        //            oObjectContactAddress.UserId = oObjectVendor.UserId;
        //            oObjectContactAddress.ContactId = oObjectContact.Id;
        //            oObjectContactAddress.AddressId = oObjectAddress.Id;
        //            oObjectContactAddress.IsDefault = true;
        //            oObjectContactAddress.RecordStatus = 1;
        //            if (oObjectContactAddress.Id > 0 && TryValidateModel(oObjectContactAddress))
        //            {
        //                oObjectContactAddress.UpdatedDate = DateTime.UtcNow;
        //                oObjectContactAddress.UpdatedBy = CurrentUser.SessionUserId;
        //                ContactAddressBAL.Update(oObjectContactAddress);
        //            }
        //            else if (oObjectContactAddress.Id <= 0 && TryValidateModel(oObjectContactAddress))
        //            {
        //                oObjectContactAddress.CreatedDate = DateTime.UtcNow;
        //                oObjectContactAddress.CreatedBy = CurrentUser.SessionUserId;
        //                oObjectContactAddress.Id = ContactAddressBAL.Add(oObjectContactAddress);
        //            }


        //            #region upload photo
        //            if (Request.Files.Count > 0)
        //            {
        //                oObjectContact = ContactBAL.Get(oObjectVendor.ContactId);

        //                //var file = Request.Files[0];
        //                for (int i = 0; i < Request.Files.Count; i++)
        //                {
        //                    var file = Request.Files[i];
        //                    if (file != null && file.ContentLength > 0 && oObjectContact.Id > 0)
        //                    {
        //                        var fileName = Path.GetFileNameWithoutExtension(file.FileName);
        //                        string ext = Path.GetExtension(file.FileName);

        //                        string ActualURL = CommonBAL.RemoveSpecialCharacters(oObjectContact.ContactTypeName) + "/" + oObjectVendor.Id + "/";
        //                        string FileBaseURL = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("ResourcesPath") + ActualURL;
        //                        if (!Directory.Exists(Server.MapPath(FileBaseURL)))
        //                        {
        //                            Directory.CreateDirectory(Server.MapPath(FileBaseURL));
        //                        }
        //                        string newFileName = CommonBAL.RemoveSpecialCharacters(fileName) + ext;
        //                        file.SaveAs(Path.Combine(Server.MapPath(FileBaseURL), newFileName));
        //                        ActualURL = ActualURL + newFileName;
        //                        oObjectContact.ContactImage = ActualURL;
        //                        ContactBAL.Update(oObjectContact);
        //                        //oObject1.CompanyLogo = ActualURL;
        //                        //CompanyBAL.Update(oObject1);
        //                    }
        //                }
        //            }

        //            #endregion


        //            //    transaction.Complete();
        //            //}
        //            int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
        //            if (oObjectVendor.Id > 0)
        //                AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
        //            var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
        //            TempData["AlertMessage"] = alert;
        //            if (formaction.Trim().Equals("saveadd"))
        //            {
        //                return RedirectToAction("AddEdit", new { Id = 0 }); ;
        //            }
        //            return RedirectToAction("Index");
        //        }

        //        ViewBag.Title = CommonLabels.TitleCreate;
        //        if (oObjectVendor.Id > 0)
        //        {
        //            ViewBag.Title = CommonLabels.TitleEdit;

        //        }

        //        oObject.Address.Countries = CountryBAL.GetList();
        //        oObject.ContactViewModel.Castes = CasteBAL.GetParentsList();
        //        oObject.ContactViewModel.SubCastes = CasteBAL.GetList(oObjectContact.CasteId);
        //        oObject.ContactViewModel.Genders = CommonBAL.GetGenders();
        //        oObject.ContactViewModel.MaritalStatuses = CommonBAL.GetMaritalStatuses();
        //        oObject.ContactViewModel.Contact = oObject.Contact;
        //        oObject.VendorTypes = CommonBAL.GetVendorTypes();
        //        var objAddressTypes = AddressTypeBAL.GetList();
        //        oObject.AddressViewModel.Address = oObject.Address;
        //        oObject.AddressViewModel.ContactAddress = oObject.ContactAddress;
        //        oObject.Address.AddressTypes = objAddressTypes;
        //        return View(oObject);

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteRecord(long DeleteRecordId)
        {
            try
            {

                VendorBAL.Delete(DeleteRecordId);

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
                var obj = VendorBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                obj.UpdatedDate = DateTime.UtcNow;
                obj.UpdatedBy = CurrentUser.SessionUserId;
                VendorBAL.Update(obj);
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

                List<Vendor> list = new List<Vendor>();

                object[] methodParams = new object[] { 0, 0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = CommonBAL.GenerateDataTablesResponseData(list, request, new VendorBAL(), methodParams, IsServerSide);

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchUserDetails Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }


        /////////////
        ////Vendor Addresses
        ////////////
        /////
        //public ActionResult Addresses(long Id)
        //{
        //    try
        //    {
        //        var list = ContactAddressBAL.GetList(null, Id, false);
        //        return View(list);

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}
        //public ActionResult AddressAddEdit(long Id)
        //{
        //    try
        //    {
        //        AddressViewModel AddressViewModel = new AddressViewModel();
        //        var obj = ContactAddressBAL.Get(Id);

        //        var objAddresses = AddressBAL.Get(obj.AddressId);
        //        objAddresses.AddressTypes = AddressTypeBAL.GetList();
        //        AddressViewModel.Address = objAddresses;
        //        AddressViewModel.ContactAddress = obj;
        //        AddressViewModel.Address.Countries = CountryBAL.GetList();

        //        ViewBag.Title = CommonLabels.TitleCreate;
        //        if (Id > 0)
        //        {
        //            ViewBag.Title = CommonLabels.TitleEdit;

        //            obj.IsActive = obj.RecordStatus == 1 ? true : false;
        //        }
        //        else
        //        {
        //            obj.IsActive = true;
        //        }


        //        return View(AddressViewModel);

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult AddressAddEdit(AddressViewModel oObject, string formaction = "save")
        //{
        //    try
        //    {
        //        var oObjectAddress = oObject.Address;
        //        var oObjectContactAddress = oObject.ContactAddress;
        //        if (ModelState.IsValid)
        //        {
        //            if (oObjectContactAddress.IsActive)
        //            {
        //                oObjectContactAddress.RecordStatus = 1;
        //            }
        //            else
        //            {
        //                oObjectContactAddress.RecordStatus = 0;
        //            }


        //            ContactAddress defaultContactAddress = new ContactAddress();




        //            if ((oObjectContactAddress.AddressTypeId <= 0))
        //                oObjectContactAddress.AddressTypeId = 3;

        //            if (oObjectContactAddress.IsDefault)
        //            {
        //                defaultContactAddress = ContactAddressBAL.GetDefault(null, oObjectContactAddress.ContactId);
        //                if (defaultContactAddress.Id > 0)
        //                {
        //                    defaultContactAddress.IsDefault = false;
        //                    ContactAddressBAL.Update(defaultContactAddress);
        //                }
        //            }
        //            {
        //                if (oObjectAddress.Id > 0 && TryValidateModel(oObjectAddress))
        //                {
        //                    AddressBAL.Update(oObjectAddress);
        //                }
        //                else if (oObjectAddress.Id <= 0 && TryValidateModel(oObjectAddress))
        //                {
        //                    oObjectAddress.Id = AddressBAL.Add(oObjectAddress);
        //                }

        //                oObjectContactAddress.AddressId = oObjectAddress.Id;
        //                if (oObjectContactAddress.Id > 0 && TryValidateModel(oObjectContactAddress))
        //                {
        //                    oObjectContactAddress.UpdatedDate = DateTime.UtcNow;
        //                    oObjectContactAddress.UpdatedBy = CurrentUser.SessionUserId;
        //                    ContactAddressBAL.Update(oObjectContactAddress);
        //                }
        //                else if (oObjectContactAddress.Id <= 0 && TryValidateModel(oObjectContactAddress))
        //                {
        //                    oObjectContactAddress.CreatedDate = DateTime.UtcNow;
        //                    oObjectContactAddress.CreatedBy = CurrentUser.SessionUserId;
        //                    oObjectContactAddress.Id = ContactAddressBAL.Add(oObjectContactAddress);
        //                }
        //            }

        //            int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Add;
        //            if (oObjectContactAddress.Id > 0)
        //                AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
        //            var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
        //            TempData["AlertMessage"] = alert;
        //            return RedirectToAction("Addresses", new { Id = oObjectContactAddress.ContactId });
        //        }

        //        ViewBag.Title = CommonLabels.TitleCreate;
        //        if (oObjectContactAddress.Id > 0)
        //        {
        //            ViewBag.Title = CommonLabels.TitleEdit;

        //        }

        //        oObject.Address.Countries = CountryBAL.GetList();

        //        return View(oObject);

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}


        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult MarkAsDeleteContactAddress(long DeleteRecordId)
        //{
        //    try
        //    {
        //        var obj = ContactAddressBAL.Get(DeleteRecordId);
        //        if (!obj.IsDefault)
        //        {
        //            obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
        //            obj.UpdatedDate = DateTime.UtcNow;
        //            obj.UpdatedBy = CurrentUser.SessionUserId;
        //            ContactAddressBAL.Update(obj);
        //            int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
        //            var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
        //            TempData["AlertMessage"] = alert;
        //        }
        //        else
        //        {
        //            int AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Delete;
        //            var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.WARNING, AlertMessageType, IIKI.BaseApp.Common.CommonStatus.AlertMessageType.DEFAULTBLOCKED);
        //            TempData["AlertMessage"] = alert;
        //        }
        //        return RedirectToAction("Addresses", new { Id = obj.Id });

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}

    }
}