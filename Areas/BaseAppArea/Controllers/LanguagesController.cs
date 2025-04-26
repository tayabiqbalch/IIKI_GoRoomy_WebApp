using IIKI.BaseApp.Business.Methods;
using IIKI.BaseApp.Business.Objects;
using System;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace IIKI.GoRoomy.WebApp.Areas.BaseAppArea.Controllers
{
    public class LanguagesController : IIKI.GoRoomy.WebApp.Controllers.WebAppBaseController
    {
        // GET: Language
        public ActionResult Index()
        {
            try
            {

                var list = ApplicationSupportedLanguageBAL.GetList(IIKI.BaseApp.Common.CommonStatus.RecordStatus.All);
                if (list.Count <= 0)
                {
                    CultureInfo[] CultureInfoArray = CultureInfo.GetCultures(CultureTypes.AllCultures & ~CultureTypes.NeutralCultures);
                    var CultureInfoList = CultureInfoArray.ToList();
                    //CultureInfoList = CultureInfoArray.Where(x => x.IsNeutralCulture == true && (x.EnglishName != "K'iche'")).ToList();

                    foreach (var item in CultureInfoList.OrderBy(x => x.EnglishName))
                    {
                        if (item.EnglishName.Equals("Arabic") || item.EnglishName.Equals("English") || item.EnglishName.Equals("Filipino") || item.EnglishName.Equals("French") || item.EnglishName.Equals("Hindi") || item.EnglishName.Equals("Persian") || item.EnglishName.Equals("Russian") || item.EnglishName.Equals("Spanish") || item.EnglishName.Equals("Turkish") || item.EnglishName.Equals("Urdu"))
                        {
                            ApplicationSupportedLanguageBAL.Add(new ApplicationSupportedLanguage { DisplayName = item.DisplayName, EnglishName = item.EnglishName, NativeName = item.NativeName, CultureName = item.Name, IsNeutralCulture = item.IsNeutralCulture, RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.InActive });
                        }
                        else if (item.IsNeutralCulture)
                        {
                            ApplicationSupportedLanguageBAL.Add(new ApplicationSupportedLanguage { DisplayName = item.DisplayName, EnglishName = item.EnglishName, NativeName = item.NativeName, CultureName = item.Name, IsNeutralCulture = item.IsNeutralCulture, RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.InActive });
                        }
                        else
                        {
                            ApplicationSupportedLanguageBAL.Add(new ApplicationSupportedLanguage { DisplayName = item.DisplayName, EnglishName = item.EnglishName, NativeName = item.NativeName, CultureName = item.Name, IsNeutralCulture = item.IsNeutralCulture, RecordStatus = IIKI.BaseApp.Common.CommonStatus.RecordStatus.Disabled });
                        }

                    }
                    list = ApplicationSupportedLanguageBAL.GetList(IIKI.BaseApp.Common.CommonStatus.RecordStatus.All);
                }
                return View(list);

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        // GET: Language
        public ActionResult ChangeLanguage(string language = "en")
        {
            try
            {
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(language);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(language);
                HttpCookie cookie = new HttpCookie(name: "IIKI_SelectedLanguage");
                cookie.Value = language;
                Response.Cookies.Add(cookie);

                return RedirectToAction("Index", "Home");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}