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
    public class LoginController : ApiController
    {
        TraWellEntities db = new TraWellEntities();

        [Route("Api/Login/AdminLogin")]
        [HttpPost]
        public Admin AdminLogin(Admin admin)
        {


            if(db.Admins.Any(a => a.Username == admin.Username && a.Password == admin.Password && a.isActive == 1))
            {
                return db.Admins.Where(a => a.Username == admin.Username && a.Password == admin.Password).First();
            }

            return null;

        }
    }
}
