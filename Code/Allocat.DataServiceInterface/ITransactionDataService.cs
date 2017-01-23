using Allocat.DataModel;
using System;
using System.Collections.Generic;
using System.Data;

namespace Allocat.DataServiceInterface
{
    public interface ITransactionDataService : IDataService, IDisposable
    {
        int CreateTransaction(DateTime TransactionInitiateDate, float Amount, int UserId, out TransactionalInformation transaction);
    }
}