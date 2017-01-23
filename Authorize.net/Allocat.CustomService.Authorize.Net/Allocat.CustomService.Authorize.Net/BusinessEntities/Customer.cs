using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace Allocat.CustomService.Authorize.Net.BusinessEntities
{
    [DataContract]
    public class Customer
    {
        [DataMember]
        public string FirstName { get; set; }
        [DataMember]
        public string LastName { get; set; }
        [DataMember]
        public string CustomerId { get; set; }
        [DataMember]
        public string CustomerPaymentProfileId { get; set; }
        [DataMember]
        public string EmailId { get; set; }
        [DataMember]
        public PaymentTypeEnum PaymentType { get; set; }
        [DataMember]
        public BankAccount BankAccount { get; set; }
        [DataMember]
        public CreditCard CardInfo { get; set; }
        [DataMember]
        public AddressInfo HomeAddress { get; set; }
        [DataMember]
        public AddressInfo OfficeAddress { get; set; }

    }

    [DataContract(Name="PaymentType")]
    public enum PaymentTypeEnum
    {
        [EnumMember]
        CreditCard,
        [EnumMember]
        ECheck
    }
}
