using System.Web;
using System.Web.Optimization;

namespace IIKI.GoRoomy.WebApp
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"
                      , "~/Theme/IIKI_Theme/js/CommonFunctions.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryUI").Include(
                        "~/Scripts/jquery-ui.js"));

            bundles.Add(new ScriptBundle("~/Content/jqueryUI").Include(
                        "~/Content/jquery-ui.css"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryValidation").Include(
                        "~/Scripts/jquery.validate*"
                        , "~/Scripts/jquery.validation*"//Additional Methods
                        ));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            // Animate.css
            bundles.Add(new StyleBundle("~/bundles/animate/css").Include(
                      "~/Theme/IIKI_Theme/Plugins/animate.css/animate.min.css"));

            // iTheme style
            bundles.Add(new StyleBundle("~/Content/iTheme/css").Include(
                      "~/Theme/IIKI_Theme/css/Style.css"
                      
                      , new CssRewriteUrlTransform()));

            // iTheme script
            bundles.Add(new ScriptBundle("~/bundles/iTheme/js").Include(
                      //"~/Theme/IIKI_Theme/Plugins/metismenu-3.0.5/metisMenu.min.js"
                        "~/Theme/IIKI_Theme/Plugins/icheck-1.x/icheck.min.js"
                      , "~/Theme/IIKI_Theme/Plugins/peity/jquery.peity.min.js"
                      , "~/Theme/IIKI_Theme/Plugins/sparkline/jquery.sparkline.js"
                      //, "~/Theme/IIKI_Theme/Plugins/popper/popper.min.js"
                      //, "~/Theme/IIKI_Theme/Plugins/popupoverlay/popupoverlay.min.js"
                      , "~/Scripts/charts.js"
                      , "~/Theme/IIKI_Theme/js/iTheme.js"
                      //, "~/Theme/IIKI_Theme/js/CustomFunctions.js"
                      ));
            // iTheme CustomFunctions script
            bundles.Add(new ScriptBundle("~/bundles/iTheme/customFunctionsJS").Include(
                      "~/Theme/IIKI_Theme/js/CustomFunctions.js"
                      ));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/bootstrap").Include(
              "~/Content/bootstrap.min.css"
              ));

            bundles.Add(new StyleBundle("~/Content/bootstrapRTL").Include(
                "~/Theme/IIKI_Theme/Plugins/bootstrap-4.2.1-rtl/dist/css/rtl/bootstrap.min.css"
              ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/Site.css"

                      ));

            #region fontAwsome
            //fontAwsome
            bundles.Add(new ScriptBundle("~/bundles/fontAwsomeAll").Include(
                      "~/Theme/IIKI_Theme/Plugins/fontawesome-free-5.11.2/js/all.js"));

            bundles.Add(new StyleBundle("~/Content/fontAwsomeAll").Include(
                      "~/Theme/IIKI_Theme/Plugins/fontawesome-free-5.11.2/css/all.css"));

            bundles.Add(new ScriptBundle("~/bundles/fontAwsome").Include(
                      "~/Theme/IIKI_Theme/Plugins/fontawesome-free-5.11.2/js/fontawesome.js"));

            bundles.Add(new StyleBundle("~/Content/fontAwsome").Include(
                      "~/Theme/IIKI_Theme/Plugins/fontawesome-free-5.11.2/css/fontawesome.css"));

            #endregion

            bundles.Add(new ScriptBundle("~/bundles/fileupload").Include(
                        "~/Scripts/jquery.ui.widget.js"
                       , "~/Scripts/jquery.fileupload.js"));

            bundles.Add(new ScriptBundle("~/bundles/momentJS").Include(
                      "~/Theme/IIKI_Theme/Plugins/momentJS/moment-with-locales.js"
                      , "~/Theme/IIKI_Theme/Plugins/momentJS/moment-timezone-with-data.min.js"));


            bundles.Add(new ScriptBundle("~/bundles/bootstrapCheckbox").Include(
                      "~/Theme/IIKI_Theme/Plugins/bootstrap-checkbox/dist/js/bootstrap-checkbox.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrapDatePicker").Include(
                      "~/Theme/IIKI_Theme/Plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"
                      , "~/Theme/IIKI_Theme/Plugins/Bootstrap4DateTimePicker/datetimepicker-bootstrap-4.min.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/bootstrapDatePicker").Include(
                      "~/Theme/IIKI_Theme/Plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css"
                      , "~/Theme/IIKI_Theme/Plugins/Bootstrap4DateTimePicker/datetimepicker-bootstrap-4.min.css"));



            #region Datatables
            bundles.Add(new ScriptBundle("~/bundles/DataTables").Include(
                      "~/Theme/IIKI_Theme/Plugins/DataTables/datatables.min.js"
                      , "~/Theme/IIKI_Theme/Plugins/DataTables/Responsive-2.2.2/js/dataTables.responsive.min.js"

                      ));

            bundles.Add(new StyleBundle("~/Content/DataTables").Include(
                      "~/Theme/IIKI_Theme/Plugins/DataTables/datatables.css"
                      , "~/Theme/IIKI_Theme/Plugins/DataTables/Responsive-2.2.2/css/responsive.dataTables.min.css"

                      ));

            #endregion
            #region Sweetalert
            // Sweetalert style
            bundles.Add(new StyleBundle("~/Content/sweetAlert").Include(
                      "~/Theme/IIKI_Theme/Plugins/sweetalert/lib/sweet-alert.css"));

            // Sweetalert style 2
            bundles.Add(new StyleBundle("~/Content/sweetAlert2").Include(
                      "~/Theme/IIKI_Theme/Plugins/sweetalert2-7.28.7/dist/sweetalert2.min.css"));

            // Sweetalert
            bundles.Add(new ScriptBundle("~/bundles/sweetAlert").Include(
                      "~/Theme/IIKI_Theme/Plugins/sweetalert/lib/sweet-alert.min.js"));

            // Sweetalert 2
            bundles.Add(new ScriptBundle("~/bundles/sweetAlert2").Include(
                      "~/Theme/IIKI_Theme/Plugins/sweetalert2-7.28.7/dist/sweetalert2.min.js"));

            // Sweetalert  2 All
            bundles.Add(new ScriptBundle("~/bundles/sweetAlert2").Include(
                      "~/Theme/IIKI_Theme/Plugins/sweetalert2-7.28.7/dist/sweetalert2.all.min.js"));
            #endregion

            // Toastr
            bundles.Add(new ScriptBundle("~/bundles/toastr").Include(
                      "~/Theme/IIKI_Theme/Plugins/toastr/build/toastr.min.js"));

            // Toastr style
            bundles.Add(new StyleBundle("~/Content/toastr").Include(
                      "~/Theme/IIKI_Theme/Plugins/toastr/build/toastr.min.css"));

            // Select 2
            bundles.Add(new ScriptBundle("~/bundles/select2").Include(
                      "~/Theme/IIKI_Theme/Plugins/select2-3.5.2/select2.min.js"));

            // Select 2 style
            bundles.Add(new StyleBundle("~/Content/select2").Include(
                      "~/Theme/IIKI_Theme/Plugins/select2-3.5.2/select2.css"
                      , "~/Theme/IIKI_Theme/Plugins/select2-bootstrap/select2-bootstrap.css"));

            // swiper
            bundles.Add(new ScriptBundle("~/bundles/swiper").Include(
                      "~/Theme/IIKI_Theme/Plugins/swiper/swiper-bundle.js"));

            // swiper style
            bundles.Add(new StyleBundle("~/Content/swiper").Include(
                      "~/Theme/IIKI_Theme/Plugins/swiper/swiper-bundle.css"));


            // Tinymce
            bundles.Add(new ScriptBundle("~/bundles/Tinymce").Include(
                      "~/Theme/IIKI_Theme/Plugins/Tinymce/tinymce.min.js"));

        }
    }
}
