using MoreLinq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using WebAPIProjGlad.Models;

namespace WebAPIProjGlad.Controllers
{
    [EnableCors("http://localhost:4200", "*", "*")]
    public class SearchQueryController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();

        [HttpPost]
        public List<DetailedSearchResult> SearchQueryResult(SearchQuery sq)
        {
            List<DetailedSearchResult> detailedSearchResults = new List<DetailedSearchResult>();
            List <SearchResult> searchResults = new List<SearchResult>();
            List<Place> DepStops = db.Places.Where(p => p.City == sq.FromCity).ToList();
            List<Place> ArrStops = db.Places.Where(p => p.City == sq.ToCity).ToList();
            List<TripStop> DeptripStops = new List<TripStop>();
            List<TripStop> ArrtripStops = new List<TripStop>();

            foreach (var depStop in DepStops)
            {
                List<TripStop> ValidDepStops = db.TripStops.Where(stop => stop.Stop == depStop.Code && stop.Trip.Status == "Scheduled" && stop.DepartureTime.Year == sq.DepDate.Year && stop.DepartureTime.Month == sq.DepDate.Month && stop.DepartureTime.Day == sq.DepDate.Day).ToList();
                DeptripStops.AddRange(ValidDepStops);
            }

            if(DeptripStops.Count == 0)
            {
                return detailedSearchResults;
            }
            foreach (var arrStop in ArrStops)
            {
                List<TripStop> ValidArrStops = db.TripStops.Where(stop => stop.Stop == arrStop.Code &&  stop.Trip.Status == "Scheduled" && stop.ArrivalTime.Year >= sq.DepDate.Year && stop.ArrivalTime.Month >= sq.DepDate.Month && stop.ArrivalTime.Day >= sq.DepDate.Day).ToList();
                ArrtripStops.AddRange(ValidArrStops);
            }
            if(ArrtripStops.Count == 0)
            {
                return detailedSearchResults;
            }
            
            List<List<TripStop>> lists = new List<List<TripStop>>();
            lists.Add(DeptripStops);
            lists.Add(ArrtripStops);

            foreach (var deptripStop in DeptripStops)
            {
                foreach (var ArrtripStop in ArrtripStops)
                {
                    if(deptripStop.TripId == ArrtripStop.TripId)
                    {
                        int tripId = deptripStop.TripId;
                        Trip trip = db.Trips.Where(t => t.Id == tripId).First();
                        if(deptripStop.DepartureTime < ArrtripStop.ArrivalTime)
                        {

                            List<Booking> bookings = db.Bookings.Where(b => b.TripId == trip.Id && b.Status == "booked").ToList();
                            int SeatAvailable = trip.Bus.Seats;
                            List<int> seatsBooked = new List<int>();
                            if(bookings.Count != 0)
                            {
                                // Find Seats available in this trip
                                foreach (Booking booking in bookings)
                                {
                                    TripStop BookingStartStop = db.TripStops.Where(ts => ts.TripId == booking.TripId && ts.Stop == booking.Boarding).First();
                                    TripStop BookingEndStop = db.TripStops.Where(ts => ts.TripId == booking.TripId && ts.Stop == booking.Arrival).First();

                                    if(!((deptripStop.DepartureTime < BookingStartStop.ArrivalTime && ArrtripStop.ArrivalTime <= BookingStartStop.ArrivalTime) || (deptripStop.ArrivalTime >= BookingEndStop.ArrivalTime && ArrtripStop.ArrivalTime > BookingEndStop.DepartureTime)))
                                    {
                                        SeatAvailable -= db.PassengerDetails.Where(p => p.BookingID == booking.BookingID).Count();
                                        seatsBooked.AddRange(db.PassengerDetails.Where(p => p.BookingID == booking.BookingID).Select(x => x.Seat).ToList());
                                    }
                                }
                            }

                            if (SeatAvailable > 0)
                            {
                                DetailedSearchResult detailed;
                                if(detailedSearchResults.Any( d => d.BusDetails.Id == trip.Bus.Id))
                                {
                                    detailed = detailedSearchResults.Where(d => d.BusDetails.Id == trip.BusID).First();
                                }
                                else
                                {
                                    detailed = new DetailedSearchResult();
                                    detailed.Searches = new List<SearchResult>();
                                    detailedSearchResults.Add(detailed);
                                    
                                    detailed.BusDetails = trip.Bus;
                                }

                                  
                                SearchResult searchResult = new SearchResult();
                                searchResult.FromStop = deptripStop;
                                searchResult.ToStop = ArrtripStop;
                                searchResult.SeatAvailable = SeatAvailable;
                                searchResult.SeatsBooked = seatsBooked;
                                double startKm = db.Stops.Where(stop => stop.Stop1 == deptripStop.Stop && stop.RouteID == trip.RouteID).First().DistanceFromOrigin;
                                double endKm = db.Stops.Where(stop => stop.Stop1 == ArrtripStop.Stop && stop.RouteID == trip.RouteID).First().DistanceFromOrigin;
                                searchResult.CostperSeat = (int) Math.Ceiling(trip.CostPerKm * (endKm - startKm));
                                //searchResult.BusDetails = trip.Bus;
                                searchResult.DurationHours = (ArrtripStop.ArrivalTime - deptripStop.DepartureTime).Hours;
                                searchResult.DurationMins = (ArrtripStop.ArrivalTime - deptripStop.DepartureTime).Minutes;
                                detailed.Searches.Add(searchResult);
                                detailed.Trip = trip;
                                searchResults.Add(searchResult);
                            }
                            
                        }

                    }
                    
                }
            }

            //var xyz = searchResults.DistinctBy(s => s.BusDetails.Id);
            return detailedSearchResults;
            //return lists;
        }

        
    }
}
