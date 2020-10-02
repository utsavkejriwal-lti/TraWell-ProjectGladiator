using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [MetadataType(typeof(MetaRoute))]
    [DataContract]
    public partial class Route { }

    [MetadataType(typeof(MetaBooking))]
    [DataContract]
    public partial class Booking { }


    [MetadataType(typeof(MetaBus))]
    [DataContract]
    public partial class Bus { }


    [MetadataType(typeof(MetaGuestUser))]
    [DataContract]
    public partial class GuestUser { }


    [MetadataType(typeof(MetaPassengerDetail))]
    [DataContract]
    public partial class PassengerDetail { }


    [MetadataType(typeof(MetaPlace))]
    [DataContract]
    public partial class Place { }


    [MetadataType(typeof(MetaStop))]
    [DataContract]
    public partial class Stop { }


    [MetadataType(typeof(MetaTransaction))]
    [DataContract]
    public partial class Transaction { }


    [MetadataType(typeof(MetaTrip))]
    [DataContract]
    public partial class Trip { }


    [MetadataType(typeof(MetaTripStop))]
    [DataContract]
    public partial class TripStop { }


    [MetadataType(typeof(MetaUser))]
    [DataContract]
    public partial class User { }


    [MetadataType(typeof(MetaUserLog))]

    public partial class UserLog { }

    [MetadataType(typeof(SerializeMetadataManageRoutes))]
    [DataContract]
    public partial class ManageRoutes { }

    [MetadataType(typeof(SerializeMetadataManageTrips))]
    [DataContract]
    public partial class ManageTrips { }

    [MetadataType(typeof(SerializeMetadataFeedback))]
    [DataContract]
    public partial class prc_feedback_Result { }

    
    [MetadataType(typeof(SerializeMetadataProfit))]
    [DataContract]
    public partial class prc_profit_Result { }

    [MetadataType(typeof(SerializeMetadataFrequentRoutes))]
    [DataContract]
    public partial class prc_frequent_routes_Result { }

    [MetadataType(typeof(MetaAdmin))]
    [DataContract]
    public partial class Admin { }

    [MetadataType(typeof(MetaFeedback))]
    [DataContract]
    public partial class Feedback { }

    public class SerializeMetadataManageRoutes
    {
        [DataMember]
        public Route route { get; set; }
        [DataMember]
        public List<Stop> stops { get; set; }
    }
    public class SerializeMetadataManageTrips
    {
        [DataMember]
        public Trip trip { get; set; }
        [DataMember]
        public List<TripStop> tripStops { get; set; }
    }
    public class SerializeMetadataFeedback
    {
        [DataMember]
        public int busid { get; set; }
        [DataMember]
        public Nullable<int> feedbackBus { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string Number { get; set; }
    }
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
    public class SerializeMetadataFrequentRoutes
    {

        [DataMember]
        public int routeid { get; set; }
        [DataMember]
        public Nullable<int> TotalTrips { get; set; }

    }

    public class MetaBooking
    {


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

    public class MetaBus
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
        [DataMember]
        public string SeatMap { get; set; }
    }

    public class MetaGuestUser
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public string Contact { get; set; }
    }

    public class MetaPassengerDetail
    {
        [DataMember]
        public int BookingID { get; set; }
        [DataMember]
        public int Seat { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public int Age { get; set; }
        [DataMember]
        public string Gender { get; set; }
    }

    public class MetaPlace
    {
        [DataMember]
        public string Code { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string City { get; set; }
    }

    public class MetaRoute
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Source { get; set; }
        [DataMember]
        public string Destination { get; set; }
        [DataMember]
        public int Admin { get; set; }
        [DataMember]
        public virtual Place Place { get; set; }
        [DataMember]
        public virtual Place Place1 { get; set; }
    }

    public class MetaStop
    {
        [DataMember]
        public int RouteID { get; set; }

        [DataMember]
        public string Stop1 { get; set; }

        [DataMember]
        public double DistanceFromOrigin { get; set; }
        [DataMember]
        public virtual Place Place { get; set; }
    }

    public class MetaTransaction
    {
        [DataMember]
        public int id { get; set; }
        [DataMember]
        public decimal amount { get; set; }
        [DataMember]
        public int BookingID { get; set; }
        [DataMember]
        public string Mode { get; set; }
        [DataMember]
        public string TransType { get; set; }
        [DataMember]
        public System.DateTime TransactionDate { get; set; }
    }

    public class MetaTrip
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

    public class MetaTripStop
    {
        [DataMember]
        public string Stop { get; set; }

        [DataMember]
        public System.DateTime ArrivalTime { get; set; }

        [DataMember]
        public System.DateTime DepartureTime { get; set; }

        [DataMember]
        public virtual Place Place { get; set; }
    }

    public class MetaUser
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string FirstName { get; set; }
        [DataMember]
        public string LastName { get; set; }
        [DataMember]
        public string Email { get; set; }
        [DataMember]
        public string Password { get; set; }
        [DataMember]
        public string Contact { get; set; }
        [DataMember]
        public int Wallet { get; set; }
        [DataMember]
        public Nullable<System.DateTime> DOB { get; set; }
        [DataMember]
        public string Address { get; set; }
        [DataMember]
        public string Gender { get; set; }
    }

    public class MetaUserLog
    {
        public int Id { get; set; }
        public string EncData { get; set; }
        public Nullable<int> UserId { get; set; }
    }

    public class MetaAdmin
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Username { get; set; }
       [DataMember]
        public string Password { get; set; }
    }

    public class MetaFeedback
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public int BookingID { get; set; }
        [DataMember]
        public int BusID { get; set; }
        [DataMember]
        public Nullable<int> BookingFeedback { get; set; }
        [DataMember]
        public Nullable<int> BusFeedback { get; set; }

    }
}