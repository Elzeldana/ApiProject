using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ClassLibrary.Services;
using ClassLibrary.Models;
using ClassLibrary.Validations;

namespace HotelApi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class GuestController : ApiController
    {
        private readonly IGuestService service;

        public GuestController(IGuestService service)
        {
            this.service = service;
        }


        public IEnumerable<Guests> Get()
        {
            return service.GetGuests();
        }

        public IHttpActionResult Get(int id)
        {
            var guest = service.GetGuest(id);

            if (guest == null)
            {
                return NotFound();
            }
            return Ok(guest);
        }


        public HttpResponseMessage Post(Guests guest)
        {
            GuestsValidation validator = new GuestsValidation();
            var result = validator.Validate(guest);

            if (!result.IsValid) return Request.CreateResponse(HttpStatusCode.BadRequest);

            if (service.AddGuest(guest))
                return Request.CreateResponse(HttpStatusCode.Created);
            else
                return Request.CreateResponse(HttpStatusCode.InternalServerError);
        }
                
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                if (service.DeleteGuest(id))
                    return Request.CreateResponse(HttpStatusCode.NoContent);
                else
                    return Request.CreateResponse(HttpStatusCode.InternalServerError);
            }
            catch (ApplicationException ex)
            {
                return Request.CreateResponse(HttpStatusCode.Forbidden, ex.Message);
            }
        }

        public IHttpActionResult Put(int id, Guests guest)
        {
            try
            {
                if (service.UpdateGuestContact(id, guest))
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





    }
}
