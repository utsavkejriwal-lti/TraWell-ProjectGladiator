using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebAPIProjGlad.Models;
using MoreLinq;

namespace WebAPIProjGlad.Controllers
{
    [EnableCors("http://localhost:4200","*","*")]
    public class CitySearchController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();

        [HttpGet]
        public List<Place> GetPlaces()
        {
            return db.Places.DistinctBy(p => p.City).ToList();
        }

        
    }
}
