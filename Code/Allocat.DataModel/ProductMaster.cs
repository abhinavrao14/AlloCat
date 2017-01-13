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
    
    public partial class ProductMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductMaster()
        {
            this.ProductMaster1 = new HashSet<ProductMaster>();
            this.TissueBankProduct = new HashSet<TissueBankProduct>();
        }
    
        public int ProductMasterId { get; set; }
        public string ProductMasterName { get; set; }
        public string ProductMasterDescription { get; set; }
        public string ProductMasterFeatures { get; set; }
        public string ProductMasterImageName { get; set; }
        public string ProductMasterThumbnailImageName { get; set; }
        public Nullable<int> DomainScopeId { get; set; }
        public Nullable<int> FamilyId { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> LastModifiedDate { get; set; }
        public Nullable<int> LastModifiedBy { get; set; }
    
        public virtual DomainScope DomainScope { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductMaster> ProductMaster1 { get; set; }
        public virtual ProductMaster ProductMaster2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TissueBankProduct> TissueBankProduct { get; set; }
    }
}