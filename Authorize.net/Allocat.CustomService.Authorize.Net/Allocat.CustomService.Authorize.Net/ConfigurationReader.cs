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
        // Email configuration Keys
        public readonly string ApiLoginID;
        public readonly string ApiTransactionKey;
        public readonly string Environment;
        public readonly decimal RegistrationAmount;
        public ConfigurationReader()
        {
            try
            {
                ApiLoginID = ConfigurationManager.AppSettings["ApiLoginID"];
                ApiTransactionKey = ConfigurationManager.AppSettings["ApiTransactionKey"];
                Environment = ConfigurationManager.AppSettings["Environment"];
                RegistrationAmount = Convert.ToDecimal(ConfigurationManager.AppSettings["RegistrationAmount"]);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
