using Allocat.DataModel;
using System;
using System.Collections.Generic;
using System.Data;

namespace Allocat.DataServiceInterface
{
    public interface IHospitalDataService : IDataService, IDisposable
    {
        int AddHospital(string HospitalName, string ContactPersonName, string ContactPersonNumber, string HospitalEmailId, string BusinessURL, string HospitalAddress, int CityId, string HospitalStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate,string UserName, string Password,out TransactionalInformation transaction);
        bool ValidateUniqueHospitalEmailId(string HospitalEmailId);
        bool ValidateUniqueContactPersonNumber(string ContactPersonNumber);
        bool ValidateUniqueAATBLicenseNumber(string AATBLicenseNumber);
        bool ValidateUniqueHospitalStateLicense(string HospitalStateLicense);
        bool ValidateUniqueUserName(string UserName);
    }
}
