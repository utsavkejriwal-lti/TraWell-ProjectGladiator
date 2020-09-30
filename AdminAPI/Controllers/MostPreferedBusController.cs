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
    public class MostPreferedBusController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();
        [HttpGet]
        public IEnumerable<prc_feedback_Result>prc_Feedback_Results()
        {
            return db.prc_feedback().ToList();
        }

    }
}
