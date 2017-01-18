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
        public IEnumerable<TissueBank> GetAllTissueBank()
        {
            AllocatDbEntities db = new AllocatDbEntities();
            db.Configuration.ProxyCreationEnabled = false;
            try
            {
                return db.TissueBank.Where(t => t.IsActive == true);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //public IEnumerable<sp_TissueBank_GetByTissueBankId_Result> GetTissueBankByTissueBankIdId(int TissueBankId)
        //{
        //    AllocatDbEntities db = new AllocatDbEntities();
        //    try
        //    {
        //        db.Configuration.ProxyCreationEnabled = false;
        //        return db.sp_TissueBank_GetByTissueBankId(TissueBankId);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        public int AddTissueBank(string TissueBankName, string ContactPersonName, string ContactPersonNumber, string TissueBankEmailId, string BusinessURL, string TissueBankAddress, int CityId, string TissueBankStateLicense, string AATBLicenseNumber, DateTime AATBExpirationDate, DateTime AATBAccredationDate, string Password, out TransactionalInformation transaction)
        {
            transaction = new TransactionalInformation();
            int rowAffected = 0;

            var parameterTissueBankName = new SqlParameter("@TissueBankName", SqlDbType.VarChar);
            parameterTissueBankName.Value = TissueBankName;

            var parameterContactPersonName = new SqlParameter("@ContactPersonName", SqlDbType.NVarChar);
            parameterContactPersonName.Value = ContactPersonName;

            var parameterContactPersonNumber = new SqlParameter("@ContactPersonNumber", SqlDbType.NVarChar);
            parameterContactPersonNumber.Value = ContactPersonNumber;

            var parameterTissueBankEmailId = new SqlParameter("@TissueBankEmailId", SqlDbType.VarChar);
            parameterTissueBankEmailId.Value = TissueBankEmailId;

            var parameterBusinessURL = new SqlParameter("@BusinessURL", SqlDbType.VarChar);
            parameterBusinessURL.Value = BusinessURL;

            var parameterTissueBankAddress = new SqlParameter("@TissueBankAddress", SqlDbType.VarChar);
            parameterTissueBankAddress.Value = TissueBankAddress;

            var parameterCityId = new SqlParameter("@CityId", SqlDbType.Int);
            parameterCityId.Value = CityId;

            var parameterTissueBankStateLicense = new SqlParameter("@TissueBankStateLicense", SqlDbType.VarChar);
            parameterTissueBankStateLicense.Value = TissueBankStateLicense;

            var parameterAATBLicenseNumber = new SqlParameter("@AATBLicenseNumber", SqlDbType.VarChar);
            parameterAATBLicenseNumber.Value = AATBLicenseNumber;

            var parameterAATBExpirationDate = new SqlParameter("@AATBExpirationDate", SqlDbType.Date);
            parameterAATBExpirationDate.Value = AATBExpirationDate;

            var parameterAATBAccredationDate = new SqlParameter("@AATBAccredationDate", SqlDbType.Date);
            parameterAATBAccredationDate.Value = AATBAccredationDate;

            var parameterPassword = new SqlParameter("@Password", SqlDbType.VarChar);
            parameterPassword.Value = Password;

            rowAffected = dbConnection.Database.ExecuteSqlCommand("exec dbo.sp_TissueBank_Add @TissueBankName, @ContactPersonName, @ContactPersonNumber, @TissueBankEmailId, @BusinessURL, @TissueBankAddress, @CityId, @TissueBankStateLicense, @AATBLicenseNumber, @AATBExpirationDate, @AATBAccredationDate, @Password", parameterTissueBankName, parameterContactPersonName, parameterContactPersonNumber, parameterTissueBankEmailId, parameterBusinessURL, parameterTissueBankAddress, parameterCityId, parameterTissueBankStateLicense, parameterAATBLicenseNumber, parameterAATBExpirationDate, parameterAATBAccredationDate, parameterPassword);

            if (rowAffected > 0)
            {
                transaction.ReturnStatus = true;
                transaction.ReturnMessage.Add("Purchase Order is updated successfully.");
            }
            else
            {
                transaction.ReturnStatus = false;
                transaction.ReturnMessage.Add("Database Error");
            }

            return rowAffected;


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
