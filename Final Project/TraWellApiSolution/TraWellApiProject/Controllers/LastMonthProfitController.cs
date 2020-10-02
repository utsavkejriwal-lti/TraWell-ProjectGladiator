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
    public class LastMonthProfitController : ApiController
    {
        TraWellEntities db = new TraWellEntities();
        [HttpGet]
        public IEnumerable<prc_profit_Result> prc_Profit_Results()
        {
            return db.prc_profit().ToList();
        }
    }
}
