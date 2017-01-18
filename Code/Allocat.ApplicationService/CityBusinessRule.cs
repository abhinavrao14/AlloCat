using System;

namespace Allocat.ApplicationService
{
    public class CityBusinessRule : ValidationRules
    {
        public CityBusinessRule()
        {

        }

        public void validateCityRequest(int stateId)
        {
            //Required Validations
            ValidateRequired(stateId, "State Id");

            //Regular Expression Validations
            ValidateNumeric(stateId, "State Id");
        }
    }
}