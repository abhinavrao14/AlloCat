app.controller("TbAddController", function ($scope, tbService, $http, $window) {
    //angular validation
    $scope.phoneNumber = /^\d{3}\d{3}\d{4}/;
    $scope.faxNumber = /^\d{3}\d{3}\d{4}/;
    $scope.validateEmail = /^[_a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/
    $scope.TbNameValidate = /^[A-Za-z\s]+$/;
    $scope.pname = /^[a-zA-Z]*$/;
    $scope.taxid = /^\d{3}\d{3}\d{3}/;
    $scope.dateOptions = {
        'starting-day': 1
    };
    $scope.url = /(http(s)?:\\)?([\w-]+\.)+[\w-]+[.com|.in|.org]+(\[\?%&=]*)?/;

    $scope.stateList = null;

    function GetStates() {
        $http({
            method: 'Get',
            url: '/State/GetStates'
        }).success(function (data, status, headers, config) {
            $scope.stateList = data;
        }).error(function (data, status, headers, config) {
            $scope.message = 'Unexpected Error';
        });
    }

    GetStates();

    GetCities = function (stateId) {
        //$scope.GetCities = function (stateId) {
        if ($scope.state != null) {
            //var stateId = $scope.state.StateId;
            //var stateId = stateId;
            if (stateId) {
                $http({
                    method: 'POST',
                    url: '/City/GetCities/',
                    data: JSON.stringify({ StateId: stateId })
                }).success(function (data, status, headers, config) {
                    if (data == "") {
                        message('info', 'Not available!', 'Cities are not available for state : <b>' + state.StateName+'</b>');
                        //alert("Cities not available for selected state");
                        $scope.cityList = null;
                    }
                    else {
                        $scope.cityList = data;
                        //$scope.city = { CityID: 14 };
                    }
                }).error(function (data, status, headers, config) {
                    $scope.message = 'Unexpected Error';
                    $scope.cityList = null;
                });
            }
            else {
                $scope.cityList = null;
            }
        }
        else {
            //alert("Please select a state");
            $scope.cityList = null;
        }
    }

    $scope.GetCities = function (stateId) {
        GetCities(stateId);
    };

    $scope.AddUpdateTb = function (TissueBankId) {
        var ret = "";

        var tissueBank = {
            TissueBankName: $scope.TissueBankName,
            ContactPersonName: $scope.ContactPersonName,
            ContactPersonNumber: $scope.ContactPersonNumber,
            TissueBankEmailId: $scope.TissueBankEmailId,
            BusinessURL: $scope.BusinessURL,
            IsMobileVerified: $scope.IsMobileVerified,
            IsEmailVerified: $scope.IsEmailVerified,
            TissueBankAddress: $scope.TissueBankAddress,
            CityId: $scope.city.CityID,
            TissueBankStateLicense: $scope.TissueBankStateLicense,
            CustomerServiceLandLineNumber: $scope.CustomerServiceLandLineNumber,
            FaxNumber: $scope.FaxNumber,
            TaxPayerId: $scope.TaxPayerId,
            AATBAccredationDate: $scope.AATBAccredationDate,
            IsAllocatMember: $scope.IsAllocatMember,
            IsAccountVerified: $scope.IsAccountVerified,
            IsActive: 1,
            CreatedBy: 1,
            LastModifiedBy: 1,
        };

        if (TissueBankId != null) {
            tissueBank.TissueBankId = TissueBankId;
            ret = "Tissue bank updated successfully.";
        }
        else {
            ret = "Tissue bank added successfully.";
        }

        //alert(tissueBank.TissueBankId);

        var response = tbService.AddUpdateTb(tissueBank);
        response.success(function (data, status, headers, config) {
            message('success', 'Success!', ret)
            //alert(ret);
            $window.location.href = '/TissueBank';
            ClearFields();
        }).error(function (data, status, headers, config) {
            message('error', 'Error!', data)
            //alert(data);
        });
    }
    function getAllTissueBank() {
        $http({
            method: 'Get',
            url: '/api/TissueBankApi/',
        }).success(function (data, status, headers, config) {
        //$http.get("http://localhost:55308/api/TissueBankApi")
            //.success(function (data, status, headers, config) {
                $scope.tissueBankList = data;
            }).error(function (data, status, headers, config) {
                message('error', 'Error!', data)
                //alert(data);
            });
    }

    function ClearFields() {
        $scope.TissueBankId = "";
        $scope.TissueBankName = "";
        $scope.ContactPersonName = "";
        $scope.ContactPersonNumber = "";
        $scope.TissueBankEmailId = "";
        $scope.BusinessURL = "";
        $scope.Password = "";
        $scope.IsMobileVerified = "";
        $scope.IsEmailVerified = "";
        $scope.TissueBankAddress = "";
        $scope.CityId = "";
        $scope.TissueBankStateLicense = "";
        $scope.CustomerServiceLandLineNumber = "";
        $scope.FaxNumber = "";
        $scope.TaxPayerId = "";
        $scope.AATBAccredationDate = "";
        $scope.IsAllocatMember = "";
        $scope.IsAccountVerified = "";
        $scope.CreatedDate = "";
        $scope.CreatedBy = "";
        $scope.LastModifiedDate = "";
        $scope.LastModifiedBy = "";

        $scope.city = null;
        $scope.state = { StateId: 0 };
    }

    editTissueBank = function (id) {
        var response = tbService.getTissueBankById(parseInt(id));

        response.success(function (data, status, headers, config) {
            $scope.TissueBankId = data[0].TissueBankId;
            $scope.TissueBankName = data[0].TissueBankName
            $scope.ContactPersonName = data[0].ContactPersonName
            $scope.ContactPersonNumber = data[0].ContactPersonNumber
            $scope.TissueBankEmailId = data[0].TissueBankEmailId
            $scope.BusinessURL = data[0].BusinessURL
            $scope.Password = data[0].Password
            $scope.IsMobileVerified = data[0].IsMobileVerified
            $scope.IsEmailVerified = data[0].IsEmailVerified
            $scope.TissueBankAddress = data[0].TissueBankAddress
            $scope.CityId = data[0].CityId
            $scope.TissueBankStateLicense = data[0].TissueBankStateLicense
            $scope.CustomerServiceLandLineNumber = data[0].CustomerServiceLandLineNumber
            $scope.FaxNumber = data[0].FaxNumber
            $scope.TaxPayerId = data[0].TaxPayerId
            $scope.AATBAccredationDate = data[0].AATBAccredationDate
            $scope.IsAllocatMember = data[0].IsAllocatMember
            $scope.IsAccountVerified = data[0].IsAccountVerified
            $scope.CreatedDate = data[0].CreatedDate
            $scope.CreatedBy = data[0].CreatedBy
            $scope.LastModifiedDate = data[0].LastModifiedDate
            $scope.LastModifiedBy = data[0].LastModifiedBy

            var stateResponse = tbService.getStateId(data[0].CityId)

            stateResponse
            .success(function (data1, status, headers, config) {
                $scope.state = { StateId: data1 };
                GetCities(data1);
                $scope.city = { CityID: data[0].CityId };
            }).error(function (data1, status, headers, config) {
                message('error', 'Error!', data1)
                //alert(data1);
            });

        }).error(function (data, status, headers, config) {
            message('error', 'Error!', data)
            //alert(data);
        });
    }

    var editId = document.getElementById("TissueBankId").value;

    if (editId != "") {
        editTissueBank(editId);
    }

    $scope.ListTissueBank = function () {
        $window.location.href = '/TissueBank/Index';
    }

    $scope.Reset = function () {
        ClearFields();
    };

    function message(type, title, content) {
        var notify = {
            type: type,
            title: title,
            content: content
        };
        $scope.$emit('notify', notify);
    }
});

app.controller("TbListController", function ($scope, tbService, $http, $window) {
    $scope.tissueBankList = null;

    $scope.AddTissueBank = function () {
        $window.location.href = '/TissueBank/Add';
    }

    function getAllTissueBank() {
        $http.get("/api/TissueBankApi")
            .success(function (data, status, headers, config) {
                $scope.tissueBankList = data;
            }).error(function (data, status, headers, config) {
                //alert(data);
                message('error','Error!',data)
            });
    }
    getAllTissueBank();

    $scope.deleteTissueBank = function (tissueBank) {
        var deleteTissueBank = $window.confirm('Do you want to delete this tissue bank permanently?');

        if (deleteTissueBank) {
            var response = tbService.deleteTissueBank(tissueBank.TissueBankId);

            response.success(function (data, status, headers, config) {
                getAllTissueBank();
                message('success', 'Tissue bank deleted successfully!', 'Tissue bank :' + tissueBank.TissueBankName + ' is deleted permanently.');
                //alert("Tissue bank deleted successfully.")
            }).error(function (data, status, headers, config) {
                message('error', 'Error!', data)
                //alert(data)
            });
        }
    }

    $scope.getTissueBankById = function (tissueBank) {
        $scope.showModal = false;
        var response = tbService.getTissueBankById(tissueBank.TissueBankId);
        response.success(function (data, status, headers, config) {
            $scope.tissueBank = data[0];
            $scope.showModal = !$scope.showModal;
        }).error(function (data, status, headers, config) {
            message('error', 'Error!', data)
            //alert('Error in Getting tissue bank details')
        });
    }

    function message(type, title, content) {
        var notify = {
            type: type,
            title: title,
            content: content
        };
        $scope.$emit('notify', notify);
    }

});

app.controller('TbProductController', ['$window', '$scope', 'upload', '$http', '$timeout', 'uiGridConstants', '$filter', function ($window, $scope, upload, $http, $timeout, uiGridConstants, $filter) {
    $scope.currentPage = 1
   ,$scope.selectedTissueBank = ""
   , $scope.searchText = '',
    $scope.TotalTbNonOcularProduct = 0;

    $scope.PageSizes = [10, 20, 50, 100];
    $scope.PageSize = $scope.PageSizes[0];

    $scope.gridOptions = {
        enableColumnMenus: false,
        onRegisterApi: function (gridApi) {
            gridApi.core.on.rowsRendered($scope, function () {
                var shouldShow;
                columnWidth = 0;
                angular.forEach(gridApi.grid.columns, function (column) {
                    columnWidth += column.drawnWidth;
                });
                if (!isNaN(columnWidth) && columnWidth > gridApi.grid.gridWidth) {
                    shouldShow = uiGridConstants.scrollbars.ALWAYS;
                }
                else { shouldShow = uiGridConstants.scrollbars.NEVER; }
                if (shouldShow !== gridApi.grid.options.enableHorizontalScrollbar) {
                    gridApi.grid.options.enableHorizontalScrollbar = shouldShow;
                    gridApi.core.queueGridRefresh();
                }
            });
        }
    };

    $scope.reset = reset;

    function reset() {
        $scope.gridOptions.data = [];
        $scope.gridOptions.columnDefs = [];
        $scope.myFile = '';
        UploadedExcelFile = '';
    }


    $scope.tissueBankList = null;
    //do ........................
    function getTissueBank() {
        $http({
            method: 'Get',
            url: '/api/TissueBankApi'
        }).success(function (data, status, headers, config) {
            $scope.tissueBankList = data;
        }).error(function (data, status, headers, config) {
            message('error', 'Error!', data)
            //alert('Unexpected Error');
        });
    }

    getTissueBank();

    $scope.tissueBank = { TissueBankId: 0 };

    $scope.doUpload = function (myFile) {
        console.log($scope.tissueBank);

        if ($scope.tissueBank.TissueBankId != 0) {
            upload({
                url: '/api/TissueBankProductExcelUpload',
                method: 'POST',
                data: {
                    UploadedExcelFile: $window.UploadedExcelFile
                },
                params: {
                    id: JSON.stringify($scope.tissueBank.TissueBankId)
                },
                headers: {
                    'Content-Type': undefined
                }
            }).then(
              function (response) {
                  message('info', 'Attention', response.data)
                  //alert(response.data);

                  //resetting data grid
                  $scope.gridOptions.data = [];
                  $scope.gridOptions.columnDefs = [];
                  $scope.myFile = '';
                  UploadedExcelFile = '';

                  //setting to selected index
                  $scope.tissueBank = { TissueBankId: 0 };
              },
              function (response) {
                  message('error', 'Error!', response.data.MessageDetail)

                  //alert(response.data.MessageDetail);
              }
            );
        }
        else {
            message('warning', 'Attention!', 'Please select a tissue bank')
                  
            //alert("Please select a tissue bank");
        }
    }

    $scope.tbProductList = null;

    $scope.getTissueBankProductByTissueBankProductId = function (tbProduct) {
        $scope.selectedTissueBank = tbProduct;
        $scope.showModal = false;
        $http({
            method: "GET",
            url: "/TissueBankProduct/GetTissueBankProductByTissueBankProductId/",
            params: {
                tissueBankProductId: tbProduct.TissueBankProductId,
            }
        }).success(function (data, status, headers, config) {
            $scope.tbProductDetail = data[0];
            $scope.showModal = !$scope.showModal;
            console.log(data);
        }).error(function (data, status, headers, config) {
            message('error', 'Error!', data)
            //alert(data);
        });
    };

    $scope.deleteTissueBankProduct = function (tbProduct) {
        var deleteTissueBankProduct = $window.confirm('Do you want to delete this product permanently?');

        if (deleteTissueBankProduct) {
            $http({
                method: "POST",
                url: "/TissueBankProduct/DeleteTissueBankProduct/",
                params: {
                    tissueBankProductId: JSON.stringify(tbProduct.TissueBankProductId)
                }
            }).success(function (data, status, headers, config) {
                $scope.getTissueBankProductByTissueBankId();
                message('success', 'Deleted successfully!', 'Product : '+tbProduct.ProductCode+' is deleted permanently.');
                //alert("Tissue bank product deleted successfully.")
            }).error(function (data, status, headers, config) {
                message('error', 'Error!', data)
                //alert(data)
            });
        }
    }


    $scope.search = function () {
        getTissueBankProductByTissueBankId($scope.searchText, 1, $scope.PageSize);
        $scope.currentPage = 1;
        $scope.PageSize = $scope.PageSizes[0];
    }

    //new
    $scope.getTissueBankProductByTissueBankId = function () {
            getTissueBankProductByTissueBankId('', 1, $scope.PageSize);
    };

    function getTissueBankProductByTissueBankId(searchText, currentPage, PageSize) {
      //  $scope.showModal = false;
        if ($scope.tissueBank != null) {
            $http({
                method: 'GET',
                url: '/api/TissueBankProductAPI/',
                params: {
                    tissueBankId: $scope.tissueBank.TissueBankId,
                    Param_SearchBy: searchText,
                    Param_CurrentPage: currentPage,
                    Param_PageSize: PageSize,
                }
            }).success(function (data, status, headers, config) {
                if (data.length > 0) {
                    $scope.tbProductList = data;
                    //get total number of products
                    getTotalTissueBankProduct();
                    console.log(data);
                }
                else {
                    message('warning', 'No Product Available!', 'There are no products available for tissue bank : <b>' + $scope.tissueBank.TissueBankName + '</b>.');
                    $scope.tbProductList = null;
                    $scope.TotalTbNonOcularProduct = 0;
                }
            }).error(function (data, status, headers, config) {
                message('error', 'Error!', data)
                //alert(data);
            });
        }
        else {
            message('warning','No Tissue Bank Selected!','Please select a tissue bank');
            $scope.tbProductList = null;
            $scope.TotalTbNonOcularProduct = 0;
        }
    };

    //pagination
    $scope.getPreviousPage = function () {
        $scope.currentPage = $scope.currentPage - 1;
        getTissueBankProductByTissueBankId($scope.searchText, $scope.currentPage, $scope.PageSize);
    };

    $scope.getNextPage = function () {
        $scope.currentPage = $scope.currentPage + 1;
        getTissueBankProductByTissueBankId($scope.searchText, $scope.currentPage, $scope.PageSize);
    };

    function message(type,title,content)
    {
        var notify = {
            type: type,
            title: title,
            content: content
        };
        $scope.$emit('notify', notify);
    }

    function getTotalTissueBankProduct() {
        $http({
            method: 'Get',
            url: '/api/TissueBankProductAPI/GetTotalTissueBankProduct/',
            params: {
                tissueBankId: $scope.tissueBank.TissueBankId,
                searchText: $scope.searchText,
            }
        }).success(function (data, status, headers, config) {
            $scope.TotalTbNonOcularProduct = data;
            console.log(data);
        }).error(function (data, status, headers, config) {
            $scope.TotalTbNonOcularProduct = 0;
            message('error', 'Error!', data)
            //alert('Unexpected Error');
        });
    }


    $scope.PageSizeChanged = function () {
        $scope.currentPage = 1;
        getTissueBankProductByTissueBankId($scope.searchText, $scope.currentPage, $scope.PageSize);
    };
}]);

app.controller("ProductMasterController", function ($scope, ProductMasterService,DomainScopeService, $http, $window) {
    $scope.DomainScopeList = null;
    $scope.ProductMasterViewModelList = null;

    function GetDomainScopes() {
        var response = DomainScopeService.getAllDomainScope();
        
        response
        .success(function (data, status, headers, config) {
            $scope.DomainScopeList = data;
        }).error(function (data, status, headers, config) {
            $scope.message = 'Unexpected Error';
        });
    }

   // GetDomainScopes();

   

    function GetAllProductMaster() {
        var productMasterInquiry = new Object();

        $scope.ProductMasterId = "";
        $scope.ProductMasterName = "";

        $scope.PageSize = 15;
        $scope.SortDirection = "ASC";
        $scope.SortExpression = "ProductMasterName";
        $scope.CurrentPageNumber = 1;

        productMasterInquiry.ProductMasterId = $scope.ProductMasterId;
        productMasterInquiry.ProductMasterName = $scope.ProductMasterName;
        productMasterInquiry.CurrentPageNumber = $scope.CurrentPageNumber;
        productMasterInquiry.SortExpression = $scope.SortExpression;
        productMasterInquiry.SortDirection = $scope.SortDirection;
        productMasterInquiry.PageSize = $scope.PageSize;

        var response = ProductMasterService.GetAllProductMaster(productMasterInquiry);

        response
        .success(function (data, status, headers, config) {
            $scope.ProductMasterViewModelList = data.ProductMasters;
            console.log(data.ProductMasters);
        }).error(function (data, status, headers, config) {
           // message('error', 'Error!', data)
            console.log(data);
        });
    }

    GetAllProductMaster();

    //$scope.AddUpdateTb = function (TissueBankId) {
    //    var ret = "";

    //    var tissueBank = {
    //        TissueBankName: $scope.TissueBankName,
    //        ContactPersonName: $scope.ContactPersonName,
    //        ContactPersonNumber: $scope.ContactPersonNumber,
    //        TissueBankEmailId: $scope.TissueBankEmailId,
    //        BusinessURL: $scope.BusinessURL,
    //        IsMobileVerified: $scope.IsMobileVerified,
    //        IsEmailVerified: $scope.IsEmailVerified,
    //        TissueBankAddress: $scope.TissueBankAddress,
    //        CityId: $scope.city.CityID,
    //        TissueBankStateLicense: $scope.TissueBankStateLicense,
    //        CustomerServiceLandLineNumber: $scope.CustomerServiceLandLineNumber,
    //        FaxNumber: $scope.FaxNumber,
    //        TaxPayerId: $scope.TaxPayerId,
    //        AATBAccredationDate: $scope.AATBAccredationDate,
    //        IsAllocatMember: $scope.IsAllocatMember,
    //        IsAccountVerified: $scope.IsAccountVerified,
    //        IsActive: 1,
    //        CreatedBy: 1,
    //        LastModifiedBy: 1,
    //    };

    //    if (TissueBankId != null) {
    //        tissueBank.TissueBankId = TissueBankId;
    //        ret = "Tissue bank updated successfully.";
    //    }
    //    else {
    //        ret = "Tissue bank added successfully.";
    //    }

    //    //alert(tissueBank.TissueBankId);

    //    var response = tbService.AddUpdateTb(tissueBank);
    //    response.success(function (data, status, headers, config) {
    //        message('success', 'Success!', ret)
    //        //alert(ret);
    //        $window.location.href = '/TissueBank';
    //        ClearFields();
    //    }).error(function (data, status, headers, config) {
    //        message('error', 'Error!', data)
    //        //alert(data);
    //    });
    //}

    //function ClearFields() {
    //    $scope.TissueBankId = "";
    //    $scope.TissueBankName = "";
    //    $scope.ContactPersonName = "";
    //    $scope.ContactPersonNumber = "";
    //    $scope.TissueBankEmailId = "";
    //    $scope.BusinessURL = "";
    //    $scope.Password = "";
    //    $scope.IsMobileVerified = "";
    //    $scope.IsEmailVerified = "";
    //    $scope.TissueBankAddress = "";
    //    $scope.CityId = "";
    //    $scope.TissueBankStateLicense = "";
    //    $scope.CustomerServiceLandLineNumber = "";
    //    $scope.FaxNumber = "";
    //    $scope.TaxPayerId = "";
    //    $scope.AATBAccredationDate = "";
    //    $scope.IsAllocatMember = "";
    //    $scope.IsAccountVerified = "";
    //    $scope.CreatedDate = "";
    //    $scope.CreatedBy = "";
    //    $scope.LastModifiedDate = "";
    //    $scope.LastModifiedBy = "";

    //    $scope.city = null;
    //    $scope.state = { StateId: 0 };
    //}

    //editTissueBank = function (id) {
    //    var response = tbService.getTissueBankById(parseInt(id));

    //    response.success(function (data, status, headers, config) {
    //        $scope.TissueBankId = data[0].TissueBankId;
    //        $scope.TissueBankName = data[0].TissueBankName
    //        $scope.ContactPersonName = data[0].ContactPersonName
    //        $scope.ContactPersonNumber = data[0].ContactPersonNumber
    //        $scope.TissueBankEmailId = data[0].TissueBankEmailId
    //        $scope.BusinessURL = data[0].BusinessURL
    //        $scope.Password = data[0].Password
    //        $scope.IsMobileVerified = data[0].IsMobileVerified
    //        $scope.IsEmailVerified = data[0].IsEmailVerified
    //        $scope.TissueBankAddress = data[0].TissueBankAddress
    //        $scope.CityId = data[0].CityId
    //        $scope.TissueBankStateLicense = data[0].TissueBankStateLicense
    //        $scope.CustomerServiceLandLineNumber = data[0].CustomerServiceLandLineNumber
    //        $scope.FaxNumber = data[0].FaxNumber
    //        $scope.TaxPayerId = data[0].TaxPayerId
    //        $scope.AATBAccredationDate = data[0].AATBAccredationDate
    //        $scope.IsAllocatMember = data[0].IsAllocatMember
    //        $scope.IsAccountVerified = data[0].IsAccountVerified
    //        $scope.CreatedDate = data[0].CreatedDate
    //        $scope.CreatedBy = data[0].CreatedBy
    //        $scope.LastModifiedDate = data[0].LastModifiedDate
    //        $scope.LastModifiedBy = data[0].LastModifiedBy

    //        var stateResponse = tbService.getStateId(data[0].CityId)

    //        stateResponse
    //        .success(function (data1, status, headers, config) {
    //            $scope.state = { StateId: data1 };
    //            GetCities(data1);
    //            $scope.city = { CityID: data[0].CityId };
    //        }).error(function (data1, status, headers, config) {
    //            message('error', 'Error!', data1)
    //            //alert(data1);
    //        });

    //    }).error(function (data, status, headers, config) {
    //        message('error', 'Error!', data)
    //        //alert(data);
    //    });
    //}

    //var editId = document.getElementById("TissueBankId").value;

    //if (editId != "") {
    //    editTissueBank(editId);
    //}

    //$scope.ListTissueBank = function () {
    //    $window.location.href = '/TissueBank/Index';
    //}

    //$scope.Reset = function () {
    //    ClearFields();
    //};

    function message(type, title, content) {
        var notify = {
            type: type,
            title: title,
            content: content
        };
        $scope.$emit('notify', notify);
    }
});

