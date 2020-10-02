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
    public class FrequentRoutesController : ApiController
    {
        TraWellEntities db = new TraWellEntities();
        [HttpGet]
        public IEnumerable<prc_frequent_routes_Result> prc_Frequent_Routes_Results()
        {
            return db.prc_frequent_routes().ToList();
        }

    }
}
