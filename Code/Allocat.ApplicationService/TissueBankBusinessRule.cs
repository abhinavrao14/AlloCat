using System;
using Allocat.DataModel;
using Allocat.DataServiceInterface;

namespace Allocat.ApplicationService
{
    public class TissueBankBusinessRule : ValidationRules
    {
        ITissueBankDataService tbDataService;

        public TissueBankBusinessRule(ITissueBankDataService _tbDataService)
        {
            tbDataService = _tbDataService;
        }

        public void ValidateAdd(int TissueBankId, string TissueBankName, string ContactPersonName, string ContactPersonNumber, string TissueBankEmailId, string BusinessURL, string TissueBankAddress, int CityId, string TissueBankStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate, string UserName, string ZipCode, string CreditCardNumber, int CreditCardType, string ExpiryDate, string City)
        {
            ValidateUniqueTissueBankEmailId(TissueBankEmailId);
            ValidateUniqueContactPersonNumber(ContactPersonNumber);
            ValidateUniqueAATBLicenseNumber(AATBLicenseNumber);
            ValidateUniqueTissueBankStateLicense(TissueBankStateLicense);
            ValidateUniqueUserName(UserName);
        }

        private void ValidateUniqueUserName(string UserName)
        {
            Boolean valid = tbDataService.ValidateUniqueUserName(UserName);
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
            Boolean valid = tbDataService.ValidateUniqueEmailId(EmailId);
            if (valid == false)
            {
                AddValidationError("EmailId", "Email Id : " + EmailId + " already exists.");
            }
        }

        public void ValidateTissueBankUserRegistration(string FullName, string UserName, string EmailId, string SecurityQuestion, string SecurityAnswer)
        {
            ValidateUniqueEmailId(EmailId);
            ValidateUniqueUserName(UserName);
        }
    }
}