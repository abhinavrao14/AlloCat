﻿//app.service("TBRegistrationService", function ($http) {

//    this.GetStates = function () {
//        var response = $http({
//            method: 'Get',
//            url: 'http://localhost:63744/api/State'
//        });
//        return response;
//    };
//});


//app.service("ProductDetailService", function ($http) {

//    this.GetTissueBankProductsByProductMasterId = function (TissueBankId, ProductMasterId) {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/ProductApi",
//            params: {
//                TissueBankId: TissueBankId,
//                ProductMasterId: ProductMasterId
//            }
//        });
//        return response;
//    };


//    this.saveTissueBankProducts = function (Products) {
//        var response = $http({
//            url: "http://allocat.net/Webapi/api/ProductApi",
//            dataType: 'json',
//            method: 'POST',
//            data: Products,
//            headers: {
//                "Content-Type": "application/json"
//            }
//        });
//        return response;
//    };

//    //this.saveTissueBankProducts = function (mydate) {
//    //    var response = $http({
//    //        url: "http://allocat.net/Webapi/api/ProductApi",
//    //        dataType: 'json',
//    //        method: 'POST',
//    //        params: { mydate: mydate },
//    //        headers: {
//    //            "Content-Type": "application/json"
//    //        }
//    //    });
//    //    return response;
//    //};


//    this.GetPreservationTypes = function () {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/PreservationType"
//        });
//        return response;
//    };

//    this.GetSources = function () {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/Source"
//        });
//        return response;
//    };

//    this.GetProductSizes = function (ProductMasterId) {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/ProductSize",
//            params: {
//                ProductMasterId: ProductMasterId
//            }
//        });
//        return response;
//    };

//    this.GetProductTypes = function (ProductMasterId) {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/ProductType",
//            params: {
//                ProductMasterId: ProductMasterId
//            }
//        });
//        return response;
//    };
//});

//app.service("RFQService", function ($http) {

//    this.getRFQs = function (rfq_TissueBank_DTO) {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/RFQ",
//            params: rfq_TissueBank_DTO
//        });
//        return response;
//    };

//    this.GetRfqDetailByRequestForQuoteId = function (RequestForQuoteId) {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/RFQ",
//            params: { RequestForQuoteId: RequestForQuoteId }
//        });
//        return response;
//    };

//    this.GetRequestResponseByRequestForQuoteId = function (RequestForQuoteId) {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/RequestResponse",
//            params: { RequestForQuoteId: RequestForQuoteId }
//        });
//        return response;
//    };

//    this.RequestForQuote_Edit = function (RFQ_TissueBank_Edit_DTO) {
//        var response = $http({
//            url: "http://allocat.net/Webapi/api/RFQ",
//            dataType: 'json',
//            method: 'POST',
//            data: RFQ_TissueBank_Edit_DTO,
//            headers: {
//                "Content-Type": "application/json"
//            }
//        });
//        return response;
//    };

//});



//app.service("OrderService", function ($http) {

//    this.GetOrders = function (order_TissueBank_DTO) {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/Order",
//            params: order_TissueBank_DTO
//        });
//        return response;
//    };

//    this.GetOrderDetailByOrderId = function (OrderId) {
//        var response = $http({
//            method: "Get",
//            url: "http://allocat.net/Webapi/api/Order",
//            params: { OrderId: OrderId }
//        });
//        return response;
//    };

//    this.Order_Ack_Decline = function (order_Ack_Decline_DTO) {
//        var response = $http({
//            url: "http://allocat.net/Webapi/api/Order",
//            dataType: 'json',
//            method: 'POST',
//            data: order_Ack_Decline_DTO,
//            headers: {
//                "Content-Type": "application/json"
//            }
//        });
//        return response;
//    };

//});


//app.service("UserService", function ($http) {

//    this.GetUsers = function (user_DTO) {
//        var response = $http({
//            method: "Get",
//            url: "http://localhost:63744/api/User",
//            params: user_DTO
//        });
//        return response;
//    };
//});

//app.service("UserDetailService", function ($http) {

//    this.GetUserDetail = function (UserId, type) {
//        var response = $http({
//            method: "Get",
//            url: "http://localhost:63744/api/User",
//            params: { UserId: UserId, type: type }
//        });
//        return response;
//    };

//    this.GetUserRoles = function (UserId, type) {
//        var response = $http({
//            method: "Get",
//            url: "http://localhost:63744/api/User",
//            params: { UserId: UserId, type: type }
//        });
//        return response;
//    };

//    this.GetTissueBankRoles = function (type) {
//        var response = $http({
//            method: "Get",
//            url: "http://localhost:63744/api/Role",
//            params: { type: type }
//        });
//        return response;
//    };

//    this.SubmitUser = function (user_CUD_DTO) {
//        var response = $http({
//            url: "http://localhost:63744/api/User",
//            dataType: 'json',
//            method: 'POST',
//            data: user_CUD_DTO,
//            headers: {
//                "Content-Type": "application/json"
//            }
//        });
//        return response;
//    };
//});