using IIKI.GoRoomy.WebApp.Utility;
using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Localization.Resources;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    [Authorize]
    public class ProfileController : WebAppBaseController
    {

        // GET: Members/Profile
        public ActionResult Index()
        {
            try
            {
                UserProfileViewModel userProfileViewModel = new UserProfileViewModel();
                UserInfo oUserInfo = UsersProfileBAL.GetUserInfo(CurrentUser.UserId);
                var objContactAddress = ContactAddressBAL.GetDefault(CurrentUser.SessionUserId, oUserInfo.ContactId);
                AddressViewModel AddressViewModel = new AddressViewModel();
                AddressViewModel.ContactAddress = objContactAddress;
                var objAddress = AddressBAL.Get(objContactAddress.AddressId);
                var objAddressTypes = AddressTypeBAL.GetList();
                objAddress.AddressTypes = objAddressTypes;
                ViewBag.ProfileImage = UserIdentity.GetProfileImage();

                userProfileViewModel.UserProfileInfo = oUserInfo;
                userProfileViewModel.UserProfileInfo.ContactImage = UserIdentity.GetProfileImage();

                return View(userProfileViewModel);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ActionResult ViewAddresses()
        {
            try
            {
                var ContactAddressesList = ContactAddressBAL.GetList(CurrentUser.SessionUserId, 0, true, IIKI.BaseApp.Common.CommonStatus.RecordStatus.NonDeleted);
                return View(ContactAddressesList);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public ActionResult AddEditAddress(long Id = 0)
        {
            try
            {
                var objContactAddress = ContactAddressBAL.Get(Id);
                AddressViewModel AddressViewModel = new AddressViewModel();
                var objAddress = AddressBAL.Get(objContactAddress.AddressId);
                var objAddressTypes = AddressTypeBAL.GetList();
                objAddress.AddressTypes = objAddressTypes;
                List<Country> CountryList = CountryBAL.GetList();
                objAddress.Countries = CountryList;

                ViewBag.Title = CommonLabels.TitleCreate;
                if (Id > 0)
                {
                    ViewBag.Title = CommonLabels.TitleEdit;
                    objContactAddress.IsActive = objContactAddress.RecordStatus == 1 ? true : false;
                }
                else
                {
                    objContactAddress.UserId = CurrentUser.SessionUserId;
                    objContactAddress.IsActive = true;
                }
                AddressViewModel.Address = objAddress;
                AddressViewModel.ContactAddress = objContactAddress;
                return View(AddressViewModel);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [ChildActionOnly]
        public PartialViewResult AddEditDefaultAddress()
        {
            try
            {
                AddressViewModel AddressViewModel = new AddressViewModel();

                var objContactAddress = ContactAddressBAL.GetDefault(CurrentUser.SessionUserId, CurrentUser.ContactId);
                var objAddress = AddressBAL.Get(objContactAddress.AddressId);
                var objAddressTypes = AddressTypeBAL.GetList();
                objAddress.AddressTypes = objAddressTypes;
                List<Country> CountryList = CountryBAL.GetList();
                objAddress.Countries = CountryList;

                objContactAddress.IsDefault = true;
                objContactAddress.IsActive = true;
                objContactAddress.UserId = CurrentUser.SessionUserId;

                AddressViewModel.Address = objAddress;
                AddressViewModel.ContactAddress = objContactAddress;
                return PartialView("AddEditDefaultAddress", AddressViewModel);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult AddEditAddress(AddressViewModel oObject, bool IsDefaultAddress = false)
        {
            try
            {
                var oObjectAddress = oObject.Address;
                var oObjectContactAddress = oObject.ContactAddress;
                var errors = ModelState.Values.SelectMany(v => v.Errors);

                if (oObjectContactAddress.IsActive)
                {
                    oObjectContactAddress.RecordStatus = 1;
                }
                else
                {
                    oObjectContactAddress.RecordStatus = 0;
                }
                ContactAddress defaultContactAddress = new ContactAddress();
                if (oObjectContactAddress.IsDefault && !IsDefaultAddress)
                {
                    defaultContactAddress = ContactAddressBAL.GetDefault(null, oObjectContactAddress.ContactId);
                    if (defaultContactAddress.Id > 0)
                    {
                        defaultContactAddress.IsDefault = false;
                        oObjectContactAddress.UpdatedDate = DateTime.UtcNow;
                        oObjectContactAddress.UpdatedBy = CurrentUser.SessionUserId;
                        ContactAddressBAL.Update(defaultContactAddress);
                    }
                }
                else if (IsDefaultAddress)
                {
                    oObjectContactAddress.IsDefault = true;
                }

                if ((oObjectContactAddress.AddressTypeId <= 0))
                    oObjectContactAddress.AddressTypeId = 3;

                if (!ModelState.IsValid && !IsDefaultAddress)
                {
                    return RedirectToAction("AddEditAddress", "Profile", new { id = 0 });
                }
                else if (!ModelState.IsValid && IsDefaultAddress)
                {
                    return RedirectToAction("Index");
                }


                if (oObjectAddress.Id > 0 && TryValidateModel(oObjectAddress))
                {
                    AddressBAL.Update(oObjectAddress);
                }
                else if (oObjectAddress.Id <= 0 && TryValidateModel(oObjectAddress))
                {
                    oObjectContactAddress.AddressId = AddressBAL.Add(oObjectAddress);
                }

                if (oObjectContactAddress.Id > 0 && TryValidateModel(oObjectContactAddress))
                {
                    oObjectContactAddress.UpdatedDate = DateTime.UtcNow;
                    oObjectContactAddress.UpdatedBy = CurrentUser.SessionUserId;
                    ContactAddressBAL.Update(oObjectContactAddress);
                }
                else if (oObjectAddress.Id <= 0 && TryValidateModel(oObjectAddress))
                {
                    oObjectContactAddress.UserId = CurrentUser.UserId;
                    oObjectContactAddress.CreatedBy = CurrentUser.UserId;
                    oObjectContactAddress.CreatedDate = DateTime.Now;
                    ContactAddressBAL.Add(oObjectContactAddress);
                }


                if (!IsDefaultAddress)
                {
                    return RedirectToAction("ViewAddresses");
                }
                else if (IsDefaultAddress)
                {
                    return RedirectToAction("Index");
                }

                var objAddressTypes = AddressTypeBAL.GetList();
                oObject.Address.AddressTypes = objAddressTypes;
                List<Country> CountryList = CountryBAL.GetList();
                oObject.Address.Countries = CountryList;

                return View(oObject);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [ChildActionOnly]
        public ActionResult AddEditUserInfo()
        {
            try
            {
                UserInfo oUserInformation = new UserInfo();
                oUserInformation = UsersProfileBAL.GetUserInfo(CurrentUser.UserId);
                return PartialView("AddEditUserInfo", oUserInformation);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteContactAddress(long DeleteRecordId)
        {
            try
            {
                var oRecord = ContactAddressBAL.Get(DeleteRecordId);
                // oRecord.IsDeleted = true;
                //var result = UsersProfileBAL.UpdateContactAddress(oRecord);
                var result = ContactAddressBAL.Delete(oRecord);

                return RedirectToAction("ViewAddresses");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult MarkAsDeleteContactAddress(long DeleteRecordId)
        {
            try
            {
                var obj = ContactAddressBAL.Get(DeleteRecordId);
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
                return RedirectToAction("ViewAddresses");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult AddEditUserInfo(UserInformationInsert oUserInformationupdate)
        {
            try
            {
                bool result = false;
                var errors = ModelState.Values.SelectMany(v => v.Errors);


                if (!ModelState.IsValid)
                {
                    return RedirectToAction("AddEditUserInfo", "Profile", new { id = 0 });
                }

                if (oUserInformationupdate.UserId != "" && oUserInformationupdate.UserId != null && oUserInformationupdate.UserId != String.Empty)
                {
                    result = UsersProfileBAL.UpdateUserInformantion(oUserInformationupdate);
                }
                else
                {
                    //Some kind of error message.
                }

                if (result == true)
                {
                    return Redirect("/Profile/Index");
                    //return RedirectToAction("Index");
                }

                return View(oUserInformationupdate);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [ChildActionOnly]
        public ActionResult ChangePassword()
        {
            try
            {
                UserInfo oUserInformation = new UserInfo();
                oUserInformation = UsersProfileBAL.GetUserInfo(CurrentUser.UserId);
                return PartialView("ChangePassword", oUserInformation);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public static string GenerateIPNKey()
        {
            return CommonBAL.RandomString(IIKI.BaseApp.Common.CommonStatus.RemdomStringLength.LengthMedium);
        }

        [HttpPost]
        public ContentResult UploadProfileImage()
        {
            try
            {
                // UserProfile oUserProfile = new UserProfile();
                // oUserProfile = CurrentUser.GetProfile();

                bool IsValidFile = false;
                HttpPostedFileBase hpf = Request.Files[0] as HttpPostedFileBase;

                string strPath = ViewBag.UserImagesPath = CurrentUser.UserResourcesPath + "/" + CurrentUser.ContactId + "/";// IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("ResourcesPath") + CurrentUser.RoleName.Replace(" ","") +"/"+ CurrentUser.SessionUserId.ToString() + "/UserProfileImages/";
                strPath = strPath.Replace("..", "~");
                if (!Directory.Exists(Server.MapPath(strPath)))
                {
                    Directory.CreateDirectory(Server.MapPath(strPath));
                }
                else
                {
                    Array.ForEach(Directory.GetFiles(@Server.MapPath(strPath)), System.IO.File.Delete);
                }
                string strResult = "";
                try
                {
                    bool isExtensionOk = false;
                    string ext = Path.GetExtension(hpf.FileName);

                    String[] allowedExtensions = { ".gif", ".png", ".jpg", ".jpeg" };
                    foreach (var t in allowedExtensions.Where(t => ext.ToLower() == t))
                    {
                        isExtensionOk = true;
                    }
                    string ImageName = Guid.NewGuid().ToString();

                    int size = hpf.ContentLength;
                    string ContentType = hpf.ContentType;

                    if (!isExtensionOk)
                    {
                        strResult = "{ \"name\" : \"invalidExtension\" }";
                        return Content(strResult, "application/json");
                    }
                    else if (size >= 524288)
                    {
                        strResult = "{ \"name\" : \"size_exceeded\" }";
                        return Content(strResult, "application/json");
                    }

                    else if (ContentType == "png" || ContentType == "jpg" || ContentType == "gif" || ContentType == "jpeg")
                    {
                        strResult = "{ \"name\" : \"invalidExtension\" }";
                        return Content(strResult, "application/json");
                    }

                    // here we get the total size of already uploaded image and add it in current image size and if the limit exeeds, we dissallow it and show error message

                    // next validate file inner content
                    Dictionary<string, byte[]> imageHeader = new Dictionary<string, byte[]>();
                    imageHeader.Add("JPG", new byte[] { 0xFF, 0xD8, 0xFF, 0xE0 });
                    imageHeader.Add("JPEG", new byte[] { 0xFF, 0xD8, 0xFF, 0xE0 });
                    imageHeader.Add("PNG", new byte[] { 0x89, 0x50, 0x4E, 0x47 });
                    imageHeader.Add("GIF", new byte[] { 0x47, 0x49, 0x46, 0x38 });


                    byte[] header;
                    string extension = ext.Substring(1).ToUpper();
                    byte[] tmp = imageHeader[extension];
                    header = new byte[tmp.Length];

                    hpf.InputStream.Read(header, 0, header.Length);


                    if (ListHelper.CompareArray(tmp, header))
                    {
                        IsValidFile = true;
                    }
                    else
                    {
                        try
                        {
                            Bitmap bmp = new Bitmap(hpf.InputStream);
                            IsValidFile = true;

                        }
                        catch (Exception)
                        {
                            IsValidFile = false;
                            strResult = "{ \"name\" : \"invalid_format\" }";
                            return Content(strResult, "application/json");
                        }
                    }

                    if (IsValidFile == true)
                    {
                        string savedFileName = "";
                        savedFileName = Path.Combine(Server.MapPath(strPath), ImageName + ext);
                        System.IO.Stream oStream = hpf.InputStream;
                        Bitmap bmpProfileImage = new Bitmap(oStream);

                        //here save the image of any dimensions
                        bmpProfileImage.Save(savedFileName);
                        //here do db updations
                        UsersProfileBAL.UpdateProfileImage(CurrentUser.ContactId, ImageName + ext);
                        // send response in ajax
                        savedFileName = ImageName + ext;
                        strResult = "{ \"name\" : \"success\",  \"path\" : \"" + strPath.Replace("~/", "../") + savedFileName + "\" }";
                    }
                    else
                    {
                        strResult = "{ \"name\" : \"invalid_format\" }";
                        return Content(strResult, "application/json");
                    }
                }
                catch (Exception ex)
                {
                    ex.ToString();
                    strResult = "{ \"name\" : \"fail\" }";
                }

                return Content(strResult, "application/json");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
