using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassLibrary.Repository;
using Hotel.ClassLibrary.Models;
using Hotel.ClassLibrary.Services;

 namespace Bookingservices
{
    public class BookingsService : IBookingsService

    {
        private readonly IDatabaseRepo repo;
        public BookingsService(IDatabaseRepo repo)
        {
            this.repo = repo;
        }
        public bool RemoveBooking(int booking_ID)
        {

            Bookings booking = repo.GetBookingByID(booking_ID);

            if (booking == null) return true;
            return repo.RemoveBooking(booking_ID);
        }

        public bool UpdateDepartureDate (int id, Bookings bookings)
        {

            if (bookings == null) return false;

            var foundbooking = repo.GetBookingByID(id);

            if (foundbooking == null)
                throw new ApplicationException("Booking does not exist!");
            return repo.UpdateBookingCheckoutdate(id, bookings);
        }

        public List<Bookings> GetAllBookings()
        {
            var bookings = repo.GetAllBookings();
            return bookings;
        }

        public List<Bookings> GetBookingsByGuestId(int Guest_ID)
        {
            var bookings = repo.GetReservationsbyGuestID(Guest_ID);
            return bookings;
        }
        public Bookings GetBookingByID(int booking_ID)

        {
            var booking = repo.GetBookingByID(booking_ID);

            return booking;
        }

        public bool AddBooking(Bookings booking)
        {
            if (booking == null) return false;

            return repo.AddBooking(booking);

        }

        public bool UpdateArrivalDate(int id, Bookings bookings)
        {
            if (bookings == null) return false;

            var foundbooking = repo.GetBookingByID(id);

            if (foundbooking == null)
                throw new ApplicationException("Booking does not exist!");
            return repo.UpdateBookingCheckindate(id, bookings);

        }

































    }
}
