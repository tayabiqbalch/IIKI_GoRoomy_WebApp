using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea
{
    public class BaseAppAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "BaseAppArea";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "BaseAppArea_default",
                "BaseAppArea/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}