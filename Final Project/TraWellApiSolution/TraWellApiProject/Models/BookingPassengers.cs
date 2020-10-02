using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [DataContract]
    public class BookingPassengers
    {
        [DataMember]
        public int Seat { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public int Age { get; set; }
        [DataMember]
        public string Gender { get; set; }
    }

}