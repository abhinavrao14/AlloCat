using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Allocat.CustomService.Authorize.Net.BusinessEntities.ResponseEntities
{
    [DataContract]
    public class ResCreateCustomerProfile
    {
        [DataMember]
        public string CustomerProfileId { get; set; }
        [DataMember]
        public string [] CustomerPaymentProfileIds { get; set; }
        [DataMember]
        public string [] CustomerShippingProfileIds { get; set; }
        [DataMember]
        public string RefId { get; set; }
        [DataMember]
        public string SessionToken { get; set; }
        [DataMember]
        public string MessageCode { get; set; }
        [DataMember]
        public string Message { get; set; }
        [DataMember]
        public ResTransaction Transaction { get; set; }
        
    }
}
