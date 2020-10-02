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
    public class ManageRoutesController : ApiController
    {
        TraWellEntities db = new TraWellEntities();

        [HttpGet]
        public List<ManageRoutes> GetRoutes()
        {
            List<ManageRoutes> ManageRoute = new List<ManageRoutes>();
            List<Route> routes = db.Routes.ToList();
            foreach (var route in routes)
            {
                ManageRoutes manage = new ManageRoutes();
                manage.route = route;
                manage.stops = db.Stops.Where(ts => ts.RouteID == route.Id).OrderBy(ts => ts.DistanceFromOrigin).ToList();
                ManageRoute.Add(manage);
            }

            return ManageRoute;
        }
    }
}
