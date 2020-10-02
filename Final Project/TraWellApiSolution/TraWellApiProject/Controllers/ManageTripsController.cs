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
    public class ManageTripsController : ApiController
    {
        TraWellEntities db = new TraWellEntities();

        [HttpGet]

        public List<ManageTrips> GetTrips()
        {
            List<ManageTrips> ManageTrip = new List<ManageTrips>();
            List<Trip> trips = db.Trips.ToList();
            foreach (var trip in trips)
            {
                ManageTrips manage = new ManageTrips();
                manage.trip = trip;
                manage.tripStops = db.TripStops.Where(ts => ts.TripId == trip.Id).OrderBy(ts => ts.ArrivalTime).ToList();
                ManageTrip.Add(manage);
            }

            return ManageTrip;
        }


    }
}
