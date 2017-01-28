using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using TestAppCustomService.CustomServiceAuNetRefrence;

namespace TestAppCustomService
{
    public class Program
    {
           
        static void Main(string[] args)
        {
            CustomServiceAuNetRefrence.AllocatCustomServiceClient obj = new AllocatCustomServiceClient();
            Customer objCustomer = new Customer();
            ResCreateCustomerProfile response = new ResCreateCustomerProfile();
            CreditCard credit = new CreditCard();
            AddressInfo address = new AddressInfo();
            // Setting input data

            credit.CreditCardNumber = "4111111111111111";
            credit.CreditCardType = 0;
            credit.ExpiryDate = "0819";

            objCustomer.CardInfo = credit;

            objCustomer.EmailId = "sindhu2843@gmail.com";
            objCustomer.FirstName = "sindhu";
            objCustomer.LastName = "priya";

            address.Address = "Sushant lok";
            address.City = "gurgaon";
            address.ZipCode = "122090";
            objCustomer.HomeAddress = address;

            address = null;
            address = new AddressInfo();

            address.Address = "Unitech sector 21";
            address.City = "gurgaon";
            address.ZipCode = "122089";
            objCustomer.OfficeAddress = address;

            
            objCustomer.PaymentType = PaymentType.CreditCard;

            // calling service method
            response = obj.RegisterCustomerAndChargeProfile(objCustomer, 25);

            //obj.RegisterCustomerAndChargeProfile()

        }
    }
}
