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
    
    public partial class sp_UserMngmt_TissueBank_GetByTissueBankId_Result
    {
        public Nullable<long> Sno { get; set; }
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string FullName { get; set; }
        public string MobileNumber { get; set; }
        public string EmailId { get; set; }
        public string IsLockedOut { get; set; }
        public System.DateTime LastLoginDate { get; set; }
        public string IsActive { get; set; }
        public string AllowLogin { get; set; }
        public string UserRoles { get; set; }
        public string DomainName { get; set; }
    }
}
