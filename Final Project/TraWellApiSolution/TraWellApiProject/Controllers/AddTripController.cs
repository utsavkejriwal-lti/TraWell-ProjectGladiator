using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TraWellApiProject.Models;

namespace TraWellApiProject.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class AddTripController : ApiController
    {
        TraWellEntities db = new TraWellEntities();

        [HttpPost]
        public string AddNewTrip(ManageTrips addTrip)
        {
            try
            {
                Trip trip = addTrip.trip;
                trip.Status = "Scheduled";
                db.Trips.Add(trip);
                db.SaveChanges();
                foreach (TripStop tripStop in addTrip.tripStops)
                {
                    tripStop.TripId = trip.Id;
                    db.TripStops.Add(tripStop);
                }
                db.SaveChanges();
                return "Added";
            }
            catch
            {
                return "Error";
            }
            
        }
    }
}
