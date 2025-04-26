using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    public class DefaultController : Controller
    {
        // GET: BaseApp/Default
        public ActionResult Index()
        {
            return View();
        }
    }
}