﻿using Allocat.DataModel;
using System;
using System.Collections.Generic;
using System.Data;

namespace Allocat.DataServiceInterface
{
    public interface ITissueBankDataService : IDataService, IDisposable
    {
        int AddTissueBank(string TissueBankName, string ContactPersonName, string ContactPersonNumber, string TissueBankEmailId, string BusinessURL, string TissueBankAddress, int CityId, string TissueBankStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate,string UserName, string Password,out TransactionalInformation transaction);
        bool ValidateUniqueTissueBankEmailId(string TissueBankEmailId);
        bool ValidateUniqueContactPersonNumber(string ContactPersonNumber);
        bool ValidateUniqueAATBLicenseNumber(string AATBLicenseNumber);
        bool ValidateUniqueTissueBankStateLicense(string TissueBankStateLicense);
        bool ValidateUniqueUserName(string UserName);
    }
}
