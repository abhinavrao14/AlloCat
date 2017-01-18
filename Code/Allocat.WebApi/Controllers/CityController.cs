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
    public class CityController : ApiController
    {
        ICityDataService cityDataService;

        public CityController()
        {
            cityDataService = new CityDataService();
        }
        /// <summary>
        /// Get Method for retrieve cities
        /// </summary>
        /// <param name="StateId"></param>
        /// <returns></returns>
        public HttpResponseMessage Get(int StateId)
        {
            CityStateApiModel cityStateApiModel = new CityStateApiModel();
            TransactionalInformation transaction = new TransactionalInformation();
            CityBusinessService cityBusinessService = new CityBusinessService(cityDataService);
            
            IEnumerable<City> Cities = cityBusinessService.GetCity
                (StateId,out transaction);
            cityStateApiModel.Cities = Cities;

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
