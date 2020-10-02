using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassLibrary.Repository;
using ClassLibrary.Models;

namespace ClassLibrary.Services
{
    public class GuestService : IGuestService
    {
        private readonly IDatabaseRepo repo;
        public GuestService(IDatabaseRepo repo)
        {
            this.repo = repo;

        }
        public bool AddGuest(Guests guest)
        {
            if (guest == null) return false;

            return repo.AddGuest(guest);
        }
        public bool DeleteGuest(int id)
        {

            Guests guest = repo.GetGuestByID(id);

            if (guest == null) return true;
            return repo.DeleteGuest(id);
        }

        public Guests GetGuest(int id)
        {
            var guest = repo.GetGuestByID(id);
                
            return guest;
        }
        public IEnumerable<Guests> GetGuests()
        {
            var guests = repo.GetAllGuests();                         

            return guests;
        }


        public bool UpdateGuestContact(int id, Guests guest)
        {
            if (guest == null) return false;

            var guestgound = repo.GetGuestByID(id);

            if (guestgound == null)
                throw new ApplicationException("Guest does not exist!");
            return repo.UpdateGuestContact(id, guest);

        }


    }
    
}



