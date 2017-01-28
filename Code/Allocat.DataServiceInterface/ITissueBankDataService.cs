using Allocat.DataModel;
using System;
using System.Collections.Generic;
using System.Data;

namespace Allocat.DataServiceInterface
{
    public interface ITissueBankDataService : IDataService, IDisposable
    {
        int TissueBank_User_Registration(string FullName, string UserName, string EmailId, string SecurityQuestion, string SecurityAnswer, string Password, out TransactionalInformation transaction);
<<<<<<< HEAD
        void TissueBank_Add(string TissueBankName, string ContactPersonFirstName,string ContactPersonLastName, string ContactPersonNumber, string ContactPersonEmailId, string FaxNumber, string TissueBankEmailId, string BusinessURL, string TissueBankAddress, int CityId, string ZipCode, string TissueBankStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate, string CreditCardNumber, string CustomerProfileId, string CustomerPaymentProfileIds, string BillingAddress, int BillingCityId, string BillingZipCode, string BillingFaxNumber, string BillingEmailId, string BillingContactNumber, int UserId, int TissueBankId, int TransactionId, string AuthTransactionId, string AuthCode, int StatusId, DateTime TransactionCompleteDate, string ResponseBody, out TransactionalInformation transaction);
        void TissueBank_Update(string TissueBankName, string ContactPersonFirstName,string ContactPersonLastName, string ContactPersonNumber, string ContactPersonEmailId, string FaxNumber, string TissueBankEmailId, string BusinessURL, string TissueBankAddress, int CityId, string ZipCode, string CustomerServiceLandLineNumber ,string TaxPayerId,string TissueBankStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate, string CreditCardNumber, string CustomerProfileId, string CustomerPaymentProfileIds, string BillingAddress, int BillingCityId, string BillingZipCode, string BillingFaxNumber, string BillingEmailId, string BillingContactNumber, int UserId, int TissueBankId, int TransactionId, string AuthTransactionId, string AuthCode, int StatusId, DateTime TransactionCompleteDate, string ResponseBody,string OperationType, out TransactionalInformation transaction);
        usp_TissueBank_Get_Result GetTissueBankById(int TissueBankId, out TransactionalInformation transaction);
=======
        void TissueBank_Add(string TissueBankName, string ContactPersonName, string ContactPersonNumber, string TissueBankEmailId, string BusinessURL, string TissueBankAddress, int CityId,string ZipCode, string TissueBankStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate,string CustomerProfileId, string CustomerPaymentProfileIds, int UserId, int TissueBankId, int TransactionId, string AuthTransactionId, string AuthCode, int StatusId, DateTime TransactionCompleteDate,string ResponseBody, out TransactionalInformation transaction);

>>>>>>> 2b00939ddbec22f2dcf9ae366ed9f1ce95d9139f
        bool ValidateUniqueTissueBankEmailId(string TissueBankEmailId);
        bool ValidateUniqueContactPersonNumber(string ContactPersonNumber);
        bool ValidateUniqueAATBLicenseNumber(string AATBLicenseNumber);
        bool ValidateUniqueTissueBankStateLicense(string TissueBankStateLicense);
<<<<<<< HEAD

        bool ValidateSingleTissueBankEmailId(string TissueBankEmailId,int TissueBankId);
        bool ValidateSingleContactPersonNumber(string ContactPersonNumber, int TissueBankId);
        bool ValidateSingleAATBLicenseNumber(string AATBLicenseNumber, int TissueBankId);
        bool ValidateSingleTissueBankStateLicense(string TissueBankStateLicense, int TissueBankId);
=======
>>>>>>> 2b00939ddbec22f2dcf9ae366ed9f1ce95d9139f
    }
}
