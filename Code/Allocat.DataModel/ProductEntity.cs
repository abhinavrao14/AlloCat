//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Allocat.DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductEntity
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductEntity()
        {
            this.OrderDetail = new HashSet<OrderDetail>();
            this.PurchaseRequest = new HashSet<PurchaseRequest>();
            this.RequestForQuote = new HashSet<RequestForQuote>();
        }
    
        public int ProductEntityId { get; set; }
        public Nullable<int> TissueBankProductId { get; set; }
        public Nullable<int> TissueBankId { get; set; }
        public Nullable<int> HospitalId { get; set; }
        public int Quantity { get; set; }
        public Nullable<decimal> UnitPrice { get; set; }
        public Nullable<decimal> LineTotal { get; set; }
        public Nullable<decimal> SalesTax { get; set; }
        public Nullable<decimal> Total { get; set; }
        public Nullable<System.DateTime> NeedByDate { get; set; }
        public Nullable<System.DateTime> TissueBankSendByDate { get; set; }
        public Nullable<int> ShippingDetailId { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> LastModifiedDate { get; set; }
        public Nullable<int> LastModifiedBy { get; set; }
    
        public virtual Hospital Hospital { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
        public virtual ShippingDetail ShippingDetail { get; set; }
        public virtual TissueBank TissueBank { get; set; }
        public virtual TissueBankProduct TissueBankProduct { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PurchaseRequest> PurchaseRequest { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RequestForQuote> RequestForQuote { get; set; }
    }
}
