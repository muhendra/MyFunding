(function () {
    "use strict"
    window.app.controller("RegisteredAccountController", RegisteredAccountController);
    
    RegisteredAccountController.$inject = ["$scope", "alerts", "RegisteredAccountService"];
    function RegisteredAccountController($scope, alerts, RegisteredAccountService) {
        var vm = this;
        vm.searchParams = {};
        vm.period = new Date();
        vm.searchParams.period = vm.period;
        vm.search = function(){
            vm.searchParams.period = vm.period;
            vm.refreshData();
        }

        RegisteredAccountService.getDepartment()
        .then(function (response) {
            vm.department = response;
        });


        vm.update = function () {
            vm.searchParams.period = vm.period;
            RegisteredAccountService.Update(vm.searchParams).then(function (response) {
                alert("Success");
                vm.refreshData();
            }).catch(function (response) {
                if (response.data.errorMessage) {
                    alert("There was a problem saving data : <br/>" + response.data.errorMessage + "<br/>Please try again.");
                } else {
                    alert("There was a problem saving data. Please try again.");
                }
            });
        }

        vm.tableActions = {
            onDelete: function (data) {
                var params = { Id: data.id };
                var txt;
                var r = confirm("Are You Sure Want To Delete This Data?");
                if (r == true) {
                    RegisteredAccountService.Delete(params).then(function (response) {
                        alert("Success");
                        vm.refreshData();
                    }).catch(function (response) {
                        if (response.data.errorMessage) {
                            alert("There was a problem saving data : /n" + response.data.errorMessage + "/nPlease try again.");
                        } else {
                            alert("There was a problem saving data. Please try again.");
                        }
                    });
                } else {
                    txt = "You pressed Cancel!";
                }
            }
        };
        vm.GetPage = RegisteredAccountService.GetPage;
        vm.GetAll = RegisteredAccountService.All;

      //  vm.generate = function () {
      //  RegisteredAccountService.generate().then(function () {

      //  });
      //}
    }
})()