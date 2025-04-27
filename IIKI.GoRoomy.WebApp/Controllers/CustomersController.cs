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

namespace IIKI.GoRoomy.WebApp.Controllers
{
    [Authorize]
    public class CustomersController : WebAppBaseController
    {
        IdentityManager _identityManager;
        public CustomersController()
        {
            _identityManager = new IdentityManager();
        }
        // GET: Customers
        public ActionResult Index()
        {
            try
            {
                return View(new List<Customer>());

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
                var obj = CustomerBAL.Get(Id);

                CustomerViewModel customerViewModel = GetAddEditObject(obj);

                return View(customerViewModel);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        private CustomerViewModel GetAddEditObject(Customer obj)
        {
            CustomerViewModel customerViewModel = new CustomerViewModel();
            AddressViewModel addressViewModel = new AddressViewModel();

            var objContact = ContactBAL.Get(obj.ContactId);
            if (objContact.Id <= 0)
                objContact.BirthDate = DateTime.Now;
            var objContactAddresses = ContactAddressBAL.GetDefault(obj.UserId, obj.ContactId);
            var objAddress = AddressBAL.Get(objContactAddresses.AddressId);
            var objAddressTypes = AddressTypeBAL.GetList();
            objAddress.AddressTypes = objAddressTypes;
            customerViewModel.Customer = obj;
            objContact.LoginEmail = obj.LoginEmail;
            customerViewModel.ContactViewModel.Contact = objContact;
            //CustomerViewModel.Address = objAddress;
            customerViewModel.AddressViewModel.Address = objAddress;
            customerViewModel.AddressViewModel.ContactAddress = objContactAddresses;
            //CustomerViewModel.ContactAddress = objContactAddresses;
            customerViewModel.AddressViewModel.Address.Countries = CountryBAL.GetList();
            customerViewModel.ContactViewModel.Castes = CommonBAL.GenerateDropDownSelect(CasteBAL.GetParentsList(), new Caste());
            if (objContact.CasteId > 0)
                customerViewModel.ContactViewModel.SubCastes = CommonBAL.GenerateDropDownSelect(CasteBAL.GetList(objContact.CasteId), new Caste());
            else
                customerViewModel.ContactViewModel.SubCastes = CommonBAL.GenerateDropDownSelect(new List<Caste>(), new Caste());

            customerViewModel.ContactViewModel.Divisions = CommonBAL.GenerateDropDownSelect(DivisionBAL.GetList(), new Divisions());


            customerViewModel.ContactViewModel.Genders = CommonBAL.GetGenders();
            customerViewModel.ContactViewModel.MaritalStatuses = CommonBAL.GetMaritalStatuses();
            customerViewModel.CustomerTypes = CommonBAL.GetCustomerTypes();

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
            return customerViewModel;
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> AddEdit(ContactViewModel cObject, CustomerViewModel oObject, AddressViewModel aObject, string formaction = "save")
        {
            //AddressViewModel AddressViewModel = new AddressViewModel();
            try
            {
                cObject.Contact.AboutContact = oObject.ContactViewModel.Contact.AboutContact;
                oObject.ContactViewModel = cObject;
                oObject.AddressViewModel = aObject;
                TryUpdateModel(oObject.Customer);
                TryUpdateModel(oObject.ContactViewModel.Contact);
                TryUpdateModel(oObject.AddressViewModel.Address);
                TryUpdateModel(oObject.AddressViewModel.ContactAddress);
                TryUpdateModel(cObject.Contact);
                TryUpdateModel(cObject);
                TryUpdateModel(aObject.Address);
                TryUpdateModel(aObject.ContactAddress);
                TryUpdateModel(aObject);
                TryUpdateModel(oObject);
                //UpdateModel(oObject.Customer);
                //UpdateModel(oObject.ContactViewModel.Contact);
                //UpdateModel(oObject.AddressViewModel.Address);
                //UpdateModel(oObject);
                ModelState.Clear();
                var modelStateErrors = this.ModelState.Keys.SelectMany(key => this.ModelState[key].Errors);

                //var oObjectCustomer = oObject.Customer;
                //var oObjectAddress = oObject.Address;
                //var oObjectContactAddress = oObject.ContactAddress;
                //var oObjectContact = oObject.Contact;
                if (ModelState.IsValid)
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

                    //using (var transaction = new System.Transactions.TransactionScope())
                    //{
                    if (cObject.Contact.BirthDate != DateTime.MinValue)
                    {
                        cObject.Contact.BirthDay = cObject.Contact.BirthDate.Day;
                        cObject.Contact.BirthMonth = cObject.Contact.BirthDate.Month;
                        cObject.Contact.BirthYear = cObject.Contact.BirthDate.Year;
                    }
                    cObject.Contact.ContactTypeId = 2;

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

                    //Customer

                    oObject.Customer.CompanyId = CurrentUser.CompanyId;
                    oObject.Customer.BranchId = CurrentUser.BranchId;
                    oObject.Customer.MainUserId = CurrentUser.SessionUserId;
                    oObject.Customer.CreatedBy = CurrentUser.SessionUserId;
                    oObject.Customer.UpdatedBy = CurrentUser.SessionUserId;
                    oObject.Customer.CreatedDate = DateTimeOffset.UtcNow;
                    oObject.Customer.UpdatedDate = DateTimeOffset.UtcNow;

                    if (oObject.Customer.IsActive)
                    {
                        oObject.Customer.RecordStatus = 1;
                    }
                    else
                    {
                        oObject.Customer.RecordStatus = 0;
                    }

                    if (Convert.ToBoolean(IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AllowtoCreateCustomerUser")) && string.IsNullOrEmpty(oObject.Customer.UserId))
                    {
                        cObject.Contact.IsAllowtoCreateUser = true;
                        string createdUserid = await _identityManager.RegisterNewIdentityUser(cObject.Contact.LoginEmail, "Customer", cObject.Contact.Password, cObject.Contact.CellNumber, CurrentUser.CompanyId, CurrentUser.BranchId);
                        if (!string.IsNullOrEmpty(createdUserid))
                            oObject.Customer.UserId = createdUserid;
                    }
                    else if (!string.IsNullOrEmpty(oObject.Customer.UserId))
                    {
                        string createdUserid = null;
                        if (cObject.Contact.IsUpdateLoginEmail && !string.IsNullOrEmpty(cObject.Contact.LoginEmail))
                            createdUserid = await _identityManager.SetUserInfo(new SetUserInfoViewModel() { UserId = oObject.Customer.UserId, Email = cObject.Contact.LoginEmail, NewPassword = cObject.Contact.Password, ConfirmPassword = cObject.Contact.ConfirmPassword });
                        else if (!string.IsNullOrEmpty(cObject.Contact.Password))
                            createdUserid = await _identityManager.SetNewPassword(new SetUserInfoViewModel() { UserId = oObject.Customer.UserId, Email = cObject.Contact.LoginEmail, NewPassword = cObject.Contact.Password, ConfirmPassword = cObject.Contact.ConfirmPassword });
                    }

                    var oObjectContact = CustomerBAL.AddEdit(oObject);

                    #region upload photo
                    if (Request.Files.Count > 0 && oObjectContact != null)
                    {
                        //var oObjectContact = ContactBAL.Get(oObjectCustomer.ContactId);

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
                    if (oObject.Customer.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                    TempData["AlertMessage"] = alert;
                    if (formaction.Trim().Equals("saveadd"))
                    {
                        return RedirectToAction("AddEdit", new { Id = 0 }); ;
                    }
                    return RedirectToAction("Index");
                }

                oObject = GetAddEditObject(oObject.Customer);

                return View(oObject);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> AddEdit_Old(CustomerViewModel oObject, string formaction = "save")
        //{
        //    AddressViewModel AddressViewModel = new AddressViewModel();
        //    try
        //    {
        //        var oObjectCustomer = oObject.Customer;
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
        //                oObjectCustomer.ContactId = oObjectContact.Id;
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


        //            if (oObjectCustomer.IsActive)
        //            {
        //                oObjectCustomer.RecordStatus = 1;
        //            }
        //            else
        //            {
        //                oObjectCustomer.RecordStatus = 0;
        //            }

        //            oObjectCustomer.CompanyId = CurrentUser.CompanyId;
        //            oObjectCustomer.BranchId = CurrentUser.BranchId;
        //            if (oObjectCustomer.Id > 0 && TryValidateModel(oObjectCustomer))
        //            {
        //                if (string.IsNullOrEmpty(oObjectCustomer.CreatedBy))
        //                {
        //                    oObjectCustomer.CreatedBy = CurrentUser.SessionUserId;
        //                    oObjectCustomer.CreatedDate = DateTime.UtcNow;
        //                }
        //                oObjectCustomer.UpdatedDate = DateTime.UtcNow;
        //                oObjectCustomer.UpdatedBy = CurrentUser.SessionUserId;
        //                CustomerBAL.Update(oObjectCustomer);
        //            }
        //            else if (oObjectCustomer.Id <= 0 && TryValidateModel(oObjectCustomer))
        //            {
        //                oObjectCustomer.CreatedDate = DateTime.UtcNow;
        //                oObjectCustomer.CreatedBy = CurrentUser.SessionUserId;
        //                var createdUserid = await CommonIdentity.RegisterNewIdentityUser(oObjectContact.LoginEmail, "Customer", oObjectContact.Password, oObjectContact.CellNumber, CurrentUser.CompanyId, CurrentUser.BranchId);
        //                UsersProfileBAL.AddUserInformation(createdUserid, oObjectContact.Id, CurrentUser.CompanyId, CurrentUser.BranchId);
        //                oObjectCustomer.UserId = createdUserid;
        //                oObjectCustomer.Id = CustomerBAL.Add(oObjectCustomer);
        //            }

        //            oObjectContactAddress.UserId = oObjectCustomer.UserId;
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
        //                oObjectContact = ContactBAL.Get(oObjectCustomer.ContactId);

        //                //var file = Request.Files[0];
        //                for (int i = 0; i < Request.Files.Count; i++)
        //                {
        //                    var file = Request.Files[i];
        //                    if (file != null && file.ContentLength > 0 && oObjectContact.Id > 0)
        //                    {
        //                        var fileName = Path.GetFileNameWithoutExtension(file.FileName);
        //                        string ext = Path.GetExtension(file.FileName);

        //                        string ActualURL = CommonBAL.RemoveSpecialCharacters(oObjectContact.ContactTypeName) + "/" + oObjectCustomer.Id + "/";
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
        //            if (oObjectCustomer.Id > 0)
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
        //        if (oObjectCustomer.Id > 0)
        //        {
        //            ViewBag.Title = CommonLabels.TitleEdit;

        //        }

        //        oObject.Address.Countries = CountryBAL.GetList();
        //        oObject.ContactViewModel.Castes = CasteBAL.GetParentsList();
        //        oObject.ContactViewModel.SubCastes = CasteBAL.GetList(oObjectContact.CasteId);
        //        oObject.ContactViewModel.Genders = CommonBAL.GetGenders();
        //        oObject.ContactViewModel.MaritalStatuses = CommonBAL.GetMaritalStatuses();
        //        oObject.ContactViewModel.Contact = oObject.Contact;
        //        oObject.CustomerTypes = CommonBAL.GetCustomerTypes();
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
                var obj = CustomerBAL.Get(DeleteRecordId);

                ContactBAL.Delete(new Contact { Id = obj.ContactId });
                var objContactAddressList = ContactAddressBAL.GetList(null, obj.Id, false);
                foreach (var item in objContactAddressList)
                {
                    AddressBAL.Delete(new Address { Id = item.AddressId });
                    ContactAddressBAL.Delete(new ContactAddress { Id = item.Id });
                }
                CustomerBAL.Delete(obj);

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
                var obj = CustomerBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                obj.UpdatedDate = DateTime.UtcNow;
                obj.UpdatedBy = CurrentUser.SessionUserId;
                CustomerBAL.Update(obj);
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
        public ActionResult SearchDataTableRecords(IIKI.BaseApp.Common.CommonObjects.DataTablesParam request, FormCollection formCollection, bool IsServerSide = false, string CustomerCode = null, string FirstName = null, string LastName = null, string EmailAddress = null, string CellNumber = null)
        {
            int SortColumn = 2;
            var formCollectionsList = formCollection.AllKeys
                .Where(x=> x.StartsWith("IIKISearchForm_"))
    .ToDictionary(k => k.Replace("IIKISearchForm_", String.Empty), k => formCollection[k]);
            Dictionary<string, string> keyValuePairs = new Dictionary<string, string>();
           keyValuePairs=CommonBAL.ParseQueryString(formCollectionsList?.FirstOrDefault().Value);
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

                List<Customer> list = new List<Customer>();

                object[] methodParams = new object[] { 0, 0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder, keyValuePairs };
                response = CommonBAL.GenerateDataTablesResponseData(list, request, new CustomerBAL(), methodParams, IsServerSide);

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchUserDetails Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }


        /////////////
        ////Customer Addresses
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