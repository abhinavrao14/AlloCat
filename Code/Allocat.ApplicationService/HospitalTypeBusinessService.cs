using Allocat.DataModel;
using Allocat.DataServiceInterface;
using System;
using System.Collections.Generic;

namespace Allocat.ApplicationService
{
    public class HospitalTypeBusinessService
    {
        private IHospitalTypeDataService hospitalTypeDataService;

        public HospitalTypeBusinessService(IHospitalTypeDataService _hospitalTypeDataService)
        {
            hospitalTypeDataService = _hospitalTypeDataService;
        }

        public IEnumerable<HospitalType> GetHospitalType(out TransactionalInformation transaction)
        {
            transaction = new TransactionalInformation();
<<<<<<< HEAD
=======
            hospitalTypeDataService.CreateSession();
>>>>>>> 2b00939ddbec22f2dcf9ae366ed9f1ce95d9139f
            IEnumerable<HospitalType> lstHospitalType = null;
            HospitalTypeBusinessRule hospitalTypeBusinessRule = new HospitalTypeBusinessRule();
            try
            {
                hospitalTypeDataService.CreateSession();

                lstHospitalType = hospitalTypeDataService.GetHospitalType(out transaction);

                transaction.ReturnStatus = hospitalTypeBusinessRule.ValidationStatus;
                transaction.ReturnMessage = hospitalTypeBusinessRule.ValidationMessage;
                transaction.ValidationErrors = hospitalTypeBusinessRule.ValidationErrors;
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
                hospitalTypeDataService.CloseSession();
            }

            return lstHospitalType;
        }
    }
}
