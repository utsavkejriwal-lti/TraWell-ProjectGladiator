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
    public class BookingController : ApiController
    {
        TraWellDummyEntities db = new TraWellDummyEntities();

        [HttpGet]
        [Route("api/booking/CancelBooking")]
        public Boolean CancelBooking(int id)
        {
            if(db.Bookings.Any(b => b.BookingID == id && b.Status == "booked"))
            {
                Booking booking = db.Bookings.Where(b => b.BookingID == id && b.Status == "booked").First();
                booking.Status = "cancelled";
                db.Entry(booking).State = System.Data.Entity.EntityState.Modified;
                Transaction transaction = new Transaction();
                transaction.amount = (decimal)booking.Amount;
                transaction.BookingID = booking.BookingID;
                transaction.Mode = "Wallet";
                transaction.TransactionDate = DateTime.Now;
                transaction.TransType = "Credit";
                db.Transactions.Add(transaction);
                User user = db.Users.Where(u => u.Id == booking.UserId).First();
                user.Wallet += (int)booking.Amount;
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            return false;
        }

        [HttpGet]
        [Route("api/booking/getUserBooking")]
        public List<int> GetUserBookings(int id)
        {
            return db.Bookings.Where(b => b.UserId == id).Select(bd => bd.BookingID).ToList();
           
        }

        [HttpGet]
        [Route("api/booking/GetBooking")]
        public GetBooking GetBookingById(int id)
        {
            GetBooking getBooking = new GetBooking();

            if(db.Bookings.Any(b => b.BookingID == id))
            {
                getBooking.booking = db.Bookings.Where(b => b.BookingID == id).First();

                getBooking.transactions = db.Transactions.Where(t => t.BookingID == id).ToList();

                getBooking.passengers = db.PassengerDetails.Where(p => p.BookingID == id).ToList();
                if(getBooking.booking.UserRegistered == 1)
                {
                    getBooking.user = db.Users.Where(u => u.Id == getBooking.booking.UserId).First();
                }
                else
                {
                    getBooking.guestUser = db.GuestUsers.Where(u => u.Id == getBooking.booking.GuestId).First();
                }

                getBooking.FromStop = db.TripStops.Where(ts => ts.Stop == getBooking.booking.Boarding && ts.TripId == getBooking.booking.TripId).FirstOrDefault();
                getBooking.ToStop = db.TripStops.Where(ts => ts.Stop == getBooking.booking.Arrival && ts.TripId == getBooking.booking.TripId).FirstOrDefault();
                getBooking.bus = getBooking.booking.Trip.Bus;
                return getBooking;
            }
            
                return null;
            
        }


        [HttpPost]
        [Route("api/booking/CreateNewBooking")]
        public List<int> CreateNewBooking(CompleteBookingDetails cBD)
        {
            List<BookingDetails> bookingDetails = cBD.Bookings;
            List<BookingTransactions> bookingTransactions = cBD.Transactions;
            List<BookingPassengers> bookingPassengers = cBD.Passengers;
            GuestUser guestUser = cBD.GuestUser;
            List<int> Ids = new List<int>();

            Boolean IsReturn = cBD.Bookings.Count > 1 ? true : false;

            Booking onwardBooking = ConvertToBooking(cBD.Bookings.First());
            List<BookingTransactions> onwardTransactions = cBD.Transactions.Where(t => t.BookingDirection == "onward").ToList();
            if (cBD.Bookings[0].UserRegistered == 1)
            {
                Ids.Add(AddBooking(cBD.Bookings[0], onwardTransactions, cBD.Passengers.ToList()));
            }
            else
            {
                Ids.Add(AddBooking(cBD.Bookings[0], onwardTransactions, cBD.Passengers.ToList(), cBD.GuestUser));
            }
            


           
            if (IsReturn)
            {
                
                List<BookingTransactions> returnTransactions = cBD.Transactions.Where(t => t.BookingDirection == "return").ToList();
                
                if (cBD.Bookings[1].UserRegistered == 1)
                {
                    Ids.Add(AddBooking(cBD.Bookings[1], returnTransactions, cBD.Passengers));
                }
                else
                {
                    Ids.Add(AddBooking(cBD.Bookings[1], returnTransactions, cBD.Passengers,guestUser));
                }
            }

            



            return Ids;
        } 

        private int AddBooking(BookingDetails bookingDetails, List<BookingTransactions> transactions, List<BookingPassengers> passengers, GuestUser guestUser = null)
        {
            GuestUser guest = new GuestUser();
            Booking booking = ConvertToBooking(bookingDetails);
            if (bookingDetails.UserRegistered != 1)
            {
                if(db.GuestUsers.Any(gu => gu.Email == guestUser.Email && gu.Contact == guestUser.Contact))
                {
                    guest = db.GuestUsers.Where(gu => gu.Email == guestUser.Email && gu.Contact == guestUser.Contact).First();
                }
                else
                {
                    guest = guestUser;
                    db.GuestUsers.Add(guest);
                    db.SaveChanges();
                }
                booking.GuestId = guest.Id;
            }

            db.Bookings.Add(booking);
            db.SaveChanges();

            foreach (BookingPassengers bookingPassenger in passengers)
            {
                PassengerDetail passenger = ConvertPassenger(bookingPassenger);
                passenger.BookingID = booking.BookingID;
                db.PassengerDetails.Add(passenger);
                db.SaveChanges();
            }

            foreach (BookingTransactions bookingTransaction in transactions)
            {
                Transaction transaction = ConvertToTransaction(bookingTransaction);
                transaction.BookingID = booking.BookingID;
                db.Transactions.Add(transaction);
                

                if(transaction.Mode == "Wallet")
                {
                    User user = db.Users.Where(u => u.Id == booking.UserId).First();
                    user.Wallet -= (int)transaction.amount;
                    db.Entry(user).State = System.Data.Entity.EntityState.Modified;
                }
                db.SaveChanges();
            }
            return booking.BookingID;
        }

        private Booking ConvertToBooking(BookingDetails bookingDetails)
        {
            Booking booking = new Booking();
            booking.Amount = bookingDetails.Amount;
            booking.Arrival = bookingDetails.Arrival;
            booking.Boarding = bookingDetails.Boarding;
            booking.Status = bookingDetails.Status;
            booking.UserRegistered = bookingDetails.UserRegistered;
            if(booking.UserRegistered == 1)
            {
                booking.UserId = bookingDetails.UserId;
            }
            booking.TripId = bookingDetails.TripId;
            booking.BookingDate = DateTime.Now;

            return booking;
        }

        private Transaction ConvertToTransaction(BookingTransactions bookingTransactions)
        {
            Transaction transaction = new Transaction();
            transaction.amount = bookingTransactions.amount;
            transaction.Mode = bookingTransactions.Mode;
            transaction.TransType = bookingTransactions.TransType;
            transaction.TransactionDate = DateTime.Now;

            return transaction;
        }

        private PassengerDetail ConvertPassenger(BookingPassengers bookingPassengers)
        {
            PassengerDetail passenger = new PassengerDetail();
            passenger.Age = bookingPassengers.Age;
            passenger.Seat = bookingPassengers.Seat;
            passenger.Name = bookingPassengers.Name;
            passenger.Gender = bookingPassengers.Gender;

            return passenger;
        }
    }
}
