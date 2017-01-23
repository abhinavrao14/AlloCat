using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Allocat.CustomService.Authorize.Net.BusinessEntities.ResponseEntities
{
    [DataContract]
   public class ResTransaction
    {
        [DataMember]
        public string TransactionId { get; set; }
        [DataMember]
        public string ResponseCode { get; set; }
        [DataMember]
        public string MessageDescription { get; set; }
        [DataMember]
        public string AuthCode { get; set; }
        [DataMember]
        public string MessageCode { get; set; }
        [DataMember]
        public string ErrorCode { get; set; }
        [DataMember]
        public string ErrorText { get; set; }
    }
}
