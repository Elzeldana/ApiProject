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
    public class DatabaseRepo : IDatabaseRepo
    {
        readonly ILog logger;

        public DatabaseRepo(ILog logger)
        {
            this.logger = logger;
        }


        public bool DeleteGuest(int Guest_ID)
        {
            logger.Info("Delete " + Guest_ID);
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@id", Guest_ID);

                    int result = conn.Execute("spDeleteCustomer", parameter, commandType: CommandType.StoredProcedure);

                    return result > 0;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error  while deleting the guest! " + e.Message, e);
                return false;
            }

        }
        public bool AddGuest(Guests guest)
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@Guest_FirstName", guest.Guest_FirstName);
                    parameter.Add("@Guest_LastName", guest.Guest_LastName);
                    parameter.Add("@Guest_ContactNumber", guest.Guest_ContactNumber);
                    parameter.Add("@Gust_Email", guest.Gust_Email);
                    parameter.Add("@Guest_adress", guest.Guest_adress);
                    parameter.Add("@Guest_PlaceOfBirth", guest.Guest_PlaceOfBirth);
                    parameter.Add("@Guest_Country", guest.Guest_Country);
                    parameter.Add("@Guest_idcardNo", guest.Guest_idcardNo);


                    int result = conn.Execute("spInsertCustomer", parameter, commandType: CommandType.StoredProcedure);

                    return result > 0;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error while inserting the guest! " + e.Message, e);
                return false;
            }
        }



        public List<Guests> GetAllGuests()
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    List<Guests> result = conn.Query<Guests>("spGetAllCustomers", commandType: CommandType.StoredProcedure).ToList();

                    return result;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error happened while getting the guests! " + e.Message, e);
                return null;
            }
        }

        public Guests GetGuestByID(int Guest_ID)
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@id", Guest_ID);

                    Guests result = conn.Query<Guests>("spGetCustomer", parameter, commandType: CommandType.StoredProcedure).FirstOrDefault();

                    return result;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error happened while getting the guest! " + e.Message, e);
                return null;
            }
        }

        public bool RemoveBooking(int booking_ID)
        {
            logger.Info("Delete " + booking_ID);
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@id", booking_ID);

                    int result = conn.Execute("dbo.spRemoveReservation", parameter, commandType: CommandType.StoredProcedure);

                    return result > 0;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error while removing reservation!" + e.Message, e);
                return false;
            }
        }
        public bool UpdateBookingCheckoutdate(int id, Bookings bookings)
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@checkout", bookings.Check_out_date);
                    parameter.Add("@id", id);

                    int result = conn.Execute("UpdateCheckOut", parameter, commandType: CommandType.StoredProcedure);

                    return result > 0;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error happened while updating check-out dates! " + e.Message, e);
                return false;
            }
        }

        public bool UpdateBookingCheckindate(int id, Bookings bookings)
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@checkin", bookings.Check_in_date);
                    parameter.Add("@id", id);

                    int result = conn.Execute("UpdtateArrivalDate", parameter, commandType: CommandType.StoredProcedure);

                    return result > 0;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error happened while updating check-in dates! " + e.Message, e);
                return false;
            }
        }
        public List<Bookings> GetAllBookings()
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    List<Bookings> result = conn.Query<Bookings>("spGetAllBookins", commandType: CommandType.StoredProcedure).ToList();

                    return result;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error happened while getting all reservations! " + e.Message, e);
                return null;
            }

        }
       
        public Bookings GetBookingByID(int booking_ID)
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@bookingid", booking_ID);

                    Bookings result = conn.Query<Bookings>("dbo.spGetBookingByID", parameter, commandType: CommandType.StoredProcedure).FirstOrDefault();

                    return result;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error  while getting the reservation! " + e.Message, e);
                return null;
            }
        }

        public bool AddBooking(Bookings booking)
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@@checkin", booking.Check_in_date);
                    parameter.Add("@checkout", booking.Check_out_date);
                    parameter.Add("@persons", booking.Num_persons);
                    parameter.Add("@guestid", booking.Guest_id);


                    int result = conn.Execute("spInsertNewBooking", parameter, commandType: CommandType.StoredProcedure);

                    return result > 0;
                }
            }

            catch (Exception e)
            {
                logger.Error("Error while adding new booking! " + e.Message, e);
                return false;
            }
        }
        public LoginData GetUser(string UserName, string Password)
        {

            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@username", UserName);
                    parameter.Add("@password", Password);

                    LoginData result = conn.Query<LoginData>("spLogin", parameter, commandType: CommandType.StoredProcedure).FirstOrDefault();

                    return result;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error getting login data " + e.Message, e);
                return null;
            }
        }
        public bool UpdateGuestContact(int id, Guests guest)
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameter = new DynamicParameters();
                    parameter.Add("@phone", guest.Guest_ContactNumber);
                    parameter.Add("@id", id);

                    int result = conn.Execute("UpdatePhone", parameter, commandType: CommandType.StoredProcedure);

                    return result > 0;
                }
            }
            catch (Exception e)
            {
                logger.Error("Error happened while updating contact number! " + e.Message, e);
                return false;
            }
        }


        public List<Bookings> GetReservationsbyGuestID(int guestid)
        {
            try
            {
                using (SqlConnection conn = DbAccess.GetOpenConnection())
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@guestid ", guestid);

                    List<Bookings> booking = conn.Query<Bookings>("spBookingByGuestID", parameters, commandType: CommandType.StoredProcedure).ToList();

                    return booking;
                }

            }
            catch (Exception e)
            {
                logger.Error("Error  while getting  all bookings! " + e.Message, e);
                return null;
            }


        }
    }
}



    