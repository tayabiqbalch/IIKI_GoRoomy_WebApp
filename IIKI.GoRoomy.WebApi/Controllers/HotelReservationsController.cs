using IIKI.GoRoomy.Business.Methods;
using IIKI.GoRoomy.Business.Objects;
using System.Web.Http;

namespace IIKI.GoRoomy.WebApi.Controllers
{
    public class HotelReservationsController : BaseAPIController
    {
        // GET: api/HotelReservations
        public IHttpActionResult Get()
        {
            return Ok(HotelReservationBAL.GetList());
           // return new string[] { "value1", "value2" };
        }

        // GET: api/HotelReservations/5
        public IHttpActionResult Get(int id)
        {
            return Ok(HotelReservationBAL.Get(id));//.ToJsonString();
            //return HotelReservationBAL.Get(id).ToJsonString();
            //return "value";
        }

        // POST: api/HotelReservations
        public IHttpActionResult Post([FromBody]HotelReservation Reservation)
        {
            return Ok(HotelReservationBAL.Add(Reservation));
        }

        // PUT: api/HotelReservations/5
        public IHttpActionResult Put(int id, [FromBody] HotelReservation Reservation)
        {
            Reservation.Id = id;
            return Ok(HotelReservationBAL.Update(Reservation));
        }

        // DELETE: api/HotelReservations/5
        public IHttpActionResult Delete(int id)
        {
            var Reservation = new HotelReservation();
            Reservation.Id = id;
            return Ok(HotelReservationBAL.Delete(Reservation));
        }
    }
}
