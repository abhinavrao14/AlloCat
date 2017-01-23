using Allocat.ApplicationService;
using Allocat.DataModel;
using Allocat.DataService;
using Allocat.DataServiceInterface;
using Allocat.WebApi.WebApiModel;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Allocat.WebApi.CustomService;

namespace Allocat.WebApi.Controllers
{
    public class TissueBankController : ApiController
    {
        ITissueBankDataService tbDataService;

        public TissueBankController()
        {
            tbDataService = new TissueBankDataService();
        }

        [HttpPost]
        public HttpResponseMessage Post(TissueBankRegisteration_DTO tissueBank_DTO)
        {
            CustomService.AllocatCustomServiceClient obj = new AllocatCustomServiceClient();
            Customer objCustomer = new Customer();
            ResCreateCustomerProfile response = new ResCreateCustomerProfile();
            CreditCard credit = new CreditCard();
            AddressInfo address = new AddressInfo();
            // Setting input data

            credit.CreditCardNumber = tissueBank_DTO.CreditCardNumber;
            credit.CreditCardType = tissueBank_DTO.CreditCardType;
            credit.ExpiryDate = tissueBank_DTO.ExpiryDate;

            objCustomer.CardInfo = credit;

            objCustomer.EmailId = tissueBank_DTO.TissueBankEmailId;
            objCustomer.FirstName = tissueBank_DTO.ContactPersonName;
            objCustomer.LastName = "";

            address.Address = tissueBank_DTO.TissueBankAddress;
            address.City = tissueBank_DTO.City;
            address.ZipCode = tissueBank_DTO.ZipCode;
            objCustomer.HomeAddress = address;

            address = null;
            address = new AddressInfo();

            address.Address = tissueBank_DTO.TissueBankAddress;
            address.City = tissueBank_DTO.City;
            address.ZipCode = "123456";
            objCustomer.OfficeAddress = address;


            objCustomer.PaymentType = PaymentType.CreditCard;

            // calling service method
            response = obj.RegisterCustomerAndChargeProfile(objCustomer, 25);

            TransactionalInformation transaction = new TransactionalInformation();

            TissueBankApiModel tbApiModel = new TissueBankApiModel();

            TissueBankBusinessService tissueBankBusinessService = new TissueBankBusinessService(tbDataService);

            //if (tissueBank_DTO.TissueBankId == 0)
            //{
                //tissueBankBusinessService.AddTissueBank(tissueBank_DTO.TissueBankId, tissueBank_DTO.TissueBankName, tissueBank_DTO.ContactPersonName, tissueBank_DTO.ContactPersonNumber, tissueBank_DTO.TissueBankEmailId, tissueBank_DTO.BusinessURL, tissueBank_DTO.TissueBankAddress, tissueBank_DTO.CityId, tissueBank_DTO.TissueBankStateLicense, tissueBank_DTO.AATBLicenseNumber, tissueBank_DTO.AATBExpirationDate, tissueBank_DTO.AATBAccredationDate, tissueBank_DTO.UserName, tissueBank_DTO.ZipCode, tissueBank_DTO.CreditCardNumber, tissueBank_DTO.CreditCardType, tissueBank_DTO.ExpiryDate, tissueBank_DTO.City, out transaction);
            //}
            //else
            //{
            //    //orderBusinessService.UpdateTissueBank(tissueBank, out transaction);
            //}

            tbApiModel.ReturnMessage = transaction.ReturnMessage;
            tbApiModel.ReturnStatus = transaction.ReturnStatus;

            if (transaction.ReturnStatus == false)
            {
                tbApiModel.ValidationErrors = transaction.ValidationErrors;
                return Request.CreateResponse<TissueBankApiModel>(HttpStatusCode.BadRequest, tbApiModel);
            }
            else
            {
                return Request.CreateResponse<TissueBankApiModel>(HttpStatusCode.OK, tbApiModel);
            }
        }
    }
}
