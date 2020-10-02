using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [DataContract]
    public class CompleteBookingDetails
    {
        [DataMember]
        public List<BookingPassengers> Passengers { get; set; }
        [DataMember]
        public List<BookingDetails> Bookings { get; set; }
        [DataMember]
        public List<BookingTransactions> Transactions { get; set; }
        [DataMember]
        public GuestUser GuestUser { get; set; }
    }
}