app.service("tbService", function ($http) {

    this.getAllTissueBank = function () {
        var response = $http({
            method: "Get",
            url: "/api/TissueBank/GetAllTissueBank",
        });
        return response;
    };

    this.getTissueBankById = function (TissueBankId) {
        var response = $http({
            method: "get",
            url: "/api/TissueBankApi/",
            params: {
                TissueBankId: JSON.stringify(TissueBankId)
            }
        });
        return response;
    }

    this.getStateId = function (CityId) {
        var response = $http({
            method: "GET",
            url: "/State/GetStateByCityId",
            params: {
                CityId: JSON.stringify(CityId)
            }
        })

        return response;
    };

    this.AddUpdateTb = function (tissueBank) {
        var response = $http({
            method: "POST",
            url: "/api/TissueBankApi",
            data: tissueBank,
            dataType: "json"
        });
        return response;
    }

    this.deleteTissueBank = function (id) {
        var response = $http({
            method: "POST",
            url: "/TissueBank/DeleteTissueBank/",
            params: {
                id: JSON.stringify(id)
            }
        });
        return response;

    };


});

app.service("ProductMasterService", function ($http) {

    this.GetAllProductMaster = function (productMasterInquiryDTO) {
        var response = $http({
            method: 'GET',
            url: 'http://allocat.net/Webapi/api/ProductMasterApi/GetProductMasters/',
            params: productMasterInquiryDTO
        });
        console.log(response);
        return response;
    };

    this.getProductMasterById = function (ProductMasterId) {
        var response = $http({
            method: "get",
            url: "http://allocat.net/Webapi/api/ProductMaster/",
            params: {
                ProductMasterId: ProductMasterId
            }
        });
        return response;
    }

    this.AddUpdateTb = function (tissueBank) {
        var response = $http({
            method: "POST",
            url: "http:///api/TissueBankApi",
            data: tissueBank,
            dataType: "json"
        });
        return response;
    }

    //this.UpdateTb = function (tissueBank) {
    //    var response = $http({
    //        method: "POST",
    //        url: "/api/TissueBankApi",
    //        data: tissueBank,
    //        dataType: "json"
    //    });
    //    return response;
    //}

    this.deleteTissueBank = function (id) {
        //var response = $http({
        //    method: 'DELETE',
        //    url: '/TissueBank/DeleteTissueBank/' + id,
        //});

        var response = $http({
            method: "POST",
            url: "/TissueBank/DeleteTissueBank/",
            params: {
                id: JSON.stringify(id)
            }
        });
        return response;

    };


});

app.service("DomainScopeService", function ($http) {

    this.getAllDomainScope = function () {
        var response = $http({
            method: 'Get',
            url: 'http://allocat.net/Webapi/api/DomainScope/',
        });
        return response;
    };
});

app.service("MsgService", function () {
    this.makeMessage = function (MessageArray) {
        var errStr = ''
        for (var i = 0; i < MessageArray.length; i++) {
            if (errStr == '') {
                errStr = MessageArray[i];
            }
            else {
                errStr = errStr + '<br/>' + MessageArray[i];
            }
        }
        return errStr;
    }
});