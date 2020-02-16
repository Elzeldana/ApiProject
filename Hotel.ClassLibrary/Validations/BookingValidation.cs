using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hotel.ClassLibrary.Models;
using FluentValidation;

namespace Hotel.ClassLibrary.Validations
{
    public class BookingValidation: AbstractValidator<Bookings>
    {
        public BookingValidation()
        {
            RuleFor(x => x.Check_in_date).NotEmpty().WithMessage("Must provide check-in date!");
            RuleFor(x => x.Check_out_date).NotEmpty().WithMessage("Must provide check-out date!");
            RuleFor(x => x.Guest_id).NotEmpty().WithMessage("Must provide guest id!");
            RuleFor(x => x.Num_persons).NotEmpty().WithMessage("Number of persons needed");

        }
    }
}
