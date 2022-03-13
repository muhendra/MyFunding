(function() {
    'use strict';

    /*global angular */
    /*
     jQuery UI Datepicker plugin wrapper
    
     @note If ≤ IE8 make sure you have a polyfill for Date.toISOString()
     @param [ui-date] {object} Options to pass to $.fn.datepicker() merged onto uiDateConfig
     */
//custom datepicker
//angular.module('ui.date', [])
//	.constant('uiDateConfig', {})
//    .directive('uiDate', ['uiDateConfig', '$timeout', function (uiDateConfig, $timeout) {
//        'use strict';
//        var options;
//        options = {};
//        angular.extend(options, uiDateConfig);
//        return {
//            require: '?ngModel',
//            link: function (scope, element, attrs, controller) {
//                var getOptions = function () {
//                    return angular.extend({}, uiDateConfig, scope.$eval(attrs.uiDate));
//                };
//                var initDateWidget = function () {
//                    var showing = false;
//                    var opts = getOptions();

//                    // If we have a controller (i.e. ngModelController) then wire it up
//                    if (controller) {

//                        // Set the view value in a $apply block when users selects
//                        // (calling directive user's function too if provided)
//                        var _onSelect = opts.onSelect || angular.noop;
//                        opts.onSelect = function (value, picker) {
//                            scope.$apply(function () {
//                                showing = true;
//                                controller.$setViewValue(element.datepicker("getDate"));
//                                _onSelect(value, picker);
//                                element.blur();
//                            });
//                        };
//                        opts.beforeShow = function () {
//                            showing = true;
//                        };
//                        opts.onClose = function (value, picker) {
//                            showing = false;
//                        };
//                        element.on('blur', function () {
//                            if (!showing) {
//                                scope.$apply(function () {
//                                    element.datepicker("setDate", element.datepicker("getDate"));
//                                    controller.$setViewValue(element.datepicker("getDate"));
//                                });
//                            }
//                        });

//                        // Update the date picker when the model changes
//                        controller.$render = function () {
//                            var date = controller.$viewValue;
//                            if (angular.isDefined(date) && date !== null && !angular.isDate(date)) {
//                                throw new Error('ng-Model value must be a Date object - currently it is a ' + typeof date + ' - use ui-date-format to convert it from a string');
//                            }
//                            element.datepicker("setDate", date);
//                        };
//                    }
//                    // If we don't destroy the old one it doesn't update properly when the config changes
//                    element.datepicker('destroy');
//                    // Create the new datepicker widget
//                    element.datepicker(opts);
//                    if (controller) {
//                        // Force a render to override whatever is in the input text box
//                        controller.$render();
//                    }
//                };
//                // Watch for changes to the directives options
//                scope.$watch(getOptions, initDateWidget, true);
//            }
//        };
//    }
//    ])

//.constant('uiDateFormatConfig', '')
//.directive('uiDateFormat', ['uiDateFormatConfig', function (uiDateFormatConfig) {
//    var directive = {
//        require: 'ngModel',
//        link: function (scope, element, attrs, modelCtrl) {
//            var dateFormat = attrs.uiDateFormat || uiDateFormatConfig;
//            if (dateFormat) {
//                // Use the datepicker with the attribute value as the dateFormat string to convert to and from a string
//                modelCtrl.$formatters.push(function (value) {
//                    if (angular.isString(value)) {
//                        return jQuery.datepicker.parseDate(dateFormat, value);
//                    }
//                    return null;
//                });
//                modelCtrl.$parsers.push(function (value) {
//                    if (value) {
//                        return jQuery.datepicker.formatDate(dateFormat, value);
//                    }
//                    return null;
//                });
//            } else {
//                // Default to ISO formatting
//                modelCtrl.$formatters.push(function (value) {
//                    if (angular.isString(value)) {
//                        return new Date(value);
//                    }
//                    return null;
//                });
//                modelCtrl.$parsers.push(function (value) {
//                    if (value) {
//                        return value.toISOString();
//                    }
//                    return null;
//                });
//            }
//        }
//    };
//    return directive;
//}]);




    window.app = angular.module('MyWeb', ['ngAnimate',
        'ui.bootstrap',
        'ui.grid',
        'ui.grid.pagination',
        'ui.grid.edit',
        'ui.grid.autoResize',
        'ui.grid.selection',
        'ui.grid.resizeColumns',
        'ui.grid.exporter',
        'ui.grid.cellNav',
        'ngMessages',
        'ng-bs3-datepicker',
        'timepickerPop',
        'number-input',
        'ngFileUpload',
        'fcsa-number',
        'angularModalService',
        'ngSanitize',
        'blockUI',
        'ui.tinymce']);

    //http://stackoverflow.com/questions/16964444/get-query-string-using-angularjs
    //ERROR LINK TIDAK BISA DI KLIK
    //window.app.config(['$locationProvider', function ($locationProvider) {
    //    //https://docs.angularjs.org/error/$location/nobase
    //    $locationProvider.html5Mode({
    //        enabled: true,
    //        requireBase: false
    //    });
    //}]);

    //http://aboutcode.net/2013/07/27/json-date-parsing-angularjs.html
    window.app.config(["$httpProvider", "$provide", function ($httpProvider, $provide) {
	    $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
	    $httpProvider.defaults.transformResponse.push(function (responseData) {
	        _convertDateStringsToDates(responseData);
	        return responseData;
	    });
        //https://github.com/angular-ui/ui-grid/issues/4214
	    $provide.decorator('uiGridExporterService', function ($delegate, $filter) {
	        $delegate.formatFieldAsCsv = function (field) {
	            if (field.value == null) { // we want to catch anything null-ish, hence just == not ===
	                return '';
	            }
	            if (typeof (field.value) === 'number') {
	                return field.value;
	            }
	            if (typeof (field.value) === 'boolean') {
	                return (field.value ? 'TRUE' : 'FALSE');
	            }
	            if (typeof (field.value) === 'string') {
	                //Anyone using this decorator with text values which may have commas will want to surround text fields with quotes.
	                if (!isNaN(field.value)) //if numeric then add single quote
	                    return '"\'' + field.value + '"';

	                return '"' + field.value + '"';
	                //return field.value;
	            }
	            if (field.value instanceof Date) {
	                //return $filter('date')(field.value, 'dd/MM/yyyy');
	                return $filter('dateFormat')(field.value);
	            }

	            return JSON.stringify(field.value);
	        };

	        return $delegate
	    });
	}]);
    http://stackoverflow.com/questions/33148695/identify-angular-js-ajax-calls-in-asp-net-mvc-code
	//window.app.config(['$httpProvider', function ($httpProvider) {
	//    $httpProvider.defaults.headers.common["X-Requested-With"] = 'true';
	//}]);

	window.app.factory("DataService", ['$http', '$location',
    function ($http, $q, $location) {

        var serviceBase = MyApplication.rootPath;
        var obj = {};

        obj.get = function (q) {            
            return $http.get(serviceBase + q).then(function (results) {
                return results.data;
            });
        };

        obj.post = function (q, object) {
            return $http.post(serviceBase + q, object).then(function (results) {
                return results.data;
            });
        };

        obj.put = function (q, object) {
            return $http.put(serviceBase + q, object).then(function (results) {
                return results.data;
            });
        };

        obj.delete = function (q) {
            return $http.delete(serviceBase + q).then(function (results) {
                return results.data;
            });
        };

        return obj;

    }]);

	window.app.factory("DateService", ["$http",
               function ($http) {
                   // Expect input as d/m/y
                   var getDatepickerOptions = function (s) {
                       return {
                           format: 'dd-MM-yyyy'
                           ,language: 'id'
                           ,autoclose: true
                           ,weekStart: 0
                       }
                   };                  
                   
                   return {
                       getDatepickerOptions: getDatepickerOptions
                     
                   }
               }]);

	window.app.filter('startFrom', function () {
	    return function (input, start) {
	        if (input) {
	            start = +start; //parse to int
	            return input.slice(start);
	        }
	        return [];
	    }
	});
    //http://www.dwmkerr.com/the-only-angularjs-modal-service-youll-ever-need/
    //http://www.bennadel.com/blog/2806-creating-a-simple-modal-system-in-angularjs.htm
	window.app.factory("MessageBox", ["ModalService",
               function (ModalService) {

                   var show = function (response) {
                       if(response != undefined)
                       {
                           if (typeof response === 'string') {
                               success("INFO", response, false);
                           }
                           else if(response.data != undefined)
                           {
                               if(response.data.errorMessages != undefined && response.data.errorMessages.length > 1)
                               {
                                   var errorMessages = "";
                                   for (var i = 0; i < response.data.errorMessages.length; i++) {
                                       errorMessages += response.data.errorMessages[i] + '</br>';
                                   }                                                                    
                                   error("ERROR", errorMessages);
                               } else if (response.data.errorMessage != undefined) {
                                   error("ERROR", response.data.errorMessage);
                               }
                           } else if (response.statusText != undefined) {
                               success("INFO", response.statusText, false);
                           }
                           
                       }
                   };

                   var confirm = function (title, message, callbackFunction) {
                       success(title, message, true, callbackFunction);
                       //success("INFO", "test");
                   };                   

                   var success = function (title, message, isConfirm, callbackFunction) {
                       ModalService.showModal({
                           templateUrl: 'modalsuccess.html',
                           controller: "ModalController",
                           inputs: {
                               title: title,
                               message: message,
                               isConfirm: isConfirm
                           }
                       }).then(function (modal) {
                           modal.element.modal();
                           modal.close.then(function (result) {
                               //$scope.message = "You said " + result;
                               if (isConfirm && result && callbackFunction !== undefined) {
                                   callbackFunction();
                               }
                           });
                       });
                   };

                   var error = function (title, message) {
                       ModalService.showModal({
                           templateUrl: 'modalerror.html',
                           controller: "ModalController",
                           inputs: {
                               title: title,
                               message: message,
                               isConfirm: false
                           }
                       }).then(function(modal) {
                           modal.element.modal();
                           modal.close.then(function(result) {
                               //$scope.message = "You said " + result;
                           });
                       });
                   };

                   return {
                       show: show,
                       confirm: confirm,
                       success: success,
                       error: error

                   }
               }]);

	window.app.controller('ModalController', function ($scope,title,message,isConfirm,close) {
	    $scope.title = title;
	    $scope.message = message;
	    $scope.isConfirm = isConfirm;
	    $scope.close = function (result) {
	        close(result, 500); // close, but give 500ms for bootstrap to animate
	    };

	});

    //http://creative-punch.net/2014/04/preserve-html-text-output-angularjs/
	window.app.filter('unsafe', function ($sce) {
	    return function (val) {
	        return $sce.trustAsHtml(val);
	    };
	});

    //http://stackoverflow.com/questions/26383507/listen-for-form-submit-event-in-directive
	window.app.directive('form', function () {
	    return {
	        restrict: 'E',
	        link: function (scope, elem) {
	            elem.on('submit', function () {
	                scope.$broadcast('form:submit');
	            });
	        }
	    };
	});

    //http://www.matheuslima.com/angularjs-custom-validation-with-directives/
    //http://stackoverflow.com/questions/12581439/how-to-add-custom-validation-to-an-angularjs-form
	window.app.directive('customValidation', function () {	   
	    return {
	        restrict: 'A',
	        //require: 'ngModel',
	        require: '^form',
	        scope: {
	            ngModel: '=ngModel'
                , ngForm: '=ngForm'
                , elementName: '@'
                , validateFunction: '=validateFunction'
	        },
	        link: function ($scope, $element, $attrs, form) {
	            //http://stackoverflow.com/questions/17618318/pass-form-to-directive
	            //http://stackoverflow.com/questions/12581439/how-to-add-custom-validation-to-an-angularjs-form

	            $scope.checkValidation = function () {
	                if (typeof $scope.ngForm !== 'undefined') {
	                    //if (typeof $scope.ngForm.$$parentForm[$scope.elementName] !== 'undefined') {
	                    if ($scope.validateFunction()) { //if not valid
	                        $scope.ngForm.$setValidity($scope.elementName, false);
	                    } else { // if valid
	                        $scope.ngForm.$setValidity($scope.elementName, true);
	                    }
	                    $scope.$applyAsync();
	                    //}	                    
	                }
	            };

	            $scope.$on('form:submit', function () {
	                //form.$setPristine();
	                $scope.checkValidation();
	            });

	            $scope.$watch("ngModel", function () {
	                $scope.checkValidation();
	            });	            
	        }
	    }
	});
    http://nadeemkhedr.com/angularjs-validation-reusable-component/
	window.app.directive('submitValid', function ($parse) {
	    return {
	        require: 'form',
	        link: function (scope, formElement, attributes, form) {
	            form.attempt = false;
	            formElement.bind('submit', function (event) {
	                form.attempt = true;
	                if (!scope.$$phase) scope.$apply();

	                var fn = $parse(attributes.submitValid);

	                if (form.$valid) {
	                    scope.$apply(function () {
	                        fn(scope, { $event: event });
	                    });
	                }
	            });
	        }
	    };
	});
    //http://www.matheuslima.com/angularjs-form-validation-after-submit-directive/
    window.app.directive('formSubmit', function ($timeout) {
        return {
            restrict: 'A',
            scope: {
                formSubmit: '&'
            },
            require: '^form',
            link: function (scope, element, attrs, formCtrl) {
                element.on('submit', function () {

                    scope.$broadcast('form:submit');

                    $timeout(function () {
                        if (formCtrl.$valid) {
                            scope.formSubmit();
                        }
                        else {
                            // service to display invalid inputs
                        }
                    }, 1000);                 
                    
                });
            }
        }
    });
    //http://stackoverflow.com/questions/17470790/how-to-use-a-keypress-event-in-angularjs
    window.app.directive('myEnter', function () {
        return function (scope, element, attrs) {
            element.bind("keydown keypress", function (event) {
                if (event.which === 13) {
                    scope.$apply(function () {
                        scope.$eval(attrs.myEnter);
                    });

                    event.preventDefault();
                }
            });
        };
    });
    //http://stackoverflow.com/questions/17922557/angularjs-how-to-check-for-changes-in-file-input-fields
    window.app.directive('customOnChange', function () {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                var onChangeHandler = scope.$eval(attrs.customOnChange);
                element.bind('change', onChangeHandler);
            }
        };
    });
    //http://stackoverflow.com/questions/17922557/angularjs-how-to-check-for-changes-in-file-input-fields
    window.app.directive('bindFile', [ "$timeout", function () {
        return {
            require: "ngModel",
            restrict: 'A',
            scope: {
                title: '@',
                columns: '=?',
                ngModel: '=?',
                ngChange: '&',
                ngDisabled: '=?',
                uploadData: '=?',
                disableHeaders: '=?',
                range: '=?',
                where: '=?'
            },
            controller: function ($scope, $timeout) {
                var vm = this;

                vm.headers = "true";
                if ($scope.disableHeaders !== undefined) {
                    vm.headers = "false";
                }
                vm.range = "";
                if ($scope.range !== undefined && $scope.range !== '') {
                    vm.range = ',range:"' + $scope.range + '"';
                }
                vm.where = "";
                if ($scope.where !== undefined && $scope.where !== '') {
                    vm.where = ' WHERE ' + $scope.where ;
                }

                vm.uploadFile = function ($event) {
                    var files = event.target.files;
                    var query = 'SELECT * FROM FILE(?,{headers:' + vm.headers + vm.range + '})' + vm.where;

                    if ($scope.columns !== undefined && $scope.columns !== '')
                        query = 'SELECT ' + $scope.columns + ' FROM FILE(?,{headers:' + vm.headers + vm.range + '})' + vm.where;

                    alasql(query, [event], function (data) {
                        $timeout(function () {
                            $scope.uploadData = data;                            
                        });
                        //$scope.uploadData = data;     //  eData contains the JSON representation of the Excel sheet rows
                        //$scope.$apply();
                    });
                };
            },
            controllerAs: 'vm',
            link: function ($scope, el, attrs, ngModel) {
                var onChangeHandler = $scope.$eval(attrs.onChange);
                //el.bind('change', onChangeHandler);
                el.bind('change', function (event) {

                    onChangeHandler();

                    ngModel.$setViewValue(event.target.files[0]);                    

                    $scope.$apply();
                    
                });
            
                $scope.$watch(function () {
                    return ngModel.$viewValue;
                }, function (value) {
                    if (!value) {
                        el.val("");
                    }
                });
            }            
        };
    }]);

})();