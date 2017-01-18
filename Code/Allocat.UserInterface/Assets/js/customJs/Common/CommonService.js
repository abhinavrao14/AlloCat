app.service("StateService", function ($http) {

    this.GetStates = function () {
        var response = $http({
            method: 'Get',
            url: 'http://localhost:63744/api/State'
        });
        return response;
    };
});


app.service("CityService", function ($http) {

    this.GetCities = function (StateId) {
        var response = $http({
            method: 'Get',
            url: 'http://localhost:63744/api/City',
            params: { StateId: StateId }
        });
        return response;
    };


});
