using Allocat.DataModel;
using Allocat.DataServiceInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Allocat.DataService
{
    public class TissueBankDataService : EntityFrameworkDataService, ITissueBankDataService
    {
        public int TissueBank_User_Registration(string FullName, string UserName, string EmailId, string SecurityQuestion, string SecurityAnswer, string Password, out TransactionalInformation transaction)
        {
            transaction = new TransactionalInformation();
            int rowAffected = 0;

            var parameterFullName = new SqlParameter("@FullName", SqlDbType.VarChar);
            parameterFullName.Value = FullName;

            var parameterUserName = new SqlParameter("@UserName", SqlDbType.NVarChar);
            parameterUserName.Value = UserName;

            var parameterEmailId = new SqlParameter("@EmailId", SqlDbType.NVarChar);
            parameterEmailId.Value = EmailId;

            var parameterSecurityQuestion = new SqlParameter("@SecurityQuestion", SqlDbType.VarChar);
            parameterSecurityQuestion.Value = SecurityQuestion;

            var parameterSecurityAnswer = new SqlParameter("@SecurityAnswer", SqlDbType.VarChar);
            parameterSecurityAnswer.Value = SecurityAnswer;

            var parameterPassword = new SqlParameter("@Password", SqlDbType.VarChar);
            parameterPassword.Value = Password;

            rowAffected = dbConnection.Database.ExecuteSqlCommand("exec dbo.usp_TissueBank_User_Registration @FullName, @UserName, @EmailId, @SecurityQuestion, @SecurityAnswer, @Password", parameterFullName, parameterUserName, parameterEmailId, parameterSecurityQuestion, parameterSecurityAnswer, parameterPassword);

            if (rowAffected > 0)
            {
                transaction.ReturnStatus = true;
                transaction.ReturnMessage.Add("Operation Successfull.");
            }
            else
            {
                transaction.ReturnStatus = false;
                transaction.ReturnMessage.Add("Database Error");
            }

            return rowAffected;

        }

        public void TissueBank_Add(string TissueBankName, string ContactPersonName, string ContactPersonNumber, string TissueBankEmailId, string BusinessURL, string TissueBankAddress, int CityId, string ZipCode, string TissueBankStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate, string CustomerProfileId, string CustomerPaymentProfileIds, int UserId, int TissueBankId, int TransactionId, string AuthTransactionId, string AuthCode, int StatusId, DateTime TransactionCompleteDate, string ResponseBody, out TransactionalInformation transaction)
        {

            transaction = new TransactionalInformation();
            var lstMessage = dbConnection.usp_TissueBank_Add(TissueBankName, ContactPersonName, ContactPersonNumber, TissueBankEmailId, BusinessURL, TissueBankAddress, CityId, ZipCode, TissueBankStateLicense, AATBLicenseNumber, AATBExpirationDate, AATBAccredationDate, CustomerProfileId, CustomerPaymentProfileIds, UserId, TissueBankId, TransactionId, AuthTransactionId, AuthCode, StatusId, TransactionCompleteDate, ResponseBody);

            var Message = lstMessage.FirstOrDefault();
            transaction.ReturnMessage.Add(Message.ToString());
            transaction.ReturnStatus = true;

            //transaction = new TransactionalInformation();
            //int rowAffected = 0;

            //var parameterTissueBankName = new SqlParameter("@TissueBankName", SqlDbType.VarChar);
            //parameterTissueBankName.Value = TissueBankName;

            //var parameterContactPersonName = new SqlParameter("@ContactPersonName", SqlDbType.NVarChar);
            //parameterContactPersonName.Value = ContactPersonName;

            //var parameterContactPersonNumber = new SqlParameter("@ContactPersonNumber", SqlDbType.NVarChar);
            //parameterContactPersonNumber.Value = ContactPersonNumber;

            //var parameterTissueBankEmailId = new SqlParameter("@TissueBankEmailId", SqlDbType.VarChar);
            //parameterTissueBankEmailId.Value = TissueBankEmailId;

            //var parameterBusinessURL = new SqlParameter("@BusinessURL", SqlDbType.VarChar);
            //parameterBusinessURL.Value = BusinessURL;

            //var parameterTissueBankAddress = new SqlParameter("@TissueBankAddress", SqlDbType.VarChar);
            //parameterTissueBankAddress.Value = TissueBankAddress;

            //var parameterCityId = new SqlParameter("@CityId", SqlDbType.Int);
            //parameterCityId.Value = CityId;

            //var parameterZipCode = new SqlParameter("@ZipCode", SqlDbType.VarChar);
            //parameterZipCode.Value = ZipCode;

            //var parameterTissueBankStateLicense = new SqlParameter("@TissueBankStateLicense", SqlDbType.VarChar);
            //parameterTissueBankStateLicense.Value = TissueBankStateLicense;

            //var parameterAATBLicenseNumber = new SqlParameter("@AATBLicenseNumber", SqlDbType.VarChar);
            //parameterAATBLicenseNumber.Value = AATBLicenseNumber;

            //var parameterAATBExpirationDate = new SqlParameter("@AATBExpirationDate", SqlDbType.Date);
            //parameterAATBExpirationDate.Value = AATBExpirationDate;

            //var parameterAATBAccredationDate = new SqlParameter("@AATBAccredationDate", SqlDbType.Date);
            //parameterAATBAccredationDate.Value = AATBAccredationDate;

            //var parameterCustomerProfileId = new SqlParameter("@CustomerProfileId", SqlDbType.VarChar);
            //parameterCustomerProfileId.Value = CustomerProfileId;

            //var parameterCustomerPaymentProfileIds = new SqlParameter("@CustomerPaymentProfileIds", SqlDbType.VarChar);
            //parameterCustomerPaymentProfileIds.Value = CustomerPaymentProfileIds;

            //var parameterUserId = new SqlParameter("@UserId", SqlDbType.Date);
            //parameterUserId.Value = UserId;

            //var parameterTissueBankId = new SqlParameter("@TissueBankId", SqlDbType.Int);
            //parameterTissueBankId.Value = TissueBankId;

            //var parameterTransactionId = new SqlParameter("@TransactionId", SqlDbType.Int);
            //parameterTransactionId.Value = TransactionId;

            //var parameterAuthTransactionId = new SqlParameter("@AuthTransactionId", SqlDbType.VarChar);
            //parameterAuthTransactionId.Value = AuthTransactionId;

            //var parameterAuthCode = new SqlParameter("@AuthCode", SqlDbType.VarChar);
            //parameterAuthCode.Value = AuthCode;

            //var parameterStatusId = new SqlParameter("@StatusId", SqlDbType.Int);
            //parameterStatusId.Value = StatusId;

            //var parameterTransactionCompleteDate = new SqlParameter("@TransactionCompleteDate", SqlDbType.DateTime);
            //parameterTransactionCompleteDate.Value = TransactionCompleteDate;

            //var parameterResponseBody = new SqlParameter("@ResponseBody", SqlDbType.VarChar);
            //parameterResponseBody.Value = ResponseBody;

            //var ret = dbConnection.Database.SqlQuery<string>("exec dbo.sp_TissueBank_Add @TissueBankName, @ContactPersonName, @ContactPersonNumber, @TissueBankEmailId, @BusinessURL, @TissueBankAddress, @CityId,@ZipCode, @TissueBankStateLicense, @AATBLicenseNumber, @AATBExpirationDate, @AATBAccredationDate,@CustomerProfileId,@CustomerPaymentProfileIds, @UserId, @TissueBankId, @TransactionId, @AuthTransactionId, @AuthCode, @StatusId, @TransactionCompleteDate, @ResponseBody", parameterTissueBankName, parameterContactPersonName, parameterContactPersonNumber, parameterTissueBankEmailId, parameterBusinessURL, parameterTissueBankAddress, parameterCityId, parameterZipCode, parameterTissueBankStateLicense, parameterAATBLicenseNumber, parameterAATBExpirationDate, parameterAATBAccredationDate, parameterCustomerProfileId, parameterCustomerPaymentProfileIds, parameterUserId, parameterTissueBankId, parameterTransactionId, parameterAuthTransactionId, parameterAuthCode, parameterStatusId, parameterTransactionCompleteDate, parameterResponseBody);

            //if (rowAffected > 0)
            //{
            //    transaction.ReturnStatus = true;
            //    transaction.ReturnMessage.Add("Tissue bank is registered successfully.");
            //}
            //else
            //{
            //    transaction.ReturnStatus = false;
            //    transaction.ReturnMessage.Add("Database Error");
            //}

            //return rowAffected;

            #region
            //transaction = new TransactionalInformation();
            //dbConnection.Configuration.ProxyCreationEnabled = false;

            //if (tissueBank != null)
            //{
            //    dbConnection.TissueBank.Add(tissueBank);
            //    int rowAffected = dbConnection.SaveChanges();

            //    var _tb = (from tb in dbConnection.TissueBank
            //              orderby tb.TissueBankId
            //              select tb).Take(1).FirstOrDefault();

            //    _tb.CreatedBy = _tb.TissueBankId;
            //    _tb.LastModifiedBy = _tb.TissueBankId;

            //    dbConnection.Entry(_tb).Property(t => t.CreatedBy).IsModified = true;
            //    dbConnection.Entry(_tb).Property(t => t.LastModifiedBy).IsModified = true;
            //    rowAffected=dbConnection.SaveChanges();

            //    if (rowAffected > 0)
            //    {
            //        transaction.ReturnStatus = true;
            //        transaction.ReturnMessage.Add("Tissue Bank is registered successfully.");
            //    }
            //    else
            //    {
            //        transaction.ReturnStatus = false;
            //        transaction.ReturnMessage.Add("Database Error");
            //    }
            //}
            #endregion
        }

        public bool ValidateUniqueTissueBankEmailId(string TissueBankEmailId)
        {
            TissueBank tissueBank = dbConnection.TissueBank.FirstOrDefault(c => c.TissueBankEmailId == TissueBankEmailId);
            if (tissueBank == null)
                return true;

            return false;
        }

        public bool ValidateUniqueContactPersonNumber(string ContactPersonNumber)
        {
            TissueBank tissueBank = dbConnection.TissueBank.FirstOrDefault(c => c.ContactPersonNumber == ContactPersonNumber);
            if (tissueBank == null)
                return true;

            return false;
        }

        public bool ValidateUniqueAATBLicenseNumber(string AATBLicenseNumber)
        {
            TissueBank tissueBank = dbConnection.TissueBank.FirstOrDefault(c => c.AATBLicenseNumber == AATBLicenseNumber);
            if (tissueBank == null)
                return true;

            return false;
        }

        public bool ValidateUniqueTissueBankStateLicense(string TissueBankStateLicense)
        {
            TissueBank tissueBank = dbConnection.TissueBank.FirstOrDefault(c => c.TissueBankStateLicense == TissueBankStateLicense);
            if (tissueBank == null)
                return true;

            return false;
        }

        //public string UpdateTb(TissueBank tissueBank)
        //{
        //    using (AllocatDbEntities db = new AllocatDbEntities())
        //    {
        //        try
        //        {
        //            db.Entry(tissueBank).State = System.Data.Entity.EntityState.Modified;
        //            db.SaveChanges();
        //            return "OK";
        //        }
        //        catch (Exception ee)
        //        {
        //            return ee.Message;
        //        }
        //    }
        //}

        //public string DeleteTissueBank(int TissueBankId)
        //{
        //    try
        //    {
        //        int _TbId = TissueBankId;
        //        using (AllocatDbEntities db = new AllocatDbEntities())
        //        {
        //            var tissueBank = db.TissueBank.Find(_TbId);

        //            tissueBank.IsActive = false;
        //            db.Entry(tissueBank).Property(t => t.IsActive).IsModified = true;
        //            db.SaveChanges();
        //            return "OK";
        //        }
        //    }
        //    catch (Exception ee)
        //    {
        //        return ee.Message;
        //    }
        //}
    }
}
