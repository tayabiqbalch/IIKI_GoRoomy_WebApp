using IIKI.GoRoomy.Business.Methods;
using IIKI.GoRoomy.Business.Objects;
using IIKI.GoRoomy.WebApi.Models;
using System;
using System.Web.Http;

namespace IIKI.GoRoomy.WebApi.Controllers
{
    public class HotelsController : BaseAPIController
    {
        // GET: api/Hotels
        public IHttpActionResult Get(string search = null, long offset = 0, long pageSize = 200)
        {
            var list = HotelBAL.GetList(search, offset, pageSize);
            ////string ActualURL = "/1/";
            ////string FileBaseURL = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("HotelDocumentsPath") + ActualURL;

            ////if (!Directory.Exists(System.Web.Hosting.HostingEnvironment.MapPath(FileBaseURL)))
            ////{
            ////    Directory.CreateDirectory(System.Web.Hosting.HostingEnvironment.MapPath(FileBaseURL));
            ////}
            ////string fileToCopy = System.Web.Hosting.HostingEnvironment.MapPath(IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("HotelDocumentsPath") + "/hotelimg.jpg");
            ////File.Copy(fileToCopy, System.Web.Hosting.HostingEnvironment.MapPath(FileBaseURL) + Path.GetFileName(fileToCopy));
            //list = list.Where(x => x.Id > 1).ToList();
            //foreach (var hotel in list)
            //{
            //    string ActualURL = "/" + hotel.Id + "/";
            //    string FileBaseURL = IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("HotelDocumentsPath") + ActualURL;
            //    if (!Directory.Exists(System.Web.Hosting.HostingEnvironment.MapPath(FileBaseURL)))
            //    {
            //        Directory.CreateDirectory(System.Web.Hosting.HostingEnvironment.MapPath(FileBaseURL));
            //    }
            //    string fileToCopy = System.Web.Hosting.HostingEnvironment.MapPath(IIKI.BaseApp.Common.CommonFunctions.GetConfigurationAppSettings("HotelDocumentsPath") + "/hotelimg.jpg");
            //    File.Copy(fileToCopy, System.Web.Hosting.HostingEnvironment.MapPath(FileBaseURL) + Path.GetFileName(fileToCopy));
            //    EntityDocument oObject = new EntityDocument();
            //    oObject.EntityId = hotel.Id;
            //    oObject.EntityTypeId = (int)EntityTypes.Hotels;
            //    oObject.RecordStatus = 1;
            //    oObject.Document.DocumentName = "hotelimg.jpg";
            //    oObject.Document.DocumentExtension = ".jpg";
            //    oObject.Document.FileType = "img";
            //    oObject.Document.DocumentPath = ActualURL + "hotelimg.jpg";
            //    oObject.Document.DocumentTypeId = 1;
            //    long DocumentId = DocumentBAL.Add(oObject.Document);
            //    oObject.DocumentId = DocumentId;
            //    oObject.IsPrimary = true;
            //    EntityDocumentBAL.Add(oObject);
            //}
            return Ok(list);
            // return new string[] { "value1", "value2" };
        }

        // GET: api/Hotels/5
        public IHttpActionResult Get(int id)
        {
            return Ok(HotelBAL.Get(id));
        }

        // POST: api/Hotels
        public IHttpActionResult Post([FromBody] Hotel hotel)
        {
            return Ok(HotelBAL.Add(hotel));
        }

        // PUT: api/Hotels/5
        public IHttpActionResult Put(int id, [FromBody] Hotel hotel)
        {
            hotel.Id = id;
            return Ok(HotelBAL.Update(hotel));
        }

        // DELETE: api/Hotels/5
        public IHttpActionResult Delete(int id)
        {
            var hotel = new Hotel();
            hotel.Id = id;
            return Ok(HotelBAL.Delete(hotel));
        }
    }
}
