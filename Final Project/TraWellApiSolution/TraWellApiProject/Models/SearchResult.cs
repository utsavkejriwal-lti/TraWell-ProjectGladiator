using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [DataContract]
    public class SearchResult
    {
        [DataMember]
        public TripStop FromStop { get; set; }

        [DataMember]
        public TripStop ToStop { get; set; }

        [DataMember]
        public int CostperSeat { get; set; }
        [DataMember]
        public int SeatAvailable { get; set; }

        [DataMember]
        public List<int> SeatsBooked { get; set; }
        [DataMember]
        public int DurationHours { get; set; }
        [DataMember]
        public int DurationMins { get; set; }
    }

}