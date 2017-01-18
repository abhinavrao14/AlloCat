using Allocat.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Allocat.WebApi.WebApiModel
{
    public class CityStateApiModel : TransactionalInformation
    {
        public IEnumerable<State> States;
        public IEnumerable<City> Cities;
    }
}