using System.Configuration;
using System.Data.SqlClient;


namespace ClassLibrary.DbHelper
{
    public class DbAccess
    {
        public static SqlConnection GetOpenConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["HOTEL_Managment"].ConnectionString;

            SqlConnection conn = new SqlConnection(connectionString);

            conn.Open();

            return conn;
        }
    }
}
