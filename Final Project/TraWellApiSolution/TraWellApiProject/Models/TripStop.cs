//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TraWellApiProject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TripStop
    {
        public int TripId { get; set; }
        public string Stop { get; set; }
        public System.DateTime ArrivalTime { get; set; }
        public System.DateTime DepartureTime { get; set; }
    
        public virtual Place Place { get; set; }
        public virtual Trip Trip { get; set; }
    }
}
