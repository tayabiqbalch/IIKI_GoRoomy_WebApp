using IIKI.GoRoomy.Business.Methods;
using IIKI.GoRoomy.Business.Objects;
using System.Web.Http;

namespace IIKI.GoRoomy.WebApi.Controllers
{
    public class HotelRoomsController : BaseAPIController
    {
        // GET: api/HotelRooms
        public IHttpActionResult Get()
        {
            return Ok(HotelRoomBAL.GetList());
           // return new string[] { "value1", "value2" };
        }

        // GET: api/HotelRooms/5
        public IHttpActionResult Get(int id)
        {
            return Ok(HotelRoomBAL.Get(id));//.ToJsonString();
            //return HotelRoomBAL.Get(id).ToJsonString();
            //return "value";
        }

        // POST: api/HotelRooms
        public IHttpActionResult Post([FromBody]HotelRoom Room)
        {
            return Ok(HotelRoomBAL.Add(Room));
        }

        // PUT: api/HotelRooms/5
        public IHttpActionResult Put(int id, [FromBody] HotelRoom Room)
        {
            Room.Id = id;
            return Ok(HotelRoomBAL.Update(Room));
        }

        // DELETE: api/HotelRooms/5
        public IHttpActionResult Delete(int id)
        {
            var Room = new HotelRoom();
            Room.Id = id;
            return Ok(HotelRoomBAL.Delete(Room));
        }
    }
}
