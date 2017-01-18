using Allocat.ApplicationService;
using Allocat.DataModel;
using Allocat.DataService;
using Allocat.DataServiceInterface;
using Allocat.WebApi.WebApiModel;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Allocat.WebApi.Controllers
{
    public class UserController : ApiController
    {
        IUserDataService userDataService;

        public UserController()
        {
            userDataService = new UserDataService();
        }

        public HttpResponseMessage Get([FromUri] UserMngmt_DTO user_DTO)
        {
            if (user_DTO.SearchBy == null) user_DTO.SearchBy = string.Empty;
            if (user_DTO.SortDirection == null) user_DTO.SortDirection = string.Empty;
            if (user_DTO.SortExpression == null) user_DTO.SortExpression = string.Empty;

            UserApiModel userApiModel = new UserApiModel();
            TransactionalInformation transaction = new TransactionalInformation();

            if (user_DTO.SortDirection == "") user_DTO.SortDirection = "ASC";
            if (user_DTO.SortExpression == "") user_DTO.SortExpression = "FullName";

            UserBusinessService userBusinessService = new UserBusinessService(userDataService);

            IEnumerable<sp_UserMngmt_TissueBank_GetByTissueBankId_Result> Users = userBusinessService.GetUser
                (user_DTO.TissueBankId, user_DTO.SearchBy, user_DTO.CurrentPage, user_DTO.PageSize, user_DTO.SortDirection, user_DTO.SortExpression, out transaction);

            userApiModel.Users = Users;
            userApiModel.ReturnStatus = transaction.ReturnStatus;
            userApiModel.ReturnMessage = transaction.ReturnMessage;
            userApiModel.IsAuthenicated = true;

            if (transaction.ReturnStatus == true)
            {
                return Request.CreateResponse<UserApiModel>(HttpStatusCode.OK, userApiModel);
            }
            else
            {
                userApiModel.ValidationErrors = transaction.ValidationErrors;
                return Request.CreateResponse<UserApiModel>(HttpStatusCode.BadRequest, userApiModel);
            }
        }

        public HttpResponseMessage Get(int UserId, string type)
        {
            UserApiModel userApiModel = new UserApiModel();
            TransactionalInformation transaction = new TransactionalInformation();

            UserBusinessService userBusinessService = new UserBusinessService(userDataService);


            if (type == "getUserRole")
            {
                IEnumerable<sp_UserMngmt_GetUserRoleByUserId_Result> UserRoles = userBusinessService.GetUserRoleByUserId
                   (UserId, out transaction);
                userApiModel.UserRoles = UserRoles;
            }
            else
            {
                IEnumerable<sp_UserMngmt_TissueBank_GetByUserId_Result> UserDetail = userBusinessService.GetUserDetail
                    (UserId, out transaction);
                userApiModel.UserDetail = UserDetail;
            }

            userApiModel.ReturnStatus = transaction.ReturnStatus;
            userApiModel.ReturnMessage = transaction.ReturnMessage;
            userApiModel.IsAuthenicated = true;

            if (transaction.ReturnStatus == true)
            {
                return Request.CreateResponse<UserApiModel>(HttpStatusCode.OK, userApiModel);
            }
            else
            {
                userApiModel.ValidationErrors = transaction.ValidationErrors;
                return Request.CreateResponse<UserApiModel>(HttpStatusCode.BadRequest, userApiModel);
            }
        }

        [HttpPost]
        public HttpResponseMessage POST(User_CUD_DTO user_CUD_DTO)
        {
            TransactionalInformation transaction = new TransactionalInformation();

            UserApiModel userApiModel = new UserApiModel();

            UserBusinessService userBusinessService = new UserBusinessService(userDataService);

            #region DefaultValues
            //for (int i = 0; i < dtProducts.Rows.Count; ++i)
            //{
            //    if (dtProducts.Rows[i]["ProductMasterId"] == null)
            //        dtProducts.Rows[i]["ProductMasterId"] = 0;
            //    else if (dtProducts.Rows[i]["ProductMasterId"].ToString() == "")
            //        dtProducts.Rows[i]["ProductMasterId"] = 0;

            //    if (dtProducts.Rows[i]["IsAvailableForSale"] != null)
            //    {
            //        if (dtProducts.Rows[i]["IsAvailableForSale"].ToString() == "Yes")
            //        {
            //            dtProducts.Rows[i]["IsAvailableForSale"] = 1;
            //        }
            //        else if (dtProducts.Rows[i]["IsAvailableForSale"].ToString() == "No")
            //        {
            //            dtProducts.Rows[i]["IsAvailableForSale"] = 0;
            //        }
            //    }
            //}
            #endregion

            userBusinessService.User_CreateUpdateDelete(user_CUD_DTO.UserId, user_CUD_DTO.UserName, user_CUD_DTO.Password, user_CUD_DTO.FullName, user_CUD_DTO.MobileNumber, user_CUD_DTO.EmailId,user_CUD_DTO.CreatedBy, user_CUD_DTO.LastModifiedBy,  user_CUD_DTO.InfoId, user_CUD_DTO.OperationType, user_CUD_DTO.AllowLogin, user_CUD_DTO.TempUser_CUD,  out transaction);

            userApiModel.ReturnMessage = transaction.ReturnMessage;
            userApiModel.ReturnStatus = transaction.ReturnStatus;

            if (transaction.ReturnStatus == false)
            {
                userApiModel.ValidationErrors = transaction.ValidationErrors;
                return Request.CreateResponse<UserApiModel>(HttpStatusCode.BadRequest, userApiModel);
            }
            else
            {
                return Request.CreateResponse<UserApiModel>(HttpStatusCode.OK, userApiModel);
            }
        }


    }
}
