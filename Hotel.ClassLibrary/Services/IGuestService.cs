using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassLibrary.Models;

namespace ClassLibrary.Services
{
    public interface IGuestService
    {

        bool DeleteGuest(int id);
      
        bool AddGuest(Guests value);
        Guests GetGuest(int id);
        IEnumerable<Guests> GetGuests();

        bool UpdateGuestContact(int id, Guests guest);

    }
}