﻿using System;
using Newtonsoft.Json;


namespace Hotel.ClassLibrary.Models
{
    public class Bookings
    {
        [JsonProperty("bookingid")]
        public int Booking_ID { get; set; }

        [JsonProperty("datebooked")]
        public DateTime Booking_date { get; set; }

        [JsonProperty("numberofdays")]
        public string Duration_ofstay { get; set; }

        [JsonProperty("arrivaldate")]
        public DateTime Check_in_date { get; set; }

        [JsonProperty("departuredate")]
        public DateTime Check_out_date { get; set; }

        [JsonProperty("numpersons")]
        public int Num_persons { get; set; }
      
        [JsonProperty("guestid")]
        public int Guest_id { get; set; }

        
    }
}