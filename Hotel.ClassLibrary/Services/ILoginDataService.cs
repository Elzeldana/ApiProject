using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hotel.ClassLibrary.Models;

namespace Hotel.ClassLibrary.Services
{
   public  interface ILoginDataService
    {
        LoginData ValidateLogin(string username, string password);
    }
}
