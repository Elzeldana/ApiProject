using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Hotel.ClassLibrary.Services;
using Hotel.ClassLibrary.Models;
using Hotel.ClassLibrary.Validations;

namespace HotelApi.Controllers
{
   // [Authorize(Roles = "User")]
    public class BookingsController : ApiController
    {
        private readonly IBookingsService service;
        public BookingsController(IBookingsService service)
        {
            this.service = service;
        }

        public HttpResponseMessage Post(Bookings booking)
        {
            BookingValidation validator = new BookingValidation();
            var result = validator.Validate(booking);

            if (!result.IsValid) return Request.CreateResponse(HttpStatusCode.BadRequest);

            if (service.AddBooking(booking))
                return Request.CreateResponse(HttpStatusCode.Created);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError);
        }
       
        public IEnumerable<Bookings> Get()
        {
            return service.GetAllBookings();
        }

        public IHttpActionResult Get(int id)
        {
            var booking = service.GetBookingByID(id);

            if (booking == null)
            {
                return NotFound();
            }
            return Ok(booking);


        }
        [HttpPut]
        [Route("api/bookings/checkout/{id}")]
        public IHttpActionResult Checkout(int id, Bookings booking)
        {
           
            try
            {
                if (service.UpdateDepartureDate(id, booking))
                {
                    return Ok();
                }

                return InternalServerError();
            }
            catch (ApplicationException)
            {
                return NotFound();
            }
        }
        [HttpPut]
        [Route("api/bookings/checkin/{id}")]
        public IHttpActionResult Checkin(int id, Bookings booking)
            {                
                try
                {
                    if (service.UpdateArrivalDate(id, booking))
                    {
                        return Ok();
                    }

                    return InternalServerError();
                }
                catch (ApplicationException)
                {
                    return NotFound();
                }
            
            }

        public HttpResponseMessage Delete(int id)
        {
            try
            {
                if (service.RemoveBooking(id))
                    return Request.CreateResponse(HttpStatusCode.NoContent);
                else
                    return Request.CreateResponse(HttpStatusCode.InternalServerError);
            }
            catch (ApplicationException ex)
            {
                return Request.CreateResponse(HttpStatusCode.Forbidden, ex.Message);
            }
        }


        [HttpGet]
        [Route("api/bookings/getguestbookings/{id}")]
        public  IEnumerable<Bookings> GetGuestBooking(int id)
            {
            return service.GetBookingsByGuestId( id);
        }



    }
}