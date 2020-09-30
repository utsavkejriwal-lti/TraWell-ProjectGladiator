using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using AdminWebAPI.Models;

namespace AdminWebAPI.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class LastMonthProfitController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();
        [HttpGet]
        public IEnumerable<prc_profit_Result> prc_Profit_Results()
        {
            return db.prc_profit().ToList();
        }
    }
}
