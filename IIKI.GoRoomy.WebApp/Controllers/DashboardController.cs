using IIKI.BaseApp.Business.Objects.BaseAppModel;
using IIKI.BaseApp.Common;
using Newtonsoft.Json;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Controllers
{
    [Authorize]
    public class DashboardController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {
        // GET: Dashboard
        public ActionResult Index()
        {
            // Try to get timezone from session
            var timezone = Session["IIKI_LocalTimezone"];

            // If not in session, fall back to cookie
            if (timezone == null && Request.Cookies["IIKI_LocalTimezone"] != null)
            {
                string cookieTimezone = Request.Cookies["IIKI_LocalTimezone"].ToString();

                // Optionally, store it back in the session for subsequent requests
                Session["IIKI_LocalTimezone"] = JsonConvert.DeserializeObject<TimeZoneDetails>(cookieTimezone);
            }
            Logger.LogRelativeMessage("Dashboar index page reached, logging working or not just check......");
            return View();
        }
    }
}