using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.ClassLibrary.Models
{
    public class RoomType
    {       
        public int Roomtype_ID { get; set; }
        public decimal Room_rate { get; set; }
        public string Roomtype_name { get; set; }
        public string Room_description { get; set; }
    }
}
