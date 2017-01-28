using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace Allocat.CustomService.Authorize.Net
{
    public class ConfigurationReader
    {
        // Api related configuration Keys
        public readonly string ApiLoginID;
        public readonly string ApiTransactionKey;
        public readonly string Environment;

        // Registration fee
        public readonly decimal RegistrationAmount;
        
        // Service Fee related keys
        public readonly string ServiceFeeItemId;
        public readonly string ServiceFeeItemName;
        public readonly int ServiceFeeQuantity;
        public readonly decimal ServiceFeeUnitPrice;

        public ConfigurationReader()
        {
            try
            {
                ApiLoginID = ConfigurationManager.AppSettings["ApiLoginID"];
                ApiTransactionKey = ConfigurationManager.AppSettings["ApiTransactionKey"];
                Environment = ConfigurationManager.AppSettings["Environment"];
                RegistrationAmount = Convert.ToDecimal(ConfigurationManager.AppSettings["RegistrationAmount"]);

                ServiceFeeItemId = ConfigurationManager.AppSettings["ServiceFeeItemId"];
                ServiceFeeItemName = ConfigurationManager.AppSettings["ServiceFeeItemName"];
                ServiceFeeQuantity = Convert.ToInt32(ConfigurationManager.AppSettings["ServiceFeeQuantity"]);
                ServiceFeeUnitPrice = Convert.ToDecimal(ConfigurationManager.AppSettings["ServiceFeeUnitPrice"]);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
