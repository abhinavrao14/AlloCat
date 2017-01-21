using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Allocat.CustomService.Authorize.Net.BusinessEntities
{
    [DataContract]
    public class BankAccount
    {
        [DataMember]
        public string BankAccountNumber { get; set; }
        [DataMember]
        public string RoutingNumber { get; set; }
        [DataMember]
        public string AccountType { get; set; }
        [DataMember]
        public string ECheckType { get; set; }
        [DataMember]
        public string NameOnAccount { get; set; }
        [DataMember]
        public string BankName { get; set; }

    }
}
