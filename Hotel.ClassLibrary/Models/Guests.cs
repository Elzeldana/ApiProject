using Newtonsoft.Json;


namespace ClassLibrary.Models
{
    public class Guests
    {
        [JsonProperty("guestid")]
        public int Guest_ID { get; set; }

        [JsonProperty("firstname")]
        public string Guest_FirstName { get; set; }

        [JsonProperty("lastname")]
        public string Guest_LastName { get; set; }

        [JsonProperty("contactnum")]
        public string Guest_ContactNumber { get; set; }

        [JsonProperty("email")]
        public string Gust_Email { get; set; }

        [JsonProperty("adress")]
        public string Guest_adress { get; set; }

        [JsonProperty("placeofbirth")]
        public string Guest_PlaceOfBirth { get; set; }

        [JsonProperty("country")]
        public string Guest_Country { get; set; }
        [JsonProperty("idcardnumer")]
        public string Guest_idcardNo { get; set; }


    }
}
