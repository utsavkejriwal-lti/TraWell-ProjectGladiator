//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AdminWebAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Feedback
    {
        public int Id { get; set; }
        public int BookingID { get; set; }
        public int BusID { get; set; }
        public Nullable<int> BookingFeedback { get; set; }
        public Nullable<int> BusFeedback { get; set; }
    
        public virtual Booking Booking { get; set; }
        public virtual Bus Bus { get; set; }
    }
}
