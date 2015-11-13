'use strict';

var app = angular.module('myApp', [])
  app.config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/userList', {templateUrl: 'partials/userList.tpl', controller: 'userList'});
    $routeProvider.otherwise({redirectTo: '/userList'});
  }]);
 

