using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Allocat.CustomService.Authorize.Net.BusinessEntities
{
    [DataContract]
    public class API
    {
        [DataMember]
        public string ApiLoginId { get; set; }
        [DataMember]
        public string TransactionKey { get; set; }
    }
}
