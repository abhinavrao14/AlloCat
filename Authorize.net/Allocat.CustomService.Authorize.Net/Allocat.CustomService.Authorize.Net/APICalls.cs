using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

using Allocat.CustomService.Authorize.Net.BusinessEntities;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;
using System.Configuration;
using System.Diagnostics;
using Allocat.CustomService.Authorize.Net.BusinessEntities.ResponseEntities;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Logging;

namespace Allocat.CustomService.Authorize.Net
{
    
    public class APICalls : AllocatCustomService
    {
       ConfigurationReader objConfigurationReader = null;
        private LogEntry logEntry = null;
        bool isLogFailed = default(bool);

        public APICalls()
        {
            try
            {
                isLogFailed = false;
                logEntry = new LogEntry { Message = "Authorize.Net Service is starting up", Severity = TraceEventType.Information };
                WriteLog(logEntry);
                objConfigurationReader = new ConfigurationReader();
                logEntry = new LogEntry { Message = "Configurations Reading start...", Severity = TraceEventType.Information };
                WriteLog(logEntry);
                // ConfigurationReader objConfigurationReader = new ConfigurationReader();
                logEntry = new LogEntry { Message = "Configurations Read Successfully", Severity = TraceEventType.Information };
                WriteLog(logEntry);

            }
            catch (Exception loggingEx)
            {
                //================================================================================================
                logEntry = new LogEntry { Message = "***************** Exception *****************", Severity = TraceEventType.Error };
                WriteLog(logEntry);
                logEntry = new LogEntry { Message = "Exception in Configuration Read : " + loggingEx.Message, Severity = TraceEventType.Critical };
                WriteLog(logEntry);
                logEntry = new LogEntry { Message = "Inner Exception : " + loggingEx.InnerException, Severity = TraceEventType.Error };
                WriteLog(logEntry);
                logEntry = new LogEntry { Message = "Stack Trace : " + loggingEx.StackTrace, Severity = TraceEventType.Error };
                WriteLog(logEntry);
                //================================================================================================
            }
        }
        
        #region API Methods

        public ResCreateCustomerProfile RegisterCustomerAndChargeProfile(Customer objCustomer, decimal AmountToBeCharged)
        {
            
            ResCreateCustomerProfile objResCreateCustomerProfile = null;
            if (AmountToBeCharged == null)
            {
                AmountToBeCharged = objConfigurationReader.RegistrationAmount;
            }
            try
            {               
                ResTransaction objTransactionResponse = null;
                if (objCustomer != null)
                {
                   objResCreateCustomerProfile = CreateCustomerProfile(objCustomer);
                    if(objResCreateCustomerProfile.CustomerProfileId != null && objResCreateCustomerProfile.CustomerPaymentProfileIds != null)
                    {
                       objTransactionResponse = ChargeCustomerProfile(objResCreateCustomerProfile.CustomerProfileId,
                                                                      objResCreateCustomerProfile.CustomerPaymentProfileIds[0],
                                                                       AmountToBeCharged);
                        objResCreateCustomerProfile.Transaction = objTransactionResponse;
                    }
                }
            }
            catch(Exception )
            {

            }
            return objResCreateCustomerProfile;
        }

        /// <summary>
        /// This method creates customer profile and returns Customer Id
        /// </summary>        
        /// <param name="objCustomer"></param>
        /// <returns>CustomerId</returns>
        public ResCreateCustomerProfile CreateCustomerProfile(Customer objCustomer)
        {          
            createCustomerProfileResponse responseForCreateProfile = null;
            ResCreateCustomerProfile objResCreateCustomerProfile = null;
            try
            {
              logEntry = new LogEntry { Message = "Call CreateCustomerProfile Method....", Severity = TraceEventType.Information };
              WriteLog(logEntry); 
              // Environment Settings 
              if (objConfigurationReader.Environment.ToUpper() == "SANDBOX")
              {
                  ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;
                  logEntry = new LogEntry
                  {
                      Message = "Environment is : " + ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment.ToString(),
                      Severity = TraceEventType.Information
                  };
                  WriteLog(logEntry);
              }
              else if(objConfigurationReader.Environment.ToUpper() == "PRODUCTION")
              {
                  ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
                  logEntry = new LogEntry 
                  {     Message = "Environment is : " + ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment.ToString(), 
                        Severity = TraceEventType.Information 
                  };
                  WriteLog(logEntry); 
              }   
                
              ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
               {
                    name = objConfigurationReader.ApiLoginID,
                    ItemElementName = ItemChoiceType.transactionKey,
                    Item = objConfigurationReader.ApiTransactionKey
               };

              var creditCard = new creditCardType
                {
                     cardNumber = objCustomer.CardInfo.CreditCardNumber,
                     expirationDate = objCustomer.CardInfo.ExpiryDate
                };

              var billTo = new customerAddressType
              {
                  firstName = objCustomer.FirstName,
                  lastName = objCustomer.LastName
              };

              paymentType cc = new paymentType { Item = creditCard };              

              List<customerPaymentProfileType> paymentProfileList = new List<customerPaymentProfileType>();
              customerPaymentProfileType ccPaymentProfile = new customerPaymentProfileType();
              ccPaymentProfile.payment = cc;
              ccPaymentProfile.billTo = billTo;

              paymentProfileList.Add(ccPaymentProfile);
              
              List<customerAddressType> addressInfoList = new List<customerAddressType>();
              customerAddressType homeAddress = new customerAddressType();
              homeAddress.address = objCustomer.HomeAddress.Address;
              homeAddress.city = objCustomer.HomeAddress.City;
              homeAddress.zip = objCustomer.HomeAddress.ZipCode;

              customerAddressType officeAddress = new customerAddressType();
              officeAddress.address = objCustomer.OfficeAddress.Address;
              officeAddress.city = objCustomer.OfficeAddress.City;
              officeAddress.zip = objCustomer.OfficeAddress.ZipCode;

              addressInfoList.Add(homeAddress);
              addressInfoList.Add(officeAddress);

              customerProfileType customerProfile = new customerProfileType();
              customerProfile.merchantCustomerId = objCustomer.CustomerId;
              customerProfile.email = objCustomer.EmailId;
              customerProfile.paymentProfiles = paymentProfileList.ToArray();
              customerProfile.shipToList = addressInfoList.ToArray();

              var requestForCreateProfile = new createCustomerProfileRequest { profile = customerProfile, validationMode = validationModeEnum.none };

              // instantiate the contoller that will call the service
              var controller = new createCustomerProfileController(requestForCreateProfile);         
              controller.Execute();

              responseForCreateProfile = controller.GetApiResponse();   // get the response from the service (errors contained if any)
              objResCreateCustomerProfile = new ResCreateCustomerProfile();
                //validate
                if (responseForCreateProfile != null && responseForCreateProfile.messages.resultCode == messageTypeEnum.Ok)
                {
                    if (responseForCreateProfile != null && responseForCreateProfile.messages.message != null)
                    {
                        
                        objResCreateCustomerProfile.CustomerProfileId = responseForCreateProfile.customerProfileId;
                        objResCreateCustomerProfile.CustomerPaymentProfileIds = responseForCreateProfile.customerPaymentProfileIdList;
                        objResCreateCustomerProfile.CustomerShippingProfileIds = responseForCreateProfile.customerShippingAddressIdList;
                        objResCreateCustomerProfile.Message = responseForCreateProfile.messages.message.ToString();
                        objResCreateCustomerProfile.MessageCode = responseForCreateProfile.messages.resultCode.ToString();
                        objResCreateCustomerProfile.RefId = responseForCreateProfile.refId;
                        objResCreateCustomerProfile.SessionToken = responseForCreateProfile.sessionToken;

                        logEntry = new LogEntry
                        {
                            Message = "Customer Profile has been created successfully ", 
                            Severity = TraceEventType.Information
                        };
                        WriteLog(logEntry);
                        
                        logEntry = new LogEntry
                        {
                            Message = "CustomerProfileID : " + responseForCreateProfile.customerProfileId,
                            Severity = TraceEventType.Information
                        };
                        WriteLog(logEntry);

                        logEntry = new LogEntry
                        {
                            Message = "CustomerPaymentProfileID : " + responseForCreateProfile.customerPaymentProfileIdList[0],
                            Severity = TraceEventType.Information
                        };
                        WriteLog(logEntry);

                        logEntry = new LogEntry
                        {
                            Message = "CustomerShippingProfileID : " + responseForCreateProfile.customerShippingAddressIdList[0],
                            Severity = TraceEventType.Information
                        };
                        WriteLog(logEntry);                       
                    }
                }
                else if (responseForCreateProfile != null && responseForCreateProfile.messages.resultCode != messageTypeEnum.Error)
                {
                    objResCreateCustomerProfile.MessageCode = responseForCreateProfile.messages.message[0].code;
                    objResCreateCustomerProfile.Message = responseForCreateProfile.messages.message[0].text;
                    logEntry = new LogEntry
                    {
                        Message = "************** Error ************** ",
                        Severity = TraceEventType.Error
                    };
                    WriteLog(logEntry);
                    
                    logEntry = new LogEntry
                    {
                        Message = "Error Code : " + responseForCreateProfile.messages.message[0].code,
                        Severity = TraceEventType.Error
                    };
                    WriteLog(logEntry);
                    
                    logEntry = new LogEntry
                    {
                        Message = "Text : " + responseForCreateProfile.messages.message[0].text,
                        Severity = TraceEventType.Error
                    };
                    WriteLog(logEntry);                      
                }
            }

            catch (Exception loggingEx)
            {
               objResCreateCustomerProfile = null;
                //================================================================================================
                logEntry = new LogEntry { Message = "***************** Exception *****************", Severity = TraceEventType.Error };
                WriteLog(logEntry);
                logEntry = new LogEntry { Message = "Exception Message : " + loggingEx.Message, Severity = TraceEventType.Critical };
                WriteLog(logEntry);
                logEntry = new LogEntry { Message = "Inner Exception : " + loggingEx.InnerException, Severity = TraceEventType.Error };
                WriteLog(logEntry);
                logEntry = new LogEntry { Message = "Stack Trace : " + loggingEx.StackTrace, Severity = TraceEventType.Error };
                WriteLog(logEntry);
                //================================================================================================              

            }
           // return responseForCreateProfile.customerProfileId;
            return objResCreateCustomerProfile;
        }

        public string CreateCustomerPaymentProfile(string ApiLoginID, string ApiTransactionKey, Customer objCustomer)
        {
            createCustomerPaymentProfileResponse response = null;
            try 
            {
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
                {
                    name = ApiLoginID,
                    ItemElementName = ItemChoiceType.transactionKey,
                    Item = ApiTransactionKey,
                };

                var creditCard = new creditCardType
                {
                    cardNumber = objCustomer.CardInfo.CreditCardNumber,
                    expirationDate = objCustomer.CardInfo.ExpiryDate
                };

                paymentType cc = new paymentType { Item = creditCard };

                var billTo = new customerAddressType
                {
                    firstName = objCustomer.FirstName,
                    lastName = objCustomer.LastName
                };

                customerPaymentProfileType creditCardPaymentProfile = new customerPaymentProfileType();
                creditCardPaymentProfile.payment = cc;
                creditCardPaymentProfile.billTo = billTo;

                var request = new createCustomerPaymentProfileRequest
                {
                    customerProfileId = objCustomer.CustomerId,
                    paymentProfile = creditCardPaymentProfile,
                    validationMode = validationModeEnum.none
                };

                //Prepare Request
                var controller = new createCustomerPaymentProfileController(request);
                controller.Execute();

                //Send Request to EndPoint
                response = controller.GetApiResponse();
                if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
                {
                    if (response != null && response.messages.message != null)
                    {
                        Console.WriteLine("Success, createCustomerPaymentProfileID : " + response.customerPaymentProfileId);
                    }
                }
                else
                {
                    Console.WriteLine("Error: " + response.messages.message[0].code + "  " + response.messages.message[0].text);
                    if (response.messages.message[0].code == "E00039")
                    {
                        Console.WriteLine("Duplicate ID: " + response.customerPaymentProfileId);
                    }
                }
   
            }
            catch(Exception ex)
            {

            }
            return (!string.IsNullOrEmpty(response.customerPaymentProfileId)) ? response.customerPaymentProfileId : "-1";
        }

        public ResTransaction ChargeCustomerProfile(string CusomerProfileId, string CustomerPaymentProfileId, decimal Amount)           
        {
            createTransactionResponse response = null;
            ResTransaction objResTransaction = null;
            try
            {
                // Environment Settings 
                if (objConfigurationReader.Environment.ToUpper() == "SANDBOX")
                {
                    ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;
                    logEntry = new LogEntry
                    {
                        Message = "Environment is : " + ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment.ToString(),
                        Severity = TraceEventType.Information
                    };
                    WriteLog(logEntry);
                }
                else if (objConfigurationReader.Environment.ToUpper() == "PRODUCTION")
                {
                    ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
                    logEntry = new LogEntry
                    {
                        Message = "Environment is : " + ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment.ToString(),
                        Severity = TraceEventType.Information
                    };
                    WriteLog(logEntry);
                }   
                // Define the merchant information (authentication / transaction id)
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
                {
                    name = objConfigurationReader.ApiLoginID,
                    ItemElementName = ItemChoiceType.transactionKey,
                    Item = objConfigurationReader.ApiTransactionKey
                };

                //create a customer payment profile 
                
                customerProfilePaymentType profileToCharge = new customerProfilePaymentType();
                profileToCharge.customerProfileId = CusomerProfileId;
                profileToCharge.paymentProfile = new paymentProfile { paymentProfileId = CustomerPaymentProfileId };

                var transactionRequest = new transactionRequestType
                {
                    transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),
                    amount = Amount,
                    profile = profileToCharge
                };

                var request = new createTransactionRequest { transactionRequest = transactionRequest };

                // instantiate the collector that will call the service
                var controller = new createTransactionController(request);
                controller.Execute();

                // get the response from the service (errors contained if any)
                response = controller.GetApiResponse();

                //validate
                if (response != null)
                {
                    objResTransaction = new ResTransaction();

                    if (response.messages.resultCode == messageTypeEnum.Ok)
                    {
                        logEntry = new LogEntry
                         {
                              Message = "************** Transaction Response ************** ",
                              Severity = TraceEventType.Information
                         };
                        WriteLog(logEntry);

                        if (response.transactionResponse.messages != null)
                        {
                            objResTransaction.TransactionId = response.transactionResponse.transId;
                            objResTransaction.ResponseCode = response.transactionResponse.responseCode;
                            objResTransaction.MessageCode = response.transactionResponse.messages[0].code;
                            objResTransaction.MessageDescription = response.transactionResponse.messages[0].description;
                            objResTransaction.AuthCode = response.transactionResponse.authCode;

                            logEntry = new LogEntry
                            {
                                Message = "Transaction has been created successfully ",
                                Severity = TraceEventType.Information
                            };
                            WriteLog(logEntry);
                    
                            logEntry = new LogEntry
                            {
                                Message = "Transaction ID : " + response.transactionResponse.transId,
                                Severity = TraceEventType.Information
                            };
                            WriteLog(logEntry);

                            logEntry = new LogEntry
                            {
                                Message = "Response Code : " + response.transactionResponse.responseCode,
                                Severity = TraceEventType.Information
                            };
                            WriteLog(logEntry);

                            logEntry = new LogEntry
                            {
                                Message = "Message Code : " + response.transactionResponse.messages[0].code,
                                Severity = TraceEventType.Information
                            };
                            WriteLog(logEntry);

                            logEntry = new LogEntry
                            {
                                Message = "Description : " + response.transactionResponse.messages[0].description,
                                Severity = TraceEventType.Information
                            };
                            WriteLog(logEntry);

                            logEntry = new LogEntry
                            {
                                Message = "Success, Auth Code : " + response.transactionResponse.authCode,
                                Severity = TraceEventType.Information
                            };
                            WriteLog(logEntry);        
                           
                        }
                        else
                        {
                            logEntry = new LogEntry
                            {
                                Message = "Failed Transaction " ,
                                Severity = TraceEventType.Error
                            };
                            WriteLog(logEntry);   

                            if (response.transactionResponse.errors != null)
                            {
                                objResTransaction.TransactionId = string.Empty;
                                objResTransaction.ErrorCode = response.transactionResponse.errors[0].errorCode;
                                objResTransaction.ErrorText = response.transactionResponse.errors[0].errorText;

                                logEntry = new LogEntry
                                {
                                    Message = "Error Code : " + response.transactionResponse.errors[0].errorCode,
                                    Severity = TraceEventType.Error
                                };
                                WriteLog(logEntry);

                                logEntry = new LogEntry
                                {
                                    Message = "Error Message : " + response.transactionResponse.errors[0].errorText,
                                    Severity = TraceEventType.Error
                                };
                                WriteLog(logEntry);                                 
                            }
                        }
                    }
                   else
                    {
                        objResTransaction.TransactionId = string.Empty;

                        logEntry = new LogEntry
                        {
                            Message = "Failed Transaction ",
                            Severity = TraceEventType.Error
                        };
                        WriteLog(logEntry);

                        if (response.transactionResponse != null && response.transactionResponse.errors != null)
                        {
                            objResTransaction.ErrorCode = response.transactionResponse.errors[0].errorCode;
                            objResTransaction.ErrorText = response.transactionResponse.errors[0].errorText;

                            logEntry = new LogEntry
                            {
                                Message = "Error Code : " + response.transactionResponse.errors[0].errorCode,
                                Severity = TraceEventType.Error
                            };
                            WriteLog(logEntry);

                            logEntry = new LogEntry
                            {
                                Message = "Error Message : " + response.transactionResponse.errors[0].errorText,
                                Severity = TraceEventType.Error
                            };
                            WriteLog(logEntry); 
                        }
                        else
                        {
                            objResTransaction.ErrorCode = response.messages.message[0].code;
                            objResTransaction.ErrorText = response.messages.message[0].text;

                            logEntry = new LogEntry
                            {
                                Message = "Error Code : " + response.messages.message[0].code,
                                Severity = TraceEventType.Error
                            };
                            WriteLog(logEntry);

                            logEntry = new LogEntry
                            {
                                Message = "Error Message : " + response.messages.message[0].text,
                                Severity = TraceEventType.Error
                            };
                            WriteLog(logEntry);                           
                        }
                    }
                }
                else
                {
                    objResTransaction = null;
                    logEntry = new LogEntry
                    {
                        Message = "NULL Response " ,
                        Severity = TraceEventType.Error
                    };
                    WriteLog(logEntry);       
                }                
            }
            catch (Exception loggingEx)
            {
                objResTransaction = null;
                //================================================================================================
                logEntry = new LogEntry { Message = "***************** Exception *****************", Severity = TraceEventType.Error };
                WriteLog(logEntry);
                logEntry = new LogEntry { Message = "Exception Message : " + loggingEx.Message, Severity = TraceEventType.Critical };
                WriteLog(logEntry);
                logEntry = new LogEntry { Message = "Inner Exception : " + loggingEx.InnerException, Severity = TraceEventType.Error };
                WriteLog(logEntry);
                logEntry = new LogEntry { Message = "Stack Trace : " + loggingEx.StackTrace, Severity = TraceEventType.Error };
                WriteLog(logEntry);
                //================================================================================================         
            }
            return objResTransaction; 
        }

        public void GetCustomerProfile(string ApiLoginID, string ApiTransactionKey, string customerProfileId)
        {
            
            try
            {
              
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;
                // define the merchant information (authentication / transaction id)
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
                {
                    name = ApiLoginID,
                    ItemElementName = ItemChoiceType.transactionKey,
                    Item = ApiTransactionKey,
                };

                var request = new getCustomerProfileRequest();
                request.customerProfileId = customerProfileId;

                // instantiate the controller that will call the service
                var controller = new getCustomerProfileController(request);
                controller.Execute();

                // get the response from the service (errors contained if any)
                var response = controller.GetApiResponse();

                if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
                {
                    Console.WriteLine(response.messages.message[0].text);
                    Console.WriteLine("Customer Profile Id: " + response.profile.customerProfileId);

                    if (response.subscriptionIds != null && response.subscriptionIds.Length > 0)
                    {
                        Console.WriteLine("List of subscriptions : ");
                        for (int i = 0; i < response.subscriptionIds.Length; i++)
                            Console.WriteLine(response.subscriptionIds[i]);
                    }

                }
                else if (response != null)
                {
                    Console.WriteLine("Error: " + response.messages.message[0].code + "  " +
                                      response.messages.message[0].text);
                }
            }
            catch(Exception ex)
            {

            }
        }

        public void UpdateCustomerProfile(string ApiLoginID, string ApiTransactionKey, string customerProfileId, 
                                          string merchantCustomerId, string description, string newEmailId)
        {
            try
            {
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;
                // define the merchant information (authentication / transaction id)
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
                {
                    name = ApiLoginID,
                    ItemElementName = ItemChoiceType.transactionKey,
                    Item = ApiTransactionKey,
                };

                var profile = new customerProfileExType
                {
                    merchantCustomerId = merchantCustomerId,
                    description = description,
                    email = newEmailId,
                    customerProfileId = customerProfileId
                };

                var request = new updateCustomerProfileRequest();
                request.profile = profile;

                // instantiate the controller that will call the service
                var controller = new updateCustomerProfileController(request);
                controller.Execute();

                // get the response from the service (errors contained if any)
                var response = controller.GetApiResponse();

                if (response != null && response.messages.resultCode == messageTypeEnum.Ok)
                {
                    Console.WriteLine(response.messages.message[0].text);
                }
                else if (response != null)
                {
                    Console.WriteLine("Error: " + response.messages.message[0].code + "  " +
                                      response.messages.message[0].text);
                }
            }
            catch(Exception ex)
            {

            }
        }

        #endregion

        /// <summary>
        /// Writing log entry into log file and send email in case of log failure
        /// </summary>
        /// <param name="logObject"></param>
        private void WriteLog(LogEntry logObject)
        {
            try
            {
                if (!isLogFailed)
                {
                    Logger.Write(logObject);
                }
            }
            catch (Exception logEx)
            {
                isLogFailed = true;
                logEntry = new LogEntry { Message = logEx.Message + Environment.NewLine + logEx.StackTrace, Severity = TraceEventType.Start };
                WriteLog(logEntry);
            }
        }
    }
}
