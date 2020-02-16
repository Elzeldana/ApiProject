using FluentValidation;
using ClassLibrary.Models;


namespace ClassLibrary.Validations
{
   public class GuestsValidation : AbstractValidator<Guests>
    {
        public GuestsValidation()
        {
            RuleFor(x => x.Guest_FirstName).NotEmpty().WithMessage("Guest first name is required!");
            RuleFor(x => x.Guest_LastName).NotEmpty().WithMessage("Guest last name is required!");
            RuleFor(x => x.Gust_Email).NotEmpty().WithMessage("Provide email please");
            RuleFor(x => x.Gust_Email).EmailAddress().WithMessage("Invalid email");
            RuleFor(x => x.Guest_ContactNumber).NotEmpty().WithMessage("Provide contact number please");
            RuleFor(x => x.Guest_adress).NotEmpty().WithMessage("Provide home adress please");
            RuleFor(x => x.Guest_idcardNo).NotEmpty().WithMessage("Guest indetification must be provided");
            RuleFor(x => x.Guest_idcardNo).MinimumLength(5).WithMessage("Invalid document numer");
            RuleFor(x => x.Guest_PlaceOfBirth).NotEmpty().WithMessage("Guest place of birth is required");


        }
}
}
