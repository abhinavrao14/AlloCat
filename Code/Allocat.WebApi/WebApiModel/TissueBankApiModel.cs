using Allocat.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Allocat.WebApi.WebApiModel
{
    public class TissueBankApiModel : TransactionalInformation
    {
    }

    public class TissueBankRegisteration_DTO
    {
        public string TissueBankName { get; set; }
        public string ContactPersonName { get; set; }
        public string ContactPersonNumber { get; set; }
        public string TissueBankEmailId { get; set; }
        public string BusinessURL { get; set; }
        public string TissueBankAddress { get; set; }
        public int CityId { get; set; }
        public string TissueBankStateLicense { get; set; }
        public string AATBLicenseNumber { get; set; }
        public DateTime AATBExpirationDate { get; set; }
        public DateTime AATBAccredationDate { get; set; }

        public string City { get; set; }
        public string ZipCode { get; set; }
        public int TransactionId { get; set; }
        public string AuthTransactionId { get; set; }
        public string AuthCode { get; set; }
        public int StatusId { get; set; }
        public DateTime TransactionCompleteDate { get; set; }
        public string ResponseBody { get; set; }
        public string CreditCardNumber { get; set; }
        public int CreditCardType { get; set; }
        public string ExpiryDate { get; set; }
    }

    public class TissueBankSignUp_DTO
    {
        public string FullName { get; set; }
        public string UserName { get; set; }
        public string EmailId { get; set; }
        public string SecurityQuestion { get; set; }
        public string SecurityAnswer { get; set; }
    }
}