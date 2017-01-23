using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Runtime.Serialization;

namespace Allocat.CustomService.Authorize.Net.BusinessEntities
{
    [DataContract]
    public class CreditCard
    {
        [DataMember]
        public string CreditCardNumber { get; set; }
        [DataMember]
        public int CreditCardType { get; set; }
        [DataMember]
        public string ExpiryDate { get; set; }

    }
}
