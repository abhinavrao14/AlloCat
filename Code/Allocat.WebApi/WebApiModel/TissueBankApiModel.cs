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

    public class TissueBank_DTO
    {
        public int TissueBankId { get; set; }
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
        public string UserName { get; set; }
    }
}