'use strict';

/* Controllers */


//  var allapp = angular.module('myApp',[]);


//  app.controller('register',function ($scope,$http) {
//	   $scope.add=function(){
//		   
//		   
//	        var user = {name:$scope.name,age:$scope.age,password:$scope.password,email:$scope.email};
//	        $post(
//	        	{   method:'POST',
//	        		url:'user/addInfo.do',
//	        		params:user
//	        		
//	        	}		
//	        ).success(function(response) {  
////	            $scope.ansInfo=response.a;
//	            });  
//	   };  
//		   
//
//    });
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
		  $scope.getPageUser = function(num){
			  if(isNaN(num)){
				  num=1;
			  }
			  $http.get('user/getPageUser.do?pageSize='+num).success(function(data){
				 
				  $scope.items=data.recordList;
				  $scope.currentPage=data.currentPage;
				  $scope.recordCount=data.recordCount;
				  $scope.pageCount=data.pageCount;
				  $scope.beginPageIndex=data.beginPageIndex;
				  $scope.endPageIndex=data.endPageIndex;
				  console.log(data);
				  var colum=new Array(10);
//				  $index=data.beginPageIndex;
				  $scope.colums = colum;
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
	            $scope.getPageUser();
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
	  $scope.updates = function(currentPage){
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
	            $scope.getPageUser(currentPage);
	        }); 
	        
	   };  
	  $scope.del = function(data,currentPage){
		  $http(
		        	{   method:'POST',
		        		url:'user/delInfo.do',
		        		params:data
		        	}		
		        ).success(function(data) {  
		        	$scope.getPageUser(currentPage);
//		        	$scope.reply=data;
		            }); 
		  
		  
	  };
	  
	  
  });
