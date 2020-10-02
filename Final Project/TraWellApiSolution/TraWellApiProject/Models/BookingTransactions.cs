using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [DataContract]
    public class BookingTransactions
    {
        [DataMember]
        public decimal amount { get; set; }
        [DataMember]
        public int BookingID { get; set; }
        [DataMember]
        public string Mode { get; set; }
        [DataMember]
        public string TransType { get; set; }
        [DataMember]
        public string BookingDirection { get; set; }
    }

}