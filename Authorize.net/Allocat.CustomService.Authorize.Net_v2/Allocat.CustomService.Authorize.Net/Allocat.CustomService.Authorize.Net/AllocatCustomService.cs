using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

#region Added Namespaces
using AuthorizeNet.Api.Contracts.V1;
using Allocat.CustomService.Authorize.Net.BusinessEntities;
using Allocat.CustomService.Authorize.Net.BusinessEntities.ResponseEntities;
#endregion

namespace Allocat.CustomService.Authorize.Net
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface AllocatCustomService
    {
             
        #region CustomerProfile and Charge Customer profile
        [OperationContract]
        ResCreateCustomerProfile RegisterCustomerAndChargeProfile(Customer objCustomer, decimal AmountToBeCharged);

        //string CreateCustomerProfile(string ApiLoginID, string ApiTransactionKey, Customer objCustomer);
        
        [OperationContract]
        string CreateCustomerPaymentProfile(string ApiLoginID, string ApiTransactionKey, Customer objCustomer);

        //[OperationContract]
        //string ChargeCustomerProfile(string ApiLoginID, string ApiTransactionKey, string customerProfileId, string customerPaymentProfileId, decimal Amount);

        #endregion

        #region Update Customer Profile

        [OperationContract]
        void GetCustomerProfile(string ApiLoginID, string ApiTransactionKey, string customerProfileId);

        [OperationContract]
        void UpdateCustomerProfile(string ApiLoginID, string ApiTransactionKey, string customerProfileId, string merchantCustomerId, string description, string newEmailId);

        #endregion

        #region ChargeCreditCard
        [OperationContract]
        ResTransaction ChargeCreditCard(Customer objCustomer, decimal AmountToBeCharged);

        #endregion
    }

    
    // You can add XSD files into the project. After building the project, you can directly use the data types defined there, with the namespace "Allocat.CustomService.Authorize.Net.ContractType".
    
}
