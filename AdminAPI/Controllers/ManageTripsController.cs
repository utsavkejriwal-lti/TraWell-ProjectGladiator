using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using AdminWebAPI.Models;

namespace AdminWebAPI.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class ManageTripsController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();

        [HttpGet]
        
        public List<ManageTrips> GetTrips()
        {
            List<ManageTrips> ManageTrip = new List<ManageTrips>();
            List<Trip> trips = db.Trips.ToList();
            foreach (var trip in trips)
            {
                ManageTrips manage = new ManageTrips();
                manage.trip = trip;
                manage.tripStops = db.TripStops.Where(ts => ts.TripId == trip.Id).ToList();
                ManageTrip.Add(manage);
            }

            return ManageTrip;
        }

        
    }
}
