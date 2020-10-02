using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace TraWellApiProject.Models
{
    [DataContract]
    public class DetailedSearchResult
    {
        [DataMember]
        public Trip Trip { get; set; }
        [DataMember]
        public Bus BusDetails { get; set; }
        [DataMember]
        public List<SearchResult> Searches { get; set; }

    }

}