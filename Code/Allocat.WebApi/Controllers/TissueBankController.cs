using Allocat.ApplicationService;
using Allocat.DataModel;
using Allocat.DataService;
using Allocat.DataServiceInterface;
using Allocat.WebApi.WebApiModel;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Allocat.WebApi.Controllers
{
    public class TissueBankController : ApiController
    {
        ITissueBankDataService tbDataService;

        public TissueBankController()
        {
            tbDataService = new TissueBankDataService();
        }

        [HttpPost]
        public HttpResponseMessage Post(TissueBank_DTO tissueBank_DTO)
        {
            TransactionalInformation transaction = new TransactionalInformation();

            TissueBankApiModel tbApiModel = new TissueBankApiModel();

            TissueBankBusinessService orderBusinessService = new TissueBankBusinessService(tbDataService);

            if (tissueBank_DTO.TissueBankId == 0)
            {
                orderBusinessService.AddTissueBank(tissueBank_DTO.TissueBankId, tissueBank_DTO.TissueBankName, tissueBank_DTO.ContactPersonName, tissueBank_DTO.ContactPersonNumber, tissueBank_DTO.TissueBankEmailId, tissueBank_DTO.BusinessURL, tissueBank_DTO.TissueBankAddress, tissueBank_DTO.CityId, tissueBank_DTO.TissueBankStateLicense, tissueBank_DTO.AATBLicenseNumber, tissueBank_DTO.AATBExpirationDate, tissueBank_DTO.AATBAccredationDate, tissueBank_DTO.UserName, out transaction);
            }
            else
            {
                //orderBusinessService.UpdateTissueBank(tissueBank, out transaction);
            }

            tbApiModel.ReturnMessage = transaction.ReturnMessage;
            tbApiModel.ReturnStatus = transaction.ReturnStatus;

            if (transaction.ReturnStatus == false)
            {
                tbApiModel.ValidationErrors = transaction.ValidationErrors;
                return Request.CreateResponse<TissueBankApiModel>(HttpStatusCode.BadRequest, tbApiModel);
            }
            else
            {
                return Request.CreateResponse<TissueBankApiModel>(HttpStatusCode.OK, tbApiModel);
            }
        }
    }
}
