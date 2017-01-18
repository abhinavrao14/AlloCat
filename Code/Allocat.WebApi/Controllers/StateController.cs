using Allocat.ApplicationService;
using Allocat.DataModel;
using Allocat.DataService;
using Allocat.DataServiceInterface;
using Allocat.WebApi.WebApiModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Allocat.WebApi.Controllers
{
    public class StateController : ApiController
    {
        IStateDataService stateDataService;

        public StateController()
        {
            stateDataService = new StateDataService();
        }

        public HttpResponseMessage Get()
        {
            CityStateApiModel cityStateApiModel = new CityStateApiModel();
            TransactionalInformation transaction = new TransactionalInformation();

            StateBusinessService stateBusinessService = new StateBusinessService(stateDataService);

            IEnumerable<State> States = stateBusinessService.GetState
                (out transaction);
            cityStateApiModel.States = States;

            cityStateApiModel.ReturnStatus = transaction.ReturnStatus;
            cityStateApiModel.ReturnMessage = transaction.ReturnMessage;
            cityStateApiModel.IsAuthenicated = true;

            if (transaction.ReturnStatus == true)
            {
                var response = Request.CreateResponse<CityStateApiModel>(HttpStatusCode.OK, cityStateApiModel);
                return response;
            }

            var badResponse = Request.CreateResponse<CityStateApiModel>(HttpStatusCode.BadRequest, cityStateApiModel);
            return badResponse;
        }
    }
}
