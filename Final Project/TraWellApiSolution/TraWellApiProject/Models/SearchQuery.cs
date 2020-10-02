using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [DataContract]
    public class SearchQuery
    {
        [DataMember]
        public string FromCity { get; set; }
        [DataMember]
        public string ToCity { get; set; }
        [DataMember]
        public System.DateTime DepDate { get; set; }

    }

}