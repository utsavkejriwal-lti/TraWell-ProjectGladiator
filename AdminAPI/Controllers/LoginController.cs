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
    public class LoginController : ApiController
    {
        TraWellDummyEntities tra = new TraWellDummyEntities();

        [Route("Api/Login/AdminLogin")]
        [HttpPost]
        public string AdminLogin(Admin admin)
        {
            
            proc_LoginCheck_Result userdata = null;
            try
            {
                userdata = tra.proc_LoginCheck(admin.Username, admin.Password).First();
            }
            catch (Exception)
            {
                
                return  "Invalid Details";
            }

            return admin.Username;


        }
    }
}
