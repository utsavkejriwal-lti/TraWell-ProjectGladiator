using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [DataContract]
    public class BookingDetails
    {
        [DataMember]
        public int UserRegistered { get; set; }
        [DataMember]
        public Nullable<int> UserId { get; set; }
        [DataMember]
        public string Status { get; set; }
        [DataMember]
        public int TripId { get; set; }
        [DataMember]
        public string Boarding { get; set; }
        [DataMember]
        public string Arrival { get; set; }
        [DataMember]
        public double Amount { get; set; }
    }
}