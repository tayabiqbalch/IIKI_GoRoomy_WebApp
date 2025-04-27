using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IIKI.GoRoomy.WebApp.Startup))]
namespace IIKI.GoRoomy.WebApp
{    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
