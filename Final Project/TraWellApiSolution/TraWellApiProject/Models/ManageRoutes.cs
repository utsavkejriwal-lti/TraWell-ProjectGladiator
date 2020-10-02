using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TraWellApiProject.Models
{
    public partial class ManageRoutes
    {
        public Route route { get; set; }
        public List<Stop> stops { get; set; }
    }
}