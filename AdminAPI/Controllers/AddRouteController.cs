using AdminWebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace AdminWebAPI.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class AddRouteController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();

        [HttpPost]
        public Boolean AddNewRoute(List<Stop> stops)
        {
            Route route = new Route();

            if(stops.Count > 2)
            {
                route.Source = stops[0].Stop1;
                route.Destination = stops[stops.Count - 1].Stop1;
                route.Admin = 3;

                db.Routes.Add(route);
                db.SaveChanges();

                for (int i = 0; i < stops.Count; i++)
                {
                    Stop stop = new Stop();
                    stop.RouteID = route.Id;
                    stop.Stop1 = stops[i].Stop1;
                    stop.DistanceFromOrigin = (double) stops[i].DistanceFromOrigin;
                    db.Stops.Add(stop);

                }
                db.SaveChanges();
                return true;
            }
            return false;
            

        }
    }
}
