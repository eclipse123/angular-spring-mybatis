'use strict';

/* Controllers */


//function MyCtrl1() {}
//MyCtrl1.$inject = [];
//
//
//function register($scope,$http) { 
//	$scope.name="hello world";
//	$scope.register = function(){
//		   
//	        var user = {name:$scope.name,age:$scope.age,password:$scope.password,email:$scope.email};
//	        console.log(path)
//	        $http(
//	        	{   method:'POST',
//	        		url:'http://localhost:8080/aps/addInfo.do',
//	        		params:user
//	        	}		
//	        ).success(function(response) {  
//	            $scope.ansInfo=response.a;
//	            });  
//	   }  
//}
//MyCtrl2.$inject = [];

//  var allapp = angular.module('myApp',[]);


  app.controller('register',function ($scope,$http) {
	   $scope.add=function(){
		   
		   
	        var user = {name:$scope.name,age:$scope.age,password:$scope.password,email:$scope.email};
	        $post(
	        	{   method:'POST',
	        		url:'user/addInfo.do',
	        		params:user
	        		
	        	}		
	        ).success(function(response) {  
//	            $scope.ansInfo=response.a;
	            });  
	   };  
		   

    });
  app.controller('userList',function ($scope,$http) {
//	  var items={};
	  $scope.init = function(){
		  $scope.name="";
		  $scope.age="";
		  $scope.password="";
		  $scope.email="";
		  $scope.update=false;
	  };
	  $scope.getAll = function(){
		  $http.get('user/getAllUser.do').success(function(data){
			  
	          $scope.items=data;
	         
	      });
		  };
	  $scope.add=function(){
	        var user = {name:$scope.name,age:$scope.age,password:$scope.password,email:$scope.email};
//	        $http(
//	        	{   method:'POST',
//	        		url:'user/addInfo.do',
//	        		params:user,
//	        		headers: { 'Content-Type': 'text/html; charset=UTF-8'}
//	        	}		
//	        ).success(function(data) {  
//	            $scope.reply=data;
//	            $scope.getAll();
//	            }); 
	        $.post('user/addInfo.do',user,
	        		function(data){
	        	$scope.reply=data;
	            $scope.getAll();
	        }); 
	   };  
	
	  $scope.edit = function(data){
		        	$scope.name=data.name;
		        	$scope.age=data.age;
		        	$scope.password=data.password;
		        	$scope.email=data.email;
		        	$scope.uid = data.id;
		        	$scope.update=true;
//		            $scope.getAll();
		       
		  
	  };
	  $scope.updates = function(){
	        var user = {id:$scope.uid,name:$scope.name,age:$scope.age,password:$scope.password,email:$scope.email};
//	        $http(
//	        	{   method:'POST',
//	        		url:'user/updateUser.do',
//	        		params:user
//	        	}		
//	        ).success(function(data) {  
//	            $scope.reply=data;
//	            $scope.getAll();
//	            }); 
	        $.post('user/updateUser.do',user,
	        		function(data){
	        	console.log(data);
	        	$scope.reply=data;
	            $scope.getAll();
	        }); 
	        
	   };  
	  $scope.del = function(data){
		  $http(
		        	{   method:'POST',
		        		url:'user/delInfo.do',
		        		params:data
		        	}		
		        ).success(function(data) {  
		        	$scope.getAll();
//		        	$scope.reply=data;
		            }); 
		  
		  
	  };
	  
	  
  });
