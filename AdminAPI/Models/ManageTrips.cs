using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;


namespace AdminWebAPI.Models
{
   
    public partial class ManageTrips
    {
        
        public Trip trip { get; set; }
        
        public List<TripStop> tripStops { get; set; }
    }
}