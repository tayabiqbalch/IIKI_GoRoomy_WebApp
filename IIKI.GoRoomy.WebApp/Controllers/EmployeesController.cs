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
    public class EmployeesController : WebAppBaseController
    {
        IdentityManager _identityManager;
        public EmployeesController()
        {
            _identityManager = new IdentityManager();
        }
        // GET: Employees
        public ActionResult Index()
        {
            try
            {
                return View(new List<Employee>());

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
                var obj = EmployeeBAL.Get(Id);

                EmployeeViewModel employeeViewModel = GetAddEditObject(obj);
                return View(employeeViewModel);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        private EmployeeViewModel GetAddEditObject(Employee obj)
        {

            EmployeeViewModel employeeViewModel = new EmployeeViewModel();
            AddressViewModel addressViewModel = new AddressViewModel();

            var objContact = ContactBAL.Get(obj.ContactId);
            if (objContact.Id <= 0)
                objContact.BirthDate = DateTime.Now;
            var objContactAddresses = ContactAddressBAL.GetDefault(obj.UserId, obj.ContactId);
            var objAddress = AddressBAL.Get(objContactAddresses.AddressId);
            var objAddressTypes = AddressTypeBAL.GetList();
            objAddress.AddressTypes = objAddressTypes;
            employeeViewModel.Employee = obj;
            objContact.LoginEmail = obj.LoginEmail;
            employeeViewModel.ContactViewModel.Contact = objContact;
            //EmployeeViewModel.Address = objAddress;
            employeeViewModel.AddressViewModel.Address = objAddress;
            employeeViewModel.AddressViewModel.ContactAddress = objContactAddresses;
            //EmployeeViewModel.ContactAddress = objContactAddresses;
            employeeViewModel.AddressViewModel.Address.Countries = CountryBAL.GetList();
            employeeViewModel.ContactViewModel.Castes = CommonBAL.GenerateDropDownSelect(CasteBAL.GetParentsList(), new Caste());
            if (objContact.CasteId > 0)
                employeeViewModel.ContactViewModel.SubCastes = CommonBAL.GenerateDropDownSelect(CasteBAL.GetList(objContact.CasteId), new Caste());
            else
                employeeViewModel.ContactViewModel.SubCastes = CommonBAL.GenerateDropDownSelect(new List<Caste>(), new Caste());

            employeeViewModel.ContactViewModel.Divisions = CommonBAL.GenerateDropDownSelect(DivisionBAL.GetList(), new Divisions());


            employeeViewModel.ContactViewModel.Genders = CommonBAL.GetGenders();
            employeeViewModel.ContactViewModel.MaritalStatuses = CommonBAL.GetMaritalStatuses();
            employeeViewModel.EmployeeTypes = CommonBAL.GetEmployeeTypes();

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
            return employeeViewModel;
        }
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[ValidateInput(false)]
        //public async Task<ActionResult> AddEdit_Test(EmployeeViewModel oObject, ContactViewModel c, string formaction = "save")
        //{
        //    return View();
        //}

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> AddEdit(ContactViewModel cObject, EmployeeViewModel oObject, AddressViewModel aObject, string formaction = "save")
        {
            //AddressViewModel AddressViewModel = new AddressViewModel();
            try
            {
                cObject.Contact.AboutContact = oObject.ContactViewModel.Contact.AboutContact;
                oObject.ContactViewModel = cObject;
                oObject.AddressViewModel = aObject;
                TryUpdateModel(oObject.Employee);
                TryUpdateModel(oObject.ContactViewModel.Contact);
                TryUpdateModel(oObject.AddressViewModel.Address);
                TryUpdateModel(oObject.AddressViewModel.ContactAddress);
                TryUpdateModel(cObject.Contact);
                TryUpdateModel(cObject);
                TryUpdateModel(aObject.Address);
                TryUpdateModel(aObject.ContactAddress);
                TryUpdateModel(aObject);
                TryUpdateModel(oObject);
                //UpdateModel(oObject.Employee);
                //UpdateModel(oObject.ContactViewModel.Contact);
                //UpdateModel(oObject.AddressViewModel.Address);
                //UpdateModel(oObject);
                ModelState.Clear();
                var modelStateErrors = this.ModelState.Keys.SelectMany(key => this.ModelState[key].Errors);

                //var oObjectEmployee = oObject.Employee;
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

                    //Employee

                    oObject.Employee.CompanyId = CurrentUser.CompanyId;
                    oObject.Employee.BranchId = CurrentUser.BranchId;
                    oObject.Employee.MainUserId = CurrentUser.SessionUserId;
                    oObject.Employee.CreatedBy = CurrentUser.SessionUserId;
                    oObject.Employee.UpdatedBy = CurrentUser.SessionUserId;
                    oObject.Employee.CreatedDate = DateTimeOffset.UtcNow;
                    oObject.Employee.UpdatedDate = DateTimeOffset.UtcNow;

                    if (oObject.Employee.IsActive)
                    {
                        oObject.Employee.RecordStatus = 1;
                    }
                    else
                    {
                        oObject.Employee.RecordStatus = 0;
                    }

                    if (Convert.ToBoolean(IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("AllowtoCreateEmployeeUser")) && string.IsNullOrEmpty(oObject.Employee.UserId))
                    {
                        cObject.Contact.IsAllowtoCreateUser = true;
                        string createdUserid = await _identityManager.RegisterNewIdentityUser(cObject.Contact.LoginEmail, "Employee", cObject.Contact.Password, cObject.Contact.CellNumber, CurrentUser.CompanyId, CurrentUser.BranchId);
                        if (!string.IsNullOrEmpty(createdUserid))
                            oObject.Employee.UserId = createdUserid;
                    }
                    else if (!string.IsNullOrEmpty(oObject.Employee.UserId))
                    {
                        string createdUserid = null;
                        if (cObject.Contact.IsUpdateLoginEmail && !string.IsNullOrEmpty(cObject.Contact.LoginEmail))
                            createdUserid = await _identityManager.SetUserInfo(new SetUserInfoViewModel() { UserId = oObject.Employee.UserId, Email = cObject.Contact.LoginEmail, NewPassword = cObject.Contact.Password, ConfirmPassword = cObject.Contact.ConfirmPassword });
                        else if (!string.IsNullOrEmpty(cObject.Contact.Password))
                            createdUserid = await _identityManager.SetNewPassword(new SetUserInfoViewModel() { UserId = oObject.Employee.UserId, Email = cObject.Contact.LoginEmail, NewPassword = cObject.Contact.Password, ConfirmPassword = cObject.Contact.ConfirmPassword });
                    }

                    var oObjectContact = EmployeeBAL.AddEdit(oObject);

                    #region upload photo
                    if (Request.Files.Count > 0 && oObjectContact != null)
                    {
                        //var oObjectContact = ContactBAL.Get(oObjectEmployee.ContactId);

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
                    if (oObject.Employee.Id > 0)
                        AlertMessageType = IIKI.BaseApp.Common.CommonStatus.AlertActionType.Update;
                    var alert = CommonBAL.SetAlertMessage(IIKI.BaseApp.Common.CommonStatus.AlertType.SUCCESS, AlertMessageType);
                    TempData["AlertMessage"] = alert;
                    if (formaction.Trim().Equals("saveadd"))
                    {
                        return RedirectToAction("AddEdit", new { Id = 0 }); ;
                    }
                    return RedirectToAction("Index");
                }
                oObject = GetAddEditObject(oObject.Employee);
                return View(oObject);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> AddEdit_Old(EmployeeViewModel oObject, string formaction = "save")
        //{
        //    AddressViewModel AddressViewModel = new AddressViewModel();
        //    try
        //    {
        //        var oObjectEmployee = oObject.Employee;
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
        //                oObjectEmployee.ContactId = oObjectContact.Id;
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


        //            if (oObjectEmployee.IsActive)
        //            {
        //                oObjectEmployee.RecordStatus = 1;
        //            }
        //            else
        //            {
        //                oObjectEmployee.RecordStatus = 0;
        //            }

        //            oObjectEmployee.CompanyId = CurrentUser.CompanyId;
        //            oObjectEmployee.BranchId = CurrentUser.BranchId;
        //            if (oObjectEmployee.Id > 0 && TryValidateModel(oObjectEmployee))
        //            {
        //                if (string.IsNullOrEmpty(oObjectEmployee.CreatedBy))
        //                {
        //                    oObjectEmployee.CreatedBy = CurrentUser.SessionUserId;
        //                    oObjectEmployee.CreatedDate = DateTime.UtcNow;
        //                }
        //                oObjectEmployee.UpdatedDate = DateTime.UtcNow;
        //                oObjectEmployee.UpdatedBy = CurrentUser.SessionUserId;
        //                EmployeeBAL.Update(oObjectEmployee);
        //            }
        //            else if (oObjectEmployee.Id <= 0 && TryValidateModel(oObjectEmployee))
        //            {
        //                oObjectEmployee.CreatedDate = DateTime.UtcNow;
        //                oObjectEmployee.CreatedBy = CurrentUser.SessionUserId;
        //                var createdUserid = await CommonIdentity.RegisterNewIdentityUser(oObjectContact.LoginEmail, "Employee", oObjectContact.Password, oObjectContact.CellNumber, CurrentUser.CompanyId, CurrentUser.BranchId);
        //                UsersProfileBAL.AddUserInformation(createdUserid, oObjectContact.Id, CurrentUser.CompanyId, CurrentUser.BranchId);
        //                oObjectEmployee.UserId = createdUserid;
        //                oObjectEmployee.Id = EmployeeBAL.Add(oObjectEmployee);
        //            }

        //            oObjectContactAddress.UserId = oObjectEmployee.UserId;
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
        //                oObjectContact = ContactBAL.Get(oObjectEmployee.ContactId);

        //                //var file = Request.Files[0];
        //                for (int i = 0; i < Request.Files.Count; i++)
        //                {
        //                    var file = Request.Files[i];
        //                    if (file != null && file.ContentLength > 0 && oObjectContact.Id > 0)
        //                    {
        //                        var fileName = Path.GetFileNameWithoutExtension(file.FileName);
        //                        string ext = Path.GetExtension(file.FileName);

        //                        string ActualURL = CommonBAL.RemoveSpecialCharacters(oObjectContact.ContactTypeName) + "/" + oObjectEmployee.Id + "/";
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
        //            if (oObjectEmployee.Id > 0)
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
        //        if (oObjectEmployee.Id > 0)
        //        {
        //            ViewBag.Title = CommonLabels.TitleEdit;

        //        }

        //        oObject.Address.Countries = CountryBAL.GetList();
        //        oObject.ContactViewModel.Castes = CasteBAL.GetParentsList();
        //        oObject.ContactViewModel.SubCastes = CasteBAL.GetList(oObjectContact.CasteId);
        //        oObject.ContactViewModel.Genders = CommonBAL.GetGenders();
        //        oObject.ContactViewModel.MaritalStatuses = CommonBAL.GetMaritalStatuses();
        //        oObject.ContactViewModel.Contact = oObject.Contact;
        //        oObject.EmployeeTypes = CommonBAL.GetEmployeeTypes();
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
                var obj = EmployeeBAL.Get(DeleteRecordId);

                ContactBAL.Delete(new Contact { Id = obj.ContactId });
                var objContactAddressList = ContactAddressBAL.GetList(null, obj.Id, false);
                foreach (var item in objContactAddressList)
                {
                    AddressBAL.Delete(new Address { Id = item.AddressId });
                    ContactAddressBAL.Delete(new ContactAddress { Id = item.Id });
                }
                EmployeeBAL.Delete(obj);

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
                var obj = EmployeeBAL.Get(DeleteRecordId);
                obj.RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Deleted;
                obj.UpdatedDate = DateTime.UtcNow;
                obj.UpdatedBy = CurrentUser.SessionUserId;
                EmployeeBAL.Update(obj);
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

                List<Employee> list = new List<Employee>();

                object[] methodParams = new object[] { 0, 0, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted, request.search.value, request.start, request.length, SortColumn, SortOrder };
                response = CommonBAL.GenerateDataTablesResponseData(list, request, new EmployeeBAL(), methodParams, IsServerSide);

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchUserDetails Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }


        /////////////
        ////Employee Addresses
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