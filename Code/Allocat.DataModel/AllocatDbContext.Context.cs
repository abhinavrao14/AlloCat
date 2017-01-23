namespace Allocat.DataModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Data.Entity.ModelConfiguration.Conventions;
    using System.Data.SqlClient;

    public partial class AllocatDbEntities : DbContext
    {
        public AllocatDbEntities()
            : base("name=AllocatDbEntities")
        {
            Database.SetInitializer<AllocatDbEntities>(null);
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<DomainScope> DomainScope { get; set; }
        public virtual DbSet<Entity> Entity { get; set; }
        public virtual DbSet<EntityType> EntityType { get; set; }
        public virtual DbSet<Hospital> Hospital { get; set; }
        public virtual DbSet<HospitalAddress> HospitalAddress { get; set; }
        public virtual DbSet<HospitalType> HospitalType { get; set; }
        public virtual DbSet<Notification> Notification { get; set; }
        public virtual DbSet<NotificationTag> NotificationTag { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<OrderDetail> OrderDetail { get; set; }
        public virtual DbSet<ProductEntity> ProductEntity { get; set; }
        public virtual DbSet<ProductMaster> ProductMaster { get; set; }
        public virtual DbSet<PurchaseRequest> PurchaseRequest { get; set; }
        public virtual DbSet<ReportType> ReportType { get; set; }
        public virtual DbSet<Request> Request { get; set; }
        public virtual DbSet<RequestForQuote> RequestForQuote { get; set; }
        public virtual DbSet<Response> Response { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<ShippingDetail> ShippingDetail { get; set; }
        public virtual DbSet<Source> Source { get; set; }
        public virtual DbSet<State> State { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<TaggedNotification> TaggedNotification { get; set; }
        public virtual DbSet<TissueBank> TissueBank { get; set; }
        public virtual DbSet<TissueBankProduct> TissueBankProduct { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserRole> UserRole { get; set; }
        public virtual DbSet<Question> Question { get; set; }

        public virtual int sp_RequestForQuote_TissueBank_Edit(Nullable<int> tissueBankId, string responseBody, string attachmentName, Nullable<int> createdBy, Nullable<int> lastModifiedBy, Nullable<int> requestForQuoteId, Nullable<int> statusId, string declineRemark, Nullable<int> quantity, Nullable<decimal> unitPrice, Nullable<decimal> lineTotal, Nullable<decimal> salesTax, Nullable<decimal> total, Nullable<System.DateTime> tissueBankSendByDate, string shippingMethod)
        {
            var tissueBankIdParameter = tissueBankId.HasValue ?
                new ObjectParameter("TissueBankId", tissueBankId) :
                new ObjectParameter("TissueBankId", typeof(int));

            var responseBodyParameter = responseBody != null ?
                new ObjectParameter("ResponseBody", responseBody) :
                new ObjectParameter("ResponseBody", typeof(string));

            var attachmentNameParameter = attachmentName != null ?
                new ObjectParameter("AttachmentName", attachmentName) :
                new ObjectParameter("AttachmentName", typeof(string));

            var createdByParameter = createdBy.HasValue ?
                new ObjectParameter("CreatedBy", createdBy) :
                new ObjectParameter("CreatedBy", typeof(int));

            var lastModifiedByParameter = lastModifiedBy.HasValue ?
                new ObjectParameter("LastModifiedBy", lastModifiedBy) :
                new ObjectParameter("LastModifiedBy", typeof(int));

            var requestForQuoteIdParameter = requestForQuoteId.HasValue ?
                new ObjectParameter("RequestForQuoteId", requestForQuoteId) :
                new ObjectParameter("RequestForQuoteId", typeof(int));

            var statusIdParameter = statusId.HasValue ?
                new ObjectParameter("StatusId", statusId) :
                new ObjectParameter("StatusId", typeof(int));

            var declineRemarkParameter = declineRemark != null ?
                new ObjectParameter("DeclineRemark", declineRemark) :
                new ObjectParameter("DeclineRemark", typeof(string));

            var quantityParameter = quantity.HasValue ?
                new ObjectParameter("Quantity", quantity) :
                new ObjectParameter("Quantity", typeof(int));

            var unitPriceParameter = unitPrice.HasValue ?
                new ObjectParameter("UnitPrice", unitPrice) :
                new ObjectParameter("UnitPrice", typeof(decimal));

            var lineTotalParameter = lineTotal.HasValue ?
                new ObjectParameter("LineTotal", lineTotal) :
                new ObjectParameter("LineTotal", typeof(decimal));

            var salesTaxParameter = salesTax.HasValue ?
                new ObjectParameter("SalesTax", salesTax) :
                new ObjectParameter("SalesTax", typeof(decimal));

            var totalParameter = total.HasValue ?
                new ObjectParameter("Total", total) :
                new ObjectParameter("Total", typeof(decimal));

            var tissueBankSendByDateParameter = tissueBankSendByDate.HasValue ?
                new ObjectParameter("TissueBankSendByDate", tissueBankSendByDate) :
                new ObjectParameter("TissueBankSendByDate", typeof(System.DateTime));

            var shippingMethodParameter = shippingMethod != null ?
                new ObjectParameter("ShippingMethod", shippingMethod) :
                new ObjectParameter("ShippingMethod", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_RequestForQuote_TissueBank_Edit", tissueBankIdParameter, responseBodyParameter, attachmentNameParameter, createdByParameter, lastModifiedByParameter, requestForQuoteIdParameter, statusIdParameter, declineRemarkParameter, quantityParameter, unitPriceParameter, lineTotalParameter, salesTaxParameter, totalParameter, tissueBankSendByDateParameter, shippingMethodParameter);
        }

        public virtual ObjectResult<sp_RequestForQuote_TissueBank_GetByTissueBankId_Result> sp_RequestForQuote_TissueBank_GetByTissueBankId(Nullable<int> tissueBankId, string searchBy, Nullable<int> currentPage, Nullable<int> pageSize, string sortDirection, string sortExpression)
        {
            var tissueBankIdParameter = tissueBankId.HasValue ?
                new SqlParameter("TissueBankId", tissueBankId) :
                new SqlParameter("TissueBankId", typeof(int));

            var searchByParameter = searchBy != null ?
                new SqlParameter("SearchBy", searchBy) :
                new SqlParameter("SearchBy", typeof(string));

            var currentPageParameter = currentPage.HasValue ?
                new SqlParameter("CurrentPage", currentPage) :
                new SqlParameter("CurrentPage", typeof(int));

            var pageSizeParameter = pageSize.HasValue ?
                new SqlParameter("PageSize", pageSize) :
                new SqlParameter("PageSize", typeof(int));

            var sortDirectionParameter = sortDirection != null ?
                new SqlParameter("SortDirection", sortDirection) :
                new SqlParameter("SortDirection", typeof(string));

            var sortExpressionParameter = sortExpression != null ?
                new SqlParameter("SortExpression", sortExpression) :
                new SqlParameter("SortExpression", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_RequestForQuote_TissueBank_GetByTissueBankId_Result>("sp_RequestForQuote_TissueBank_GetByTissueBankId @TissueBankId, @SearchBy , @CurrentPage,@PageSize, @SortDirection, @SortExpression ", tissueBankIdParameter, searchByParameter, currentPageParameter, pageSizeParameter, sortDirectionParameter, sortExpressionParameter);
        }

        public virtual ObjectResult<sp_RequestForQuoteDetail_TissueBank_GetByRequestForQuoteId_Result> sp_RequestForQuoteDetail_TissueBank_GetByRequestForQuoteId(Nullable<int> requestForQuoteId)
        {
            var requestForQuoteIdParameter = requestForQuoteId.HasValue ?
                new SqlParameter("RequestForQuoteId", requestForQuoteId) :
                new SqlParameter("RequestForQuoteId", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_RequestForQuoteDetail_TissueBank_GetByRequestForQuoteId_Result>("sp_RequestForQuoteDetail_TissueBank_GetByRequestForQuoteId @RequestForQuoteId", requestForQuoteIdParameter);
        }

        public virtual ObjectResult<sp_RequestResponse_TissueBank_GetByTissueBankId_Result> sp_RequestResponse_TissueBank_GetByTissueBankId(Nullable<int> requestForQuoteId)
        {
            var requestForQuoteIdParameter = requestForQuoteId.HasValue ?
                new SqlParameter("RequestForQuoteId", requestForQuoteId) :
                new SqlParameter("RequestForQuoteId", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_RequestResponse_TissueBank_GetByTissueBankId_Result>("sp_RequestResponse_TissueBank_GetByTissueBankId @RequestForQuoteId", requestForQuoteIdParameter);
        }

        public virtual int sp_TissueBankProduct_TissueBank_AddUpdate()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_TissueBankProduct_TissueBank_AddUpdate");
        }

        public virtual ObjectResult<sp_TissueBankProduct_TissueBank_GetByTissueBankId_Result> sp_TissueBankProduct_TissueBank_GetByTissueBankId(Nullable<int> tissueBankId, string searchBy, Nullable<int> currentPage, Nullable<int> pageSize, string sortDirection, string sortExpression)
        {
            var tissueBankIdParameter = tissueBankId.HasValue ?
                new SqlParameter("TissueBankId", tissueBankId) :
                new SqlParameter("TissueBankId", typeof(int));

            var searchByParameter = searchBy != null ?
                new SqlParameter("SearchBy", searchBy) :
                new SqlParameter("SearchBy", typeof(string));

            var currentPageParameter = currentPage.HasValue ?
                new SqlParameter("CurrentPage", currentPage) :
                new SqlParameter("CurrentPage", typeof(int));

            var pageSizeParameter = pageSize.HasValue ?
                new SqlParameter("PageSize", pageSize) :
                new SqlParameter("PageSize", typeof(int));

            var sortDirectionParameter = sortDirection != null ?
                new SqlParameter("SortDirection", sortDirection) :
                new SqlParameter("SortDirection", typeof(string));

            var sortExpressionParameter = sortExpression != null ?
                new SqlParameter("SortExpression", sortExpression) :
                new SqlParameter("SortExpression", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_TissueBankProduct_TissueBank_GetByTissueBankId_Result>("sp_TissueBankProduct_TissueBank_GetByTissueBankId @TissueBankId, @SearchBy , @CurrentPage,@PageSize, @SortDirection, @SortExpression ", tissueBankIdParameter, searchByParameter, currentPageParameter, pageSizeParameter, sortDirectionParameter, sortExpressionParameter);
        }

        public virtual ObjectResult<sp_TissueBankProduct_TissueBank_GetTissueBankProductsByProductMasterId_Result> sp_TissueBankProduct_TissueBank_GetTissueBankProductsByProductMasterId(Nullable<int> tissueBankId, Nullable<int> productMasterId)
        {
            var tissueBankIdParameter = tissueBankId.HasValue ?
                new SqlParameter("TissueBankId", tissueBankId) :
                new SqlParameter("TissueBankId", typeof(int));

            var productMasterIdParameter = productMasterId.HasValue ?
                new SqlParameter("ProductMasterId", productMasterId) :
                new SqlParameter("ProductMasterId", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_TissueBankProduct_TissueBank_GetTissueBankProductsByProductMasterId_Result>("sp_TissueBankProduct_TissueBank_GetTissueBankProductsByProductMasterId @TissueBankId, @ProductMasterId", tissueBankIdParameter, productMasterIdParameter);
        }

        public virtual ObjectResult<sp_User_GetEntityInfoByUserName_Result> sp_User_GetEntityInfoByUserName(string userName)
        {
            var userNameParameter = userName != null ?
                new SqlParameter("UserName", userName) :
                new SqlParameter("UserName", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_User_GetEntityInfoByUserName_Result>("sp_User_GetEntityInfoByUserName @UserName", userNameParameter);
        }

        public virtual ObjectResult<string> sp_User_GetRoleByUserName(string userName)
        {
            var userNameParameter = userName != null ?
                new SqlParameter("UserName", userName) :
                new SqlParameter("UserName", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<string>("sp_User_GetRoleByUserName @UserName", userNameParameter);
        }

        public virtual ObjectResult<sp_Order_TissueBank_GetByTissueBankId_Result> sp_Order_TissueBank_GetByTissueBankId(Nullable<int> tissueBankId, string searchBy, Nullable<int> currentPage, Nullable<int> pageSize, string sortDirection, string sortExpression)
        {
            var tissueBankIdParameter = tissueBankId.HasValue ?
                new SqlParameter("TissueBankId", tissueBankId) :
                new SqlParameter("TissueBankId", typeof(int));

            var searchByParameter = searchBy != null ?
                new SqlParameter("SearchBy", searchBy) :
                new SqlParameter("SearchBy", typeof(string));

            var currentPageParameter = currentPage.HasValue ?
                new SqlParameter("CurrentPage", currentPage) :
                new SqlParameter("CurrentPage", typeof(int));

            var pageSizeParameter = pageSize.HasValue ?
                new SqlParameter("PageSize", pageSize) :
                new SqlParameter("PageSize", typeof(int));

            var sortDirectionParameter = sortDirection != null ?
                new SqlParameter("SortDirection", sortDirection) :
                new SqlParameter("SortDirection", typeof(string));

            var sortExpressionParameter = sortExpression != null ?
                new SqlParameter("SortExpression", sortExpression) :
                new SqlParameter("SortExpression", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_Order_TissueBank_GetByTissueBankId_Result>("sp_Order_TissueBank_GetByTissueBankId @TissueBankId, @SearchBy , @CurrentPage,@PageSize, @SortDirection, @SortExpression", tissueBankIdParameter, searchByParameter, currentPageParameter, pageSizeParameter, sortDirectionParameter, sortExpressionParameter);
        }

        public virtual ObjectResult<sp_OrderDetail_TissueBank_GetByOrderId_Result> sp_OrderDetail_TissueBank_GetByOrderId(Nullable<int> orderId)
        {
            var orderIdParameter = orderId.HasValue ?
                new SqlParameter("OrderId", orderId) :
                new SqlParameter("OrderId", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_OrderDetail_TissueBank_GetByOrderId_Result>("sp_OrderDetail_TissueBank_GetByOrderId @OrderId", orderIdParameter);
        }

        public virtual int sp_Order_TissueBank_Ack_Decline(Nullable<int> orderId, Nullable<int> statusId, string declineRemark, string shippingMethod, Nullable<System.DateTime> tissueBankSendByDate, Nullable<int> lastModifiedBy)
        {
            var orderIdParameter = orderId.HasValue ?
                new ObjectParameter("OrderId", orderId) :
                new ObjectParameter("OrderId", typeof(int));

            var statusIdParameter = statusId.HasValue ?
                new ObjectParameter("StatusId", statusId) :
                new ObjectParameter("StatusId", typeof(int));

            var declineRemarkParameter = declineRemark != null ?
                new ObjectParameter("DeclineRemark", declineRemark) :
                new ObjectParameter("DeclineRemark", typeof(string));

            var shippingMethodParameter = shippingMethod != null ?
                new ObjectParameter("ShippingMethod", shippingMethod) :
                new ObjectParameter("ShippingMethod", typeof(string));

            var tissueBankSendByDateParameter = tissueBankSendByDate.HasValue ?
                new ObjectParameter("TissueBankSendByDate", tissueBankSendByDate) :
                new ObjectParameter("TissueBankSendByDate", typeof(System.DateTime));

            var lastModifiedByParameter = lastModifiedBy.HasValue ?
                new ObjectParameter("LastModifiedBy", lastModifiedBy) :
                new ObjectParameter("LastModifiedBy", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Order_TissueBank_Ack_Decline", orderIdParameter, statusIdParameter, declineRemarkParameter, shippingMethodParameter, tissueBankSendByDateParameter, lastModifiedByParameter);
        }

        public virtual int sp_User_CUD(Nullable<int> userId, string userName, string password, string fullName, Nullable<int> entityID, Nullable<int> domainScopeID, string mobileNumber, string emailId, Nullable<bool> isMobileVerified, Nullable<bool> isEmailVerified, Nullable<bool> isLockedOut, Nullable<System.DateTime> lastLoginDate, Nullable<System.DateTime> lastPasswordChangedDate, Nullable<System.DateTime> lastLockoutDate, Nullable<int> failedPasswordAttemptCount, Nullable<int> failedPasswordAnswerAttemptCount, string passwordQuestion, string passwordAnswer, string securityQuestion, string securityAnswer, Nullable<bool> isActive, Nullable<int> createdBy, Nullable<int> lastModifiedBy, Nullable<int> entityTypeId, Nullable<int> infoId, string operationType)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(int));

            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));

            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));

            var fullNameParameter = fullName != null ?
                new ObjectParameter("FullName", fullName) :
                new ObjectParameter("FullName", typeof(string));

            var entityIDParameter = entityID.HasValue ?
                new ObjectParameter("EntityID", entityID) :
                new ObjectParameter("EntityID", typeof(int));

            var domainScopeIDParameter = domainScopeID.HasValue ?
                new ObjectParameter("DomainScopeID", domainScopeID) :
                new ObjectParameter("DomainScopeID", typeof(int));

            var mobileNumberParameter = mobileNumber != null ?
                new ObjectParameter("MobileNumber", mobileNumber) :
                new ObjectParameter("MobileNumber", typeof(string));

            var emailIdParameter = emailId != null ?
                new ObjectParameter("EmailId", emailId) :
                new ObjectParameter("EmailId", typeof(string));

            var isMobileVerifiedParameter = isMobileVerified.HasValue ?
                new ObjectParameter("IsMobileVerified", isMobileVerified) :
                new ObjectParameter("IsMobileVerified", typeof(bool));

            var isEmailVerifiedParameter = isEmailVerified.HasValue ?
                new ObjectParameter("IsEmailVerified", isEmailVerified) :
                new ObjectParameter("IsEmailVerified", typeof(bool));

            var isLockedOutParameter = isLockedOut.HasValue ?
                new ObjectParameter("IsLockedOut", isLockedOut) :
                new ObjectParameter("IsLockedOut", typeof(bool));

            var lastLoginDateParameter = lastLoginDate.HasValue ?
                new ObjectParameter("LastLoginDate", lastLoginDate) :
                new ObjectParameter("LastLoginDate", typeof(System.DateTime));

            var lastPasswordChangedDateParameter = lastPasswordChangedDate.HasValue ?
                new ObjectParameter("LastPasswordChangedDate", lastPasswordChangedDate) :
                new ObjectParameter("LastPasswordChangedDate", typeof(System.DateTime));

            var lastLockoutDateParameter = lastLockoutDate.HasValue ?
                new ObjectParameter("LastLockoutDate", lastLockoutDate) :
                new ObjectParameter("LastLockoutDate", typeof(System.DateTime));

            var failedPasswordAttemptCountParameter = failedPasswordAttemptCount.HasValue ?
                new ObjectParameter("FailedPasswordAttemptCount", failedPasswordAttemptCount) :
                new ObjectParameter("FailedPasswordAttemptCount", typeof(int));

            var failedPasswordAnswerAttemptCountParameter = failedPasswordAnswerAttemptCount.HasValue ?
                new ObjectParameter("FailedPasswordAnswerAttemptCount", failedPasswordAnswerAttemptCount) :
                new ObjectParameter("FailedPasswordAnswerAttemptCount", typeof(int));

            var passwordQuestionParameter = passwordQuestion != null ?
                new ObjectParameter("PasswordQuestion", passwordQuestion) :
                new ObjectParameter("PasswordQuestion", typeof(string));

            var passwordAnswerParameter = passwordAnswer != null ?
                new ObjectParameter("PasswordAnswer", passwordAnswer) :
                new ObjectParameter("PasswordAnswer", typeof(string));

            var securityQuestionParameter = securityQuestion != null ?
                new ObjectParameter("SecurityQuestion", securityQuestion) :
                new ObjectParameter("SecurityQuestion", typeof(string));

            var securityAnswerParameter = securityAnswer != null ?
                new ObjectParameter("SecurityAnswer", securityAnswer) :
                new ObjectParameter("SecurityAnswer", typeof(string));

            var isActiveParameter = isActive.HasValue ?
                new ObjectParameter("IsActive", isActive) :
                new ObjectParameter("IsActive", typeof(bool));

            var createdByParameter = createdBy.HasValue ?
                new ObjectParameter("CreatedBy", createdBy) :
                new ObjectParameter("CreatedBy", typeof(int));

            var lastModifiedByParameter = lastModifiedBy.HasValue ?
                new ObjectParameter("LastModifiedBy", lastModifiedBy) :
                new ObjectParameter("LastModifiedBy", typeof(int));

            var entityTypeIdParameter = entityTypeId.HasValue ?
                new ObjectParameter("EntityTypeId", entityTypeId) :
                new ObjectParameter("EntityTypeId", typeof(int));

            var infoIdParameter = infoId.HasValue ?
                new ObjectParameter("InfoId", infoId) :
                new ObjectParameter("InfoId", typeof(int));

            var operationTypeParameter = operationType != null ?
                new ObjectParameter("OperationType", operationType) :
                new ObjectParameter("OperationType", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_User_CUD", userIdParameter, userNameParameter, passwordParameter, fullNameParameter, entityIDParameter, domainScopeIDParameter, mobileNumberParameter, emailIdParameter, isMobileVerifiedParameter, isEmailVerifiedParameter, isLockedOutParameter, lastLoginDateParameter, lastPasswordChangedDateParameter, lastLockoutDateParameter, failedPasswordAttemptCountParameter, failedPasswordAnswerAttemptCountParameter, passwordQuestionParameter, passwordAnswerParameter, securityQuestionParameter, securityAnswerParameter, isActiveParameter, createdByParameter, lastModifiedByParameter, entityTypeIdParameter, infoIdParameter, operationTypeParameter);
        }

        public virtual ObjectResult<sp_User_GetUserRoleByUserId_Result> sp_User_GetUserRoleByUserId(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new SqlParameter("UserId", userId) :
                new SqlParameter("UserId", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_User_GetUserRoleByUserId_Result>("sp_User_GetUserRoleByUserId @UserId", userIdParameter);
        }

        public virtual ObjectResult<sp_UserDetail_GetByUserId_Result> sp_UseDetail_GetByUserId(Nullable<int> userId, string infoType)
        {
            var userIdParameter = userId.HasValue ?
                new SqlParameter("UserId", userId) :
                new SqlParameter("UserId", typeof(int));

            var infoTypeParameter = infoType != null ?
                new SqlParameter("InfoType", infoType) :
                new SqlParameter("InfoType", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_UserDetail_GetByUserId_Result>("sp_UserDetail_GetByUserId @UserId , @InfoType", userIdParameter, infoTypeParameter);
        }

        public virtual ObjectResult<sp_User_Get_Result> sp_User_Get(string roleName, string getType, string searchBy, Nullable<int> currentPage, Nullable<int> pageSize, string sortDirection, string sortExpression)
        {
            var roleNameParameter = roleName != null ?
                new SqlParameter("RoleName", roleName) :
                new SqlParameter("RoleName", typeof(string));

            var getTypeParameter = getType != null ?
                new SqlParameter("GetType", getType) :
                new SqlParameter("GetType", typeof(string));

            var searchByParameter = searchBy != null ?
                new SqlParameter("SearchBy", searchBy) :
                new SqlParameter("SearchBy", typeof(string));

            var currentPageParameter = currentPage.HasValue ?
                new SqlParameter("CurrentPage", currentPage) :
                new SqlParameter("CurrentPage", typeof(int));

            var pageSizeParameter = pageSize.HasValue ?
                new SqlParameter("PageSize", pageSize) :
                new SqlParameter("PageSize", typeof(int));

            var sortDirectionParameter = sortDirection != null ?
                new SqlParameter("SortDirection", sortDirection) :
                new SqlParameter("SortDirection", typeof(string));

            var sortExpressionParameter = sortExpression != null ?
                new SqlParameter("SortExpression", sortExpression) :
                new SqlParameter("SortExpression", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_User_Get_Result>("sp_User_Get @RoleName, @GetType, @SearchBy , @CurrentPage,@PageSize, @SortDirection, @SortExpression", roleNameParameter, getTypeParameter, searchByParameter, currentPageParameter, pageSizeParameter, sortDirectionParameter, sortExpressionParameter);
        }

        public virtual ObjectResult<sp_UserMngmt_GetUserRoleByUserId_Result> sp_UserMngmt_GetUserRoleByUserId(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new SqlParameter("UserId", userId) :
                new SqlParameter("UserId", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_UserMngmt_GetUserRoleByUserId_Result>("sp_UserMngmt_GetUserRoleByUserId @UserId", userIdParameter);
        }

        public virtual int sp_UserProfile_TissueBank_UpdateByUserId(Nullable<int> userId, string userName, string fullName, string mobileNumber, string emailId, Nullable<bool> isMobileVerified, Nullable<bool> isEmailVerified, Nullable<System.DateTime> lastLoginDate, string passwordQuestion, string passwordAnswer, string securityQuestion, string securityAnswer)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(int));

            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));

            var fullNameParameter = fullName != null ?
                new ObjectParameter("FullName", fullName) :
                new ObjectParameter("FullName", typeof(string));

            var mobileNumberParameter = mobileNumber != null ?
                new ObjectParameter("MobileNumber", mobileNumber) :
                new ObjectParameter("MobileNumber", typeof(string));

            var emailIdParameter = emailId != null ?
                new ObjectParameter("EmailId", emailId) :
                new ObjectParameter("EmailId", typeof(string));

            var isMobileVerifiedParameter = isMobileVerified.HasValue ?
                new ObjectParameter("IsMobileVerified", isMobileVerified) :
                new ObjectParameter("IsMobileVerified", typeof(bool));

            var isEmailVerifiedParameter = isEmailVerified.HasValue ?
                new ObjectParameter("IsEmailVerified", isEmailVerified) :
                new ObjectParameter("IsEmailVerified", typeof(bool));

            var lastLoginDateParameter = lastLoginDate.HasValue ?
                new ObjectParameter("LastLoginDate", lastLoginDate) :
                new ObjectParameter("LastLoginDate", typeof(System.DateTime));

            var passwordQuestionParameter = passwordQuestion != null ?
                new ObjectParameter("PasswordQuestion", passwordQuestion) :
                new ObjectParameter("PasswordQuestion", typeof(string));

            var passwordAnswerParameter = passwordAnswer != null ?
                new ObjectParameter("PasswordAnswer", passwordAnswer) :
                new ObjectParameter("PasswordAnswer", typeof(string));

            var securityQuestionParameter = securityQuestion != null ?
                new ObjectParameter("SecurityQuestion", securityQuestion) :
                new ObjectParameter("SecurityQuestion", typeof(string));

            var securityAnswerParameter = securityAnswer != null ?
                new ObjectParameter("SecurityAnswer", securityAnswer) :
                new ObjectParameter("SecurityAnswer", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_UserProfile_TissueBank_UpdateByUserId", userIdParameter, userNameParameter, fullNameParameter, mobileNumberParameter, emailIdParameter, isMobileVerifiedParameter, isEmailVerifiedParameter, lastLoginDateParameter, passwordQuestionParameter, passwordAnswerParameter, securityQuestionParameter, securityAnswerParameter);
        }

        public virtual ObjectResult<sp_UserProfileDetail_TissueBank_GetByUserId_Result> sp_UserProfileDetail_TissueBank_GetByUserId(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new SqlParameter("UserId", userId) :
                new SqlParameter("UserId", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_UserProfileDetail_TissueBank_GetByUserId_Result>("sp_UserProfileDetail_TissueBank_GetByUserId @UserId", userIdParameter);
        }

        public virtual int sp_UserMngmt_TissueBank_CreateUpdateDelete(Nullable<int> userId, string userName, string password, string fullName, string mobileNumber, string emailId, Nullable<int> createdBy, Nullable<int> lastModifiedBy, Nullable<int> infoId, Nullable<bool> allowLogin, string operationType)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(int));

            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));

            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));

            var fullNameParameter = fullName != null ?
                new ObjectParameter("FullName", fullName) :
                new ObjectParameter("FullName", typeof(string));

            var mobileNumberParameter = mobileNumber != null ?
                new ObjectParameter("MobileNumber", mobileNumber) :
                new ObjectParameter("MobileNumber", typeof(string));

            var emailIdParameter = emailId != null ?
                new ObjectParameter("EmailId", emailId) :
                new ObjectParameter("EmailId", typeof(string));

            var createdByParameter = createdBy.HasValue ?
                new ObjectParameter("CreatedBy", createdBy) :
                new ObjectParameter("CreatedBy", typeof(int));

            var lastModifiedByParameter = lastModifiedBy.HasValue ?
                new ObjectParameter("LastModifiedBy", lastModifiedBy) :
                new ObjectParameter("LastModifiedBy", typeof(int));

            var infoIdParameter = infoId.HasValue ?
                new ObjectParameter("InfoId", infoId) :
                new ObjectParameter("InfoId", typeof(int));

            var allowLoginParameter = allowLogin.HasValue ?
                new ObjectParameter("AllowLogin", allowLogin) :
                new ObjectParameter("AllowLogin", typeof(bool));

            var operationTypeParameter = operationType != null ?
                new ObjectParameter("OperationType", operationType) :
                new ObjectParameter("OperationType", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_UserMngmt_TissueBank_CreateUpdateDelete", userIdParameter, userNameParameter, passwordParameter, fullNameParameter, mobileNumberParameter, emailIdParameter, createdByParameter, lastModifiedByParameter, infoIdParameter, allowLoginParameter, operationTypeParameter);
        }

        public virtual ObjectResult<sp_UserMngmt_TissueBank_GetByTissueBankId_Result> sp_UserMngmt_TissueBank_GetByTissueBankId(Nullable<int> tissueBankId, string searchBy, Nullable<int> currentPage, Nullable<int> pageSize, string sortDirection, string sortExpression)
        {
            var tissueBankIdParameter = tissueBankId.HasValue ?
                new SqlParameter("TissueBankId", tissueBankId) :
                new SqlParameter("TissueBankId", typeof(int));

            var searchByParameter = searchBy != null ?
                new SqlParameter("SearchBy", searchBy) :
                new SqlParameter("SearchBy", typeof(string));

            var currentPageParameter = currentPage.HasValue ?
                new SqlParameter("CurrentPage", currentPage) :
                new SqlParameter("CurrentPage", typeof(int));

            var pageSizeParameter = pageSize.HasValue ?
                new SqlParameter("PageSize", pageSize) :
                new SqlParameter("PageSize", typeof(int));

            var sortDirectionParameter = sortDirection != null ?
                new SqlParameter("SortDirection", sortDirection) :
                new SqlParameter("SortDirection", typeof(string));

            var sortExpressionParameter = sortExpression != null ?
                new SqlParameter("SortExpression", sortExpression) :
                new SqlParameter("SortExpression", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_UserMngmt_TissueBank_GetByTissueBankId_Result>("sp_UserMngmt_TissueBank_GetByTissueBankId @TissueBankId, @SearchBy , @CurrentPage,@PageSize, @SortDirection, @SortExpression", tissueBankIdParameter, searchByParameter, currentPageParameter, pageSizeParameter, sortDirectionParameter, sortExpressionParameter);
        }

        public virtual ObjectResult<sp_UserMngmt_TissueBank_GetByUserId_Result> sp_UserMngmt_TissueBank_GetByUserId(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new SqlParameter("UserId", userId) :
                new SqlParameter("UserId", typeof(int));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<sp_UserMngmt_TissueBank_GetByUserId_Result>("sp_UserMngmt_TissueBank_GetByUserId @UserId", userIdParameter);
        }

        public virtual ObjectResult<Nullable<int>> sp_UserMngmt_TissueBank_GetCountByTissueBankId(Nullable<int> tissueBankId, string searchBy)
        {
            var tissueBankIdParameter = tissueBankId.HasValue ?
                new SqlParameter("TissueBankId", tissueBankId) :
                new SqlParameter("TissueBankId", typeof(int));

            var searchByParameter = searchBy != null ?
                new SqlParameter("SearchBy", searchBy) :
                new SqlParameter("SearchBy", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteStoreQuery<Nullable<int>>("sp_UserMngmt_TissueBank_GetCountByTissueBankId @TissueBankId, @SearchBy", tissueBankIdParameter, searchByParameter);
        }

        public virtual int sp_TissueBank_Add(string tissueBankName, string contactPersonName, string contactPersonNumber, string tissueBankEmailId, string businessURL, string tissueBankAddress, Nullable<int> cityId, string tissueBankStateLicense, string aATBLicenseNumber, Nullable<System.DateTime> aATBExpirationDate, Nullable<System.DateTime> aATBAccredationDate, string userName, string password)
        {
            var tissueBankNameParameter = tissueBankName != null ?
                new ObjectParameter("TissueBankName", tissueBankName) :
                new ObjectParameter("TissueBankName", typeof(string));

            var contactPersonNameParameter = contactPersonName != null ?
                new ObjectParameter("ContactPersonName", contactPersonName) :
                new ObjectParameter("ContactPersonName", typeof(string));

            var contactPersonNumberParameter = contactPersonNumber != null ?
                new ObjectParameter("ContactPersonNumber", contactPersonNumber) :
                new ObjectParameter("ContactPersonNumber", typeof(string));

            var tissueBankEmailIdParameter = tissueBankEmailId != null ?
                new ObjectParameter("TissueBankEmailId", tissueBankEmailId) :
                new ObjectParameter("TissueBankEmailId", typeof(string));

            var businessURLParameter = businessURL != null ?
                new ObjectParameter("BusinessURL", businessURL) :
                new ObjectParameter("BusinessURL", typeof(string));

            var tissueBankAddressParameter = tissueBankAddress != null ?
                new ObjectParameter("TissueBankAddress", tissueBankAddress) :
                new ObjectParameter("TissueBankAddress", typeof(string));

            var cityIdParameter = cityId.HasValue ?
                new ObjectParameter("CityId", cityId) :
                new ObjectParameter("CityId", typeof(int));

            var tissueBankStateLicenseParameter = tissueBankStateLicense != null ?
                new ObjectParameter("TissueBankStateLicense", tissueBankStateLicense) :
                new ObjectParameter("TissueBankStateLicense", typeof(string));

            var aATBLicenseNumberParameter = aATBLicenseNumber != null ?
                new ObjectParameter("AATBLicenseNumber", aATBLicenseNumber) :
                new ObjectParameter("AATBLicenseNumber", typeof(string));

            var aATBExpirationDateParameter = aATBExpirationDate.HasValue ?
                new ObjectParameter("AATBExpirationDate", aATBExpirationDate) :
                new ObjectParameter("AATBExpirationDate", typeof(System.DateTime));

            var aATBAccredationDateParameter = aATBAccredationDate.HasValue ?
                new ObjectParameter("AATBAccredationDate", aATBAccredationDate) :
                new ObjectParameter("AATBAccredationDate", typeof(System.DateTime));

            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));

            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_TissueBank_Add", tissueBankNameParameter, contactPersonNameParameter, contactPersonNumberParameter, tissueBankEmailIdParameter, businessURLParameter, tissueBankAddressParameter, cityIdParameter, tissueBankStateLicenseParameter, aATBLicenseNumberParameter, aATBExpirationDateParameter, aATBAccredationDateParameter, userNameParameter, passwordParameter);
        }

        public virtual int usp_TissueBank_Registration(string fullName, string userName, string emailId, string securityQuestion, string securityAnswer, string password)
        {
            var fullNameParameter = fullName != null ?
                new ObjectParameter("FullName", fullName) :
                new ObjectParameter("FullName", typeof(string));

            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));

            var emailIdParameter = emailId != null ?
                new ObjectParameter("EmailId", emailId) :
                new ObjectParameter("EmailId", typeof(string));

            var securityQuestionParameter = securityQuestion != null ?
                new ObjectParameter("SecurityQuestion", securityQuestion) :
                new ObjectParameter("SecurityQuestion", typeof(string));

            var securityAnswerParameter = securityAnswer != null ?
                new ObjectParameter("SecurityAnswer", securityAnswer) :
                new ObjectParameter("SecurityAnswer", typeof(string));

            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("usp_TissueBank_Registration", fullNameParameter, userNameParameter, emailIdParameter, securityQuestionParameter, securityAnswerParameter, passwordParameter);
        }
    }
}
