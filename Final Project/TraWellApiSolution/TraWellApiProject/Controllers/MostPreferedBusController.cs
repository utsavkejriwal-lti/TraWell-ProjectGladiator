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
    public class MostPreferedBusController : ApiController
    {
        TraWellEntities db = new TraWellEntities();
        [HttpGet]
        public IEnumerable<prc_feedback_Result> prc_Feedback_Results()
        {
            return db.prc_feedback().ToList();
        }

    }
}
