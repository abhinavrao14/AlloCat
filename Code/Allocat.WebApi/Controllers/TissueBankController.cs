using Allocat.ApplicationService;
using Allocat.DataModel;
using Allocat.DataService;
using Allocat.DataServiceInterface;
using Allocat.WebApi.WebApiModel;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Allocat.WebApi.CustomService;
using System;

namespace Allocat.WebApi.Controllers
{
    public class TissueBankController : ApiController
    {
        ITissueBankDataService tbDataService;
        ITransactionDataService transactionDataService;
        IErrorDataService errorDataService;
        IStatusDataService statusDataService;

        public TissueBankController()
        {
            tbDataService = new TissueBankDataService();
            transactionDataService = new TransactionDataService();
            errorDataService = new ErrorDataService();
            statusDataService = new StatusDataService();
        }

        [HttpPost]
        public HttpResponseMessage Post(TissueBankAdd_DTO tissueBankAdd_DTO)
        {
            //Initialisation
            TransactionalInformation transaction = new TransactionalInformation();
            TissueBankApiModel tbApiModel = new TissueBankApiModel();
            Status status = new Status();

            TissueBankBusinessService tissueBankBusinessService = new TissueBankBusinessService(tbDataService);
            TransactionBusinessService transactionBusinessService = new TransactionBusinessService(transactionDataService);
            ErrorBusinessService errorBusinessService = new ErrorBusinessService(errorDataService);
            StatusBusinessService statusBusinessService = new StatusBusinessService(statusDataService);

            //Convert object to string to send as requestBody
            string objToPass = Utility.Utilities.SerializeObject<TissueBankAdd_DTO>(tissueBankAdd_DTO);

            //create transaction
            int TransactionId = transactionBusinessService.Transaction_Create(DateTime.Now, 25, tissueBankAdd_DTO.UserId, objToPass, out transaction);

            //Cutting $25 for registration
            var response = CreateCustomerProfileAndCharge(tissueBankAdd_DTO);

            //if response is not null then only save tissue bank detail in database and update transaction too.
            //if (response.CustomerProfileId != null)
            if (true)
            {
                //get status from database for Success
                status = statusBusinessService.GetStatusByStatusName("Success");
                #region static data of response from authorize .net

                tissueBankAdd_DTO.AuthTransactionId = "123454613";
                tissueBankAdd_DTO.CustomerProfileId = "56456123132";
                tissueBankAdd_DTO.CustomerPaymentProfileIds = "[{sfdsd:asdasd},{asdfasdf:sadfasdf}]";
                tissueBankAdd_DTO.AuthCode = "456456";
                #endregion

                //tissueBankAdd_DTO.AuthTransactionId = response.Transaction.TransactionId;
                //tissueBankAdd_DTO.CustomerProfileId = response.CustomerProfileId;
                //tissueBankAdd_DTO.CustomerPaymentProfileIds = response.CustomerPaymentProfileIds.ToString();
                //tissueBankAdd_DTO.AuthCode = response.Transaction.AuthCode;

                tissueBankAdd_DTO.StatusId = status.StatusId;
                tissueBankAdd_DTO.TransactionCompleteDate = DateTime.Now;
                tissueBankAdd_DTO.TransactionId = TransactionId;
                tissueBankAdd_DTO.ResponseBody = Utility.Utilities.SerializeObject<ResCustomerProfile>(response);

                //add tissue bank
                tissueBankBusinessService.TissueBank_Add(tissueBankAdd_DTO.TissueBankName, tissueBankAdd_DTO.ContactPersonName, tissueBankAdd_DTO.ContactPersonNumber, tissueBankAdd_DTO.TissueBankEmailId, tissueBankAdd_DTO.BusinessURL, tissueBankAdd_DTO.TissueBankAddress, tissueBankAdd_DTO.CityId, tissueBankAdd_DTO.ZipCode, tissueBankAdd_DTO.TissueBankStateLicense, tissueBankAdd_DTO.AATBLicenseNumber, tissueBankAdd_DTO.AATBExpirationDate, tissueBankAdd_DTO.AATBAccredationDate, tissueBankAdd_DTO.CustomerProfileId, tissueBankAdd_DTO.CustomerPaymentProfileIds, tissueBankAdd_DTO.UserId, tissueBankAdd_DTO.TissueBankId, tissueBankAdd_DTO.TransactionId, tissueBankAdd_DTO.AuthTransactionId, tissueBankAdd_DTO.AuthCode, tissueBankAdd_DTO.StatusId, tissueBankAdd_DTO.TransactionCompleteDate, tissueBankAdd_DTO.ResponseBody, out transaction);

                tbApiModel.ReturnMessage = transaction.ReturnMessage;
                tbApiModel.ReturnStatus = transaction.ReturnStatus;
            }
            else
            {
                //get status from database for Success
                status = statusBusinessService.GetStatusByStatusName("Error");

                //if response is null then log error and update transaction too.
                string errorMessage = errorBusinessService.Error_Create(status.StatusId, response.Message, "", TransactionId, tissueBankAdd_DTO.UserId, response.MessageCode);

                tbApiModel.ReturnStatus = transaction.ReturnStatus = false;
                tbApiModel.ReturnMessage.Add(response.Message);
            }

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

        private ResCustomerProfile CreateCustomerProfileAndCharge(TissueBankAdd_DTO tissueBankAdd_DTO)
        {
            CustomService.AllocatCustomServiceClient obj = new AllocatCustomServiceClient();
            Customer objCustomer = new Customer();
            ResCustomerProfile response = new ResCustomerProfile();
            CreditCard credit = new CreditCard();
            AddressInfo address = new AddressInfo();
            // Setting input data

            credit.CreditCardNumber = tissueBankAdd_DTO.CreditCardNumber;
            credit.CreditCardType = tissueBankAdd_DTO.CreditCardType;
            credit.CardCode = tissueBankAdd_DTO.ExpiryDate;
            credit.ExpiryDate = tissueBankAdd_DTO.ExpiryDate;

            objCustomer.CardInfo = credit;

            objCustomer.EmailId = tissueBankAdd_DTO.TissueBankEmailId;
            objCustomer.FirstName = tissueBankAdd_DTO.ContactPersonName;
            objCustomer.LastName = "";

            address.Address = tissueBankAdd_DTO.TissueBankAddress;
            address.City = tissueBankAdd_DTO.City;
            address.Company = tissueBankAdd_DTO.TissueBankName;
            address.Country = "";
            address.ZipCode = tissueBankAdd_DTO.ZipCode;
            address.Email = tissueBankAdd_DTO.TissueBankEmailId;
            address.FaxNumber = "";
            address.FirstName = tissueBankAdd_DTO.ContactPersonName;
            address.LastName = "";
            address.PhoneNumber = tissueBankAdd_DTO.ContactPersonNumber;
            address.State = "";
            objCustomer.HomeAddress = address;

            address = null;
            address = new AddressInfo();

            address.Address = tissueBankAdd_DTO.TissueBankAddress;
            address.City = tissueBankAdd_DTO.City;
            address.Company = tissueBankAdd_DTO.TissueBankName;
            address.Country = "";
            address.ZipCode = tissueBankAdd_DTO.ZipCode;
            address.Email = tissueBankAdd_DTO.TissueBankEmailId;
            address.FaxNumber = "";
            address.FirstName = tissueBankAdd_DTO.ContactPersonName;
            address.LastName = "";
            address.PhoneNumber = tissueBankAdd_DTO.ContactPersonNumber;
            address.State = "";
            objCustomer.OfficeAddress = address;

            objCustomer.PaymentType = PaymentType.CreditCard;

            // calling service method
            response = obj.RegisterCustomerAndChargeProfile(objCustomer, 25);
            return response;
        }
    }
}
