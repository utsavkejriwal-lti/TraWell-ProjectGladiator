using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [DataContract]
    public class UserSignIn
    {
        [DataMember]
        public string Message { get; set; }
        [DataMember]
        public User user { get; set; }
        [DataMember]
        public string hash { get; set; }
    }
}