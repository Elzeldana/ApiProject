using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hotel.ClassLibrary.Models;
using ClassLibrary.Repository;

namespace Hotel.ClassLibrary.Services
{
    public class LoginDataService : ILoginDataService

    {
        private readonly IDatabaseRepo repo;
        public LoginDataService(IDatabaseRepo repo)
        {
            this.repo = repo;
        }
        public LoginData ValidateLogin(string username, string password)
        {

            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password)) return null;

            return repo.GetUser(username, password);

        }



    }
}
