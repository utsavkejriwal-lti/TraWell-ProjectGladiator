using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TraWellApiProject.Models;
using MoreLinq;

namespace TraWellApiProject.Controllers
{
    [EnableCors("*", "*", "*")]
    public class CitySearchController : ApiController
    {
        TraWellEntities db = new TraWellEntities();

        [HttpGet]
        public List<Place> GetPlaces()
        {
            return db.Places.DistinctBy(p => p.City).ToList();
        }


    }
}
