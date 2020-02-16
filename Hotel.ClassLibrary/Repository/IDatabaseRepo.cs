using Dapper;
using log4net;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using ClassLibrary.DbHelper;
using ClassLibrary.Models;
using Hotel.ClassLibrary.Models;

namespace ClassLibrary.Repository
{
    public interface IDatabaseRepo
    {
        bool DeleteGuest(int Guest_ID);
        bool AddGuest(Guests guest);
        
        List<Guests> GetAllGuests();
        Guests GetGuestByID(int Guest_ID);

        bool RemoveBooking(int booking_ID);
        bool UpdateBookingCheckoutdate(int id, Bookings bookings);
        bool UpdateBookingCheckindate(int id, Bookings bookings);
        bool AddBooking(Bookings booking);
        List<Bookings> GetAllBookings();
        List<Bookings> GetReservationsbyGuestID(int guestid);
        Bookings GetBookingByID(int booking_ID);
        bool UpdateGuestContact(int id, Guests guest);

        LoginData GetUser(string username, string password);



    }



}
