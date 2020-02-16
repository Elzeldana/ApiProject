using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hotel.ClassLibrary.Models;
using Bookingservices;
namespace Hotel.ClassLibrary.Services
{
    public interface IBookingsService
    {
        bool RemoveBooking(int booking_ID);
        bool UpdateArrivalDate(int id, Bookings bookings);
        bool UpdateDepartureDate(int id, Bookings booking);
        List<Bookings> GetAllBookings();
        List<Bookings> GetBookingsByGuestId(int Guest_ID);
        Bookings GetBookingByID(int booking_ID);
        bool AddBooking(Bookings booking);
       
    }
}
