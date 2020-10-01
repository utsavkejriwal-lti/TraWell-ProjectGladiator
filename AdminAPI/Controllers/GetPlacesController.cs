using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AdminWebAPI.Models;

namespace AdminWebAPI.Controllers

{

    public class GetPlacesController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();

        [HttpGet]
        public List<Place> GetPlaces()
        {
            return db.Places.ToList();
        }
    }
}
