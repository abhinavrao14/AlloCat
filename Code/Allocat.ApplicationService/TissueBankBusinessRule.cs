using System;
using Allocat.DataModel;
using Allocat.DataServiceInterface;
using Allocat.DataService;

namespace Allocat.ApplicationService
{
    public class TissueBankBusinessRule : ValidationRules
    {
        ITissueBankDataService tbDataService;
        IUserDataService userDataService;

        public TissueBankBusinessRule(ITissueBankDataService _tbDataService)
        {
            tbDataService = _tbDataService;
            userDataService = new UserDataService();
        }

        public void ValidateTissueBank_Add(string TissueBankName, string ContactPersonName, string ContactPersonNumber, string TissueBankEmailId, string BusinessURL, string TissueBankAddress, int CityId, string ZipCode, string TissueBankStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate, string CustomerProfileId, string CustomerPaymentProfileIds, int UserId, int TissueBankId, int TransactionId, string AuthTransactionId, string AuthCode, int StatusId, DateTime TransactionCompleteDate, string ResponseBody)
        {
            ValidateUniqueTissueBankEmailId(TissueBankEmailId);
            ValidateUniqueContactPersonNumber(ContactPersonNumber);
            ValidateUniqueAATBLicenseNumber(AATBLicenseNumber);
            ValidateUniqueTissueBankStateLicense(TissueBankStateLicense);
        }

        private void ValidateUniqueUserName(string UserName)
        {
            Boolean valid = userDataService.ValidateUniqueUserName(UserName);
            if (valid == false)
            {
                AddValidationError("UserName", "User Name : " + UserName + " already exists.");
            }
        }

        private void ValidateUniqueTissueBankEmailId(string TissueBankEmailId)
        {
            Boolean valid = tbDataService.ValidateUniqueTissueBankEmailId(TissueBankEmailId);
            if (valid == false)
            {
                AddValidationError("tissueBankEmailId", "Tissue Bank EmailId : " + TissueBankEmailId + " already exists.");
            }
        }

        private void ValidateUniqueTissueBankStateLicense(string TissueBankStateLicense)
        {
            Boolean valid = tbDataService.ValidateUniqueTissueBankStateLicense(TissueBankStateLicense);
            if (valid == false)
            {
                AddValidationError("TissueBankStateLicense", "Tissue Bank StateLicense : " + TissueBankStateLicense + " already exists.");
            }
        }

        private void ValidateUniqueAATBLicenseNumber(string AATBLicenseNumber)
        {
            Boolean valid = tbDataService.ValidateUniqueAATBLicenseNumber(AATBLicenseNumber);
            if (valid == false)
            {
                AddValidationError("AATBLicenseNumber", "AATB License Number : " + AATBLicenseNumber + " already exists.");
            }
        }

        private void ValidateUniqueContactPersonNumber(string ContactPersonNumber)
        {
            Boolean valid = tbDataService.ValidateUniqueContactPersonNumber(ContactPersonNumber);
            if (valid == false)
            {
                AddValidationError("ContactPersonNumber", "Contact Person Number : " + ContactPersonNumber + " already exists.");
            }
        }

        private void ValidateUniqueEmailId(string EmailId)
        {
            Boolean valid = userDataService.ValidateUniqueEmailId(EmailId);
            if (valid == false)
            {
                AddValidationError("EmailId", "Email Id : " + EmailId + " already exists.");
            }
        }

        public void ValidateTissueBankUserRegistration(string FullName, string UserName, string EmailId, string SecurityQuestion, string SecurityAnswer)
        {
            userDataService.CreateSession();
            ValidateUniqueEmailId(EmailId);
            ValidateUniqueUserName(UserName);
        }
    }
}