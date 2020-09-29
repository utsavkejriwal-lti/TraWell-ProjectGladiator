using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebAPIProjGlad.Models;
using System.Security.Cryptography;
using System.Text;

namespace WebAPIProjGlad.Controllers
{
    [EnableCors("http://localhost:4200", "*", "*")]
    public class UserController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();

        [HttpPost]
        [Route("api/User/SignUp")]
        public string AddUser(User user)
        {
            if(db.Users.Any(u => u.Email.ToLower() == user.Email.ToLower()))
            {
                return "Exists";
            }
            else
            {
                if (user.FirstName != "" && user.FirstName != null && 
                    user.LastName != "" && user.LastName != null &&
                    user.Email != "" && user.Email != null &&
                    user.Contact != "" && user.Contact != null && user.Contact.Length == 10 &&
                    user.Password != "" && user.Password != null)
                {
                    db.Users.Add(user);
                    db.SaveChanges();
                    return "Added";
                }
                else
                {
                    return "Invalid";
                }
            }

            
        }

        [HttpPost]
        [Route("api/User/SignIn")]
        public UserSignIn SignInUser(User user)
        {
            UserSignIn userSignIn = new UserSignIn();
            userSignIn.user = user;
            if(db.Users.Any(u => u.Email.ToLower() == user.Email.ToLower()))
            {
                if(db.Users.Any(p => p.Email.ToLower() == user.Email.ToLower() && p.Password == user.Password))
                {
                    User userdet = db.Users.Where(x => x.Email.ToLower() == user.Email.ToLower() && x.Password == user.Password).First();
                    userSignIn.Message = "success";
                    MD5 mD5 = new MD5CryptoServiceProvider();
                    DateTime time = DateTime.Now;
                    mD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(user.Email+time.Millisecond));
                    userSignIn.hash = ToHex(mD5.Hash,false);
                    
                    UserLog userLog = new UserLog();
                    userLog.UserId = userdet.Id;
                    userLog.EncData = userSignIn.hash;

                    db.UserLogs.Add(userLog);
                    db.SaveChanges();

                    return userSignIn;
                }
                else
                {
                    userSignIn.Message = "Invalid Password";
                    return userSignIn;
                }
            }
            else
            {
                userSignIn.Message = "Not Exists";
                return userSignIn;
            }
        }

        
        private string ToHex(byte[] bytes, bool upperCase)
        {
            StringBuilder result = new StringBuilder(bytes.Length * 2);

            for (int i = 0; i < bytes.Length; i++)
                result.Append(bytes[i].ToString(upperCase ? "X2" : "x2"));

            return result.ToString();
        }

        [HttpPost]
        [Route("api/User/GetUser")]
        public User GetUserFromHash(UserLog code)
        {
            if(db.UserLogs.Any(c => c.EncData == code.EncData))
            {
                return db.UserLogs.Where(c => c.EncData == code.EncData).First().User;
            }
            else
            {
                return null;
            }
        }


        [HttpPost]
        [Route("api/User/ChangePass")]
        public string ChangePass(UserChangePass user)
        {
            
           if (user.Password == user.NewPassword && 
               db.Users.Any(x => x.Email.ToLower() == user.Email.ToLower() && x.Password == user.Password))
               {
                User userDetails = db.Users.Where(x => x.Email.ToLower() == user.Email.ToLower() && x.Password == user.Password).First();
                userDetails.Password = user.NewPassword;
                db.Entry(userDetails).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return "success";
               }
            
            return "failed";
        }

        [HttpPost]
        [Route("api/User/CheckGuestUser")]
        public string CheckGuestUser(GuestUser user)
        {
            if (db.Users.Any(u=> u.Email == user.Email))
            {
                return "Exists";
            }
            else
            {
                return "Not";
            }
        }
    }
}
