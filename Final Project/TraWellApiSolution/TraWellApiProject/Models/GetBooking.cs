using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [DataContract]
    public class GetBooking
    {
        [DataMember]
        public Booking booking { get; set; }
        [DataMember]
        public List<Transaction> transactions { get; set; }
        [DataMember]
        public List<PassengerDetail> passengers { get; set; }
        [DataMember]
        public Bus bus { get; set; }
        [DataMember]
        public TripStop FromStop { get; set; }
        [DataMember]
        public TripStop ToStop { get; set; }
        [DataMember]
        public User user { get; set; }
        [DataMember]
        public GuestUser guestUser { get; set; }
        [DataMember]
        public Feedback feedback { get; set; }
    }

}