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

            //proc_LoginCheck_Result userdata = null;
            //try
            //{
            //    userdata = tra.proc_LoginCheck(admin.Username, admin.Password).First();
            //}
            //catch (Exception)
            //{

            //    return "Invalid Details";
            //}

            //return admin.Username;

            if(db.Admins.Any(a => a.Username == admin.Username && a.Password == admin.Password))
            {
                return db.Admins.Where(a => a.Username == admin.Username && a.Password == admin.Password).First();
            }

            return null;

        }
    }
}
