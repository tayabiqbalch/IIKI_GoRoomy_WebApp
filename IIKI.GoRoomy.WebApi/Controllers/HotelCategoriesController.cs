using IIKI.GoRoomy.Business.Methods;
using IIKI.GoRoomy.Business.Objects;
using System.Web.Http;

namespace IIKI.GoRoomy.WebApi.Controllers
{
    public class HotelCategoriesController : BaseAPIController
    {
        // GET: api/HotelCategories
        public IHttpActionResult Get()
        {
            return Ok(HotelCategoryBAL.GetList());
           // return new string[] { "value1", "value2" };
        }

        // GET: api/HotelCategories/5
        public IHttpActionResult Get(int id)
        {
            return Ok(HotelCategoryBAL.Get(id));//.ToJsonString();
            //return HotelCategoryBAL.Get(id).ToJsonString();
            //return "value";
        }

        // POST: api/HotelCategories
        public IHttpActionResult Post([FromBody]HotelCategory category)
        {
            return Ok(HotelCategoryBAL.Add(category));
        }

        // PUT: api/HotelCategories/5
        public IHttpActionResult Put(int id, [FromBody] HotelCategory category)
        {
            category.Id = id;
            return Ok(HotelCategoryBAL.Update(category));
        }

        // DELETE: api/HotelCategories/5
        public IHttpActionResult Delete(int id)
        {
            var category = new HotelCategory();
            category.Id = id;
            return Ok(HotelCategoryBAL.Delete(category));
        }
    }
}
