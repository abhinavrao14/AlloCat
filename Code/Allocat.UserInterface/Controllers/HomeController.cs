using System.Web.Mvc;
//using Allocat.UserInterface.CustomService;

namespace Allocat.UserInterface.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            //CustomService.AllocatCustomServiceClient obj = new AllocatCustomServiceClient();
            //Customer objCustomer = new Customer();
            //ResCreateCustomerProfile response = new ResCreateCustomerProfile();
            //CreditCard credit = new CreditCard();
            //AddressInfo address = new AddressInfo();
            //// Setting input data

            //credit.CreditCardNumber = "4111111111111111";
            //credit.CreditCardType = 0;
            //credit.ExpiryDate = "0819";

            //objCustomer.CardInfo = credit;

            //objCustomer.EmailId = "alkasdfds@returnonweb.com";
            //objCustomer.FirstName = "Sachan";
            //objCustomer.LastName = "Am";

            //address.Address = "Sushant lok";
            //address.City = "gurgaon";
            //address.ZipCode = "122090";
            //objCustomer.HomeAddress = address;

            //address = null;
            //address = new AddressInfo();

            //address.Address = "Unitech sector 21";
            //address.City = "gurgaon";
            //address.ZipCode = "122089";
            //objCustomer.OfficeAddress = address;


            //objCustomer.PaymentType = PaymentType.CreditCard;

            //// calling service method
            //response = obj.RegisterCustomerAndChargeProfile(objCustomer, 25);
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}