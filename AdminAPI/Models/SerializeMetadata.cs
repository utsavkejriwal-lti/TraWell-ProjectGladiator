using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace AdminWebAPI.Models
{
    [MetadataType(typeof(SerializeMetadataBus))]
    
    public partial class Bus { }
    [MetadataType(typeof(SerializeMetadataBooking))]
    
    public partial class Booking { }
    [MetadataType(typeof(SerializeMetadataFrequentRoutes))]
    
    public partial class prc_frequent_routes_Result { }
    [MetadataType(typeof(SerializeMetadataProfit))]
    public partial class prc_profit_Result { }
    [MetadataType(typeof(SerializeMetadataFeedback))]
    public partial class prc_feedback_Result { }
    [MetadataType(typeof(SerializeMetadataTrip))]
    public partial class Trip { }
    [MetadataType(typeof(SerializeMetadataTripStop))]
    public partial class TripStop { }
    [MetadataType(typeof(SerializeMetadataManageTrips))]
    public partial class ManageTrips { }
    [MetadataType(typeof(SerializeMetadataRoute))]
    public partial class Route { }
    [MetadataType(typeof(SerializeMetadataStop))]
    public partial class Stop { }
    [MetadataType(typeof(SerializeMetadataManageRoutes))]
    public partial class ManageRoutes { }

    [DataContract]
    public class SerializeMetadataBus
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Number { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public int Seats { get; set; }
        [DataMember]
        public int Admin { get; set; }
        [DataMember]
        public int hasAc { get; set; }
        [DataMember]
        public int hasWifi { get; set; }
        [DataMember]
        public int isRecliner { get; set; }
    }

    [DataContract]
    public class SerializeMetadataBooking {

        [DataMember]
        public int BookingID { get; set; }
        [DataMember]
        public int UserRegistered { get; set; }
        [DataMember]
        public Nullable<int> UserId { get; set; }
        [DataMember]
        public Nullable<int> GuestId { get; set; }
        [DataMember]
        public System.DateTime BookingDate { get; set; }
        [DataMember]
        public string Status { get; set; }
        [DataMember]
        public int TripId { get; set; }
        [DataMember]
        public string Boarding { get; set; }
        [DataMember]
        public string Arrival { get; set; }
        [DataMember]
        public string Feedback { get; set; }
        [DataMember]
        public double Amount { get; set; }
    }

    [DataContract]
    public class SerializeMetadataFrequentRoutes { 

        [DataMember]
        public int routeid { get; set; }
        [DataMember]
        public Nullable<int> TotalTrips { get; set; }

    }

    [DataContract]
    public class SerializeMetadataProfit
    {
        [DataMember]
        public int BookingID { get; set; }
        [DataMember]
        public Nullable<int> UserId { get; set; }
        [DataMember]
        public Nullable<int> GuestId { get; set; }
        [DataMember]
        public Nullable<int> LastMonth { get; set; }
        [DataMember]
        public Nullable<int> PresentYear { get; set; }
        [DataMember]
        public double Amount { get; set; }
    }

    [DataContract]
    public class SerializeMetadataFeedback
    {
        [DataMember]
        public int busid { get; set; }
        [DataMember]
        public Nullable<int> feedbackBus { get; set; }
    }

    [DataContract]
    public class SerializeMetadataTrip
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public int BusID { get; set; }
        [DataMember]
        public int RouteID { get; set; }
        [DataMember]
        public int Admin { get; set; }
        [DataMember]
        public double CostPerKm { get; set; }
        [DataMember]
        public string Status { get; set; }

    }

    [DataContract]
    public class SerializeMetadataTripStop
    {
        [DataMember]
        public int TripId { get; set; }
        [DataMember]
        public string Stop { get; set; }
        [DataMember]
        public System.DateTime ArrivalTime { get; set; }
        [DataMember]
        public System.DateTime DepartureTime { get; set; }
        
    }

    [DataContract]
    public class SerializeMetadataManageTrips
    {
        [DataMember]
        public Trip trip { get; set; }
        [DataMember]
        public List<TripStop> tripStops { get; set; }
    }

    [DataContract]
    public class SerializeMetadataRoute
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Source { get; set; }
        [DataMember]
        public string Destination { get; set; }
        [DataMember]
        public int Admin { get; set; }
    }
    [DataContract]
    public class SerializeMetadataStop
    {
        [DataMember]
        public int RouteID { get; set; }
        [DataMember]
        public string Stop1 { get; set; }
        [DataMember]
        public double DistanceFromOrigin { get; set; }
        
        
    }
    [DataContract]

    public class SerializeMetadataManageRoutes
    {
        [DataMember]
        public Route route { get; set; }
        [DataMember]
        public List<Stop> stops { get; set; }
    }
}