using Allocat.DataModel;
using Allocat.DataServiceInterface;
using System;
using System.Collections.Generic;

namespace Allocat.ApplicationService
{
    public class TissueBankBusinessService
    {
        private ITissueBankDataService tbDataService;

        public TissueBankBusinessService(ITissueBankDataService _tbDataService)
        {
            tbDataService = _tbDataService;
        }

        public void AddTissueBank(int TissueBankId, string TissueBankName, string ContactPersonName, string ContactPersonNumber, string TissueBankEmailId, string BusinessURL, string TissueBankAddress, int CityId, string TissueBankStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate,string UserName, out TransactionalInformation transaction)
        {
            transaction = new TransactionalInformation();
            TissueBankBusinessRule tbBusinessRule = new TissueBankBusinessRule(tbDataService);

            try
            {
                tbDataService.CreateSession();

                tbBusinessRule.ValidateAdd(TissueBankId, TissueBankName, ContactPersonName, ContactPersonNumber, TissueBankEmailId, BusinessURL, TissueBankAddress, CityId, TissueBankStateLicense, AATBLicenseNumber, AATBExpirationDate, AATBAccredationDate, UserName);

                if (tbBusinessRule.ValidationStatus == true)
                {
                    //send this password on mail
                    string Password = Utility.Utilities.RandomAlphaNumeric(6);

                    tbDataService.AddTissueBank(TissueBankName, ContactPersonName, ContactPersonNumber, TissueBankEmailId, BusinessURL, TissueBankAddress, CityId, TissueBankStateLicense, AATBLicenseNumber, AATBExpirationDate, AATBAccredationDate, UserName,Password, out transaction);
                }
                else
                {
                    transaction.ReturnStatus = tbBusinessRule.ValidationStatus;
                    transaction.ReturnMessage = tbBusinessRule.ValidationMessage;
                    transaction.ValidationErrors = tbBusinessRule.ValidationErrors;
                }

            }
            catch (Exception ex)
            {
                transaction.ReturnMessage = new List<string>();
                string errorMessage = ex.Message;
                transaction.ReturnStatus = false;
                transaction.ReturnMessage.Add(errorMessage);
            }
            finally
            {
                tbDataService.CloseSession();
            }
        }
    }
}
