using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using AdminWebAPI.Models;

namespace AdminWebAPI.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class FrequentRoutesController : ApiController
    {
         TraWellDummyEntities db = new TraWellDummyEntities();
        [HttpGet]
        public IEnumerable<prc_frequent_routes_Result> prc_Frequent_Routes_Results()
        {
            return db.prc_frequent_routes().ToList();
        }

    }
}
