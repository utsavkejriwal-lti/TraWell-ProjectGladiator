using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebAPIProjGlad.Models;

namespace WebAPIProjGlad.Controllers
{
    [EnableCors("http://localhost:4200", "*", "*")]
    public class BookingController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();

        [HttpPost]
        [Route("api/booking/CreateNewBooking")]
        public Boolean CreateNewBooking(CompleteBookingDetails cBD)
        {
            List<BookingDetails> bookingDetails = cBD.Bookings;
            List<BookingTransactions> bookingTransactions = cBD.Transactions;
            List<BookingPassengers> bookingPassengers = cBD.Passengers;
            GuestUser guestUser = cBD.GuestUser;

            Boolean IsReturn = cBD.Bookings.Count > 1 ? true : false;

            return IsReturn;
        } 
    }
}
