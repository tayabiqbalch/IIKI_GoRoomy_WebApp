using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using IIKI.BaseApp.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    [Authorize]
    public class ManageUsersController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {
        public ActionResult Index()
        {

            return View("Index");
        }

        [HttpPost]
        public ActionResult SearchDataTableRecords(IIKI.BaseApp.Common.CommonObjects.DataTablesParam request, string UserId = null, string Email = null, string UserName = null, string FirstName = null, string LastName = null, bool ApplyDateFilter = false, string StartDate = null, string EndDate = null, bool IsJvUser = false)
        {
            int SortColumn;
            string SortOrder;
            IIKI.BaseApp.Common.CommonObjects.DataTablesResponseData response;
            try
            {
                if (request.length <= 0)
                {
                    request.length = IIKI.BaseApp.Common.CommonStatus.GirdPageSettings.PageSize;
                }

                if (request.order?.Count <= 0)
                {
                    SortColumn = IIKI.BaseApp.Common.CommonStatus.GirdPageSettings.SortColumn;
                    SortOrder = IIKI.BaseApp.Common.CommonStatus.GirdPageSettings.SortOrder;
                }
                else
                {
                    SortColumn = request.order[0].column;
                    SortOrder = request.order[0].dir;
                }
                Logger.LogRelativeMessage("SearchUsers StartDate:::" + StartDate + "::::::::: EndDate:::" + EndDate);

                DateTimeOffset start = DateTimeOffset.MinValue;
                DateTimeOffset end = DateTimeOffset.MaxValue;
                if (ApplyDateFilter)
                {
                    if (!string.IsNullOrEmpty(StartDate))
                    {
                        start = Convert.ToDateTime(StartDate);
                        start = TimeZoneInfo.ConvertTime(start, TimeZoneInfo.FindSystemTimeZoneById("UTC"));
                    }
                    if (!string.IsNullOrEmpty(EndDate))
                    {
                        end = Convert.ToDateTime(EndDate);
                        end = TimeZoneInfo.ConvertTime(end, TimeZoneInfo.FindSystemTimeZoneById("UTC"));

                    }
                }
                Logger.LogRelativeMessage("SearchUsers start:::" + start + "::::::::: end:::" + end);

                var list = new List<SearchUsers>();
                object[] methodParams = new object[] { UserId, Email, UserName, FirstName, LastName, start, end, request.start, request.length, SortColumn, SortOrder };
                response = CommonBAL.GenerateDataTablesResponseData(list, request, new UsersProfileBAL(), methodParams, true, "SearchUsers");

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchUsers Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }

        public ActionResult MarkUserBooleanFields(string UserId, string Email, bool boolField, int FieldType = 0)
        {
            try
            {
                //UsersProfileBAL.MarkUserBooleanFields(UserId, boolField, FieldType,User.Identity.Name);

                var user = UsersProfileBAL.GetUserInfo(UserId);

                if (FieldType == 0)
                {
                    UsersProfileBAL.MarkUserBooleanFields(UserId, boolField, FieldType, User.Identity.Name);

                }
                else
                {
                    UsersProfileBAL.MarkUserBooleanFields(UserId, boolField, FieldType, User.Identity.Name);
                }
                return Content(IIKI.BaseApp.Common.CommonStatus.RecordSaveStatus.RecordSavedText);
            }
            catch (Exception ex)
            {
                return Content("Exception:" + ex.Message);
            }
        }

        public ActionResult UserUpdateActivities(int UserId = 0)
        {
            try
            {
                SearchUsers searchUsers = new SearchUsers();
                if (UserId>0)
                {
                    var userList = UsersProfileBAL.SearchUsers(UserId.ToString());
                    if (userList.Count > 0)
                    {
                        searchUsers = userList[0];
                    }
                }

                return View("UserUpdateActivities", searchUsers);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        [HttpPost]
        public ActionResult SearchUserUpdateActivities(IIKI.BaseApp.Common.CommonObjects.DataTablesParam request, string UserId = null, string ActionPerformedBy = null, bool ApplyDateFilter = false, string StartDate = null, string EndDate = null)
        {
            int SortColumn;
            string SortOrder;
            IIKI.BaseApp.Common.CommonObjects.DataTablesResponseData response;
            try
            {
                if (request.length <= 0)
                {
                    request.length = IIKI.BaseApp.Common.CommonStatus.GirdPageSettings.PageSize;
                }

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

                DateTimeOffset start = DateTimeOffset.MinValue;
                DateTimeOffset end = DateTimeOffset.MaxValue;
                if (ApplyDateFilter)
                {
                    if (string.IsNullOrEmpty(StartDate))
                        StartDate = DateTime.MinValue.ToShortDateString();
                    if (string.IsNullOrEmpty(EndDate))
                        EndDate = DateTime.MaxValue.ToShortDateString();

                    if (!string.IsNullOrEmpty(StartDate))
                    {
                        start = Convert.ToDateTime(StartDate);
                        start = TimeZoneInfo.ConvertTime(start, TimeZoneInfo.FindSystemTimeZoneById("UTC"));
                    }
                    if (!string.IsNullOrEmpty(EndDate))
                    {
                        end = Convert.ToDateTime(EndDate);
                        end = TimeZoneInfo.ConvertTime(end, TimeZoneInfo.FindSystemTimeZoneById("UTC"));

                    }
                }


                var list = UsersProfileBAL.GetUserUpdateActivities(UserId, ActionPerformedBy, start, end, request.start, request.length, SortColumn, SortOrder);

                object[] methodParams = new object[] { UserId, ActionPerformedBy, start, end, request.start, request.length, SortColumn, SortOrder };
                response = CommonBAL.GenerateDataTablesResponseData(list, request, new UsersProfileBAL(), methodParams, true, "GetUserUpdateActivities");

                return Json(response, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                Logger.LogRelativeMessage("SearchUserUpdateActivities Exception:::::::::::::" + ex.Message);

                throw ex;
            }
        }


    }
}