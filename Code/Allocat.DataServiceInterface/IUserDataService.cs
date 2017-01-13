using Allocat.DataModel;
using System;
using System.Collections.Generic;

namespace Allocat.DataServiceInterface
{
    public interface IUserDataService : IDataService,IDisposable
    {
        IEnumerable<sp_User_Get_Result> GetOrderByTissueBankId(int TissueBankId, string SearchBy, int CurrentPage, int PageSize, string SortDirection, string SortExpression, out TransactionalInformation transaction);
        IEnumerable<sp_OrderDetail_TissueBank_GetByOrderId_Result> GetOrderDetailByOrderId(int OrderId, out TransactionalInformation transaction);
        int Order_Ack_Decline(int OrderId, int StatusId, string DeclineRemark, string ShippingMethod, DateTime TissueBankSendByDate, int LastModifiedBy,out TransactionalInformation transaction);
    }
}
