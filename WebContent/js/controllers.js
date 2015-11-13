'use strict';

/* Controllers */

 

  app.controller('userList',function ($scope,$http,$location) {
	 
	  
	  $scope.init = function(){
		  $scope.name="";
		  $scope.age="";
		  $scope.password="";
		  $scope.email="";
		  $scope.update=false;
	  };
	 
//	  $scope.getAll = function(){
//		  $http.get('user/getAllUser.do').success(function(data){
//			  
//	          $scope.items=data;
//	         
//	      });
//		  };
		  $scope.getPageUser = function(num){
			  $scope.path=$location.protocol()+'://'+$location.host()+':'+$location.port()+'/aps/upload/';
			  if(isNaN(num)){
				  num=1;
			  }
			  var username = $scope.search;
			  if(username==undefined){
				  username=null;
			  }
			  var url = 'user/getPageUser.do',
	            data = {
					  'pageSize': num,
					  'userName': username
	            },
	            transFn = function(data) {
	                return $.param(data);
	            },
	            postCfg = {
	                headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
	                transformRequest: transFn
	            };

			  
			  $http.post(url, data, postCfg).success(function(data){
				  $scope.items=data.recordList;
				  $scope.currentPage=data.currentPage;
				  $scope.recordCount=data.recordCount;
				  $scope.pageCount=data.pageCount;
				  $scope.beginPageIndex=data.beginPageIndex; 
				  $scope.endPageIndex=data.endPageIndex;
				  $scope.sequence=(data.currentPage-1)*data.pageSize+1
				  var size=1;
				  if(data.endPageIndex -data.beginPageIndex>=10 ){
					  size=10;
				  }else{
					  size=data.endPageIndex -data.beginPageIndex+1;
					  
				  }
				  
				  var colum=new Array(size);
//				  $index=data.beginPageIndex;
				  $scope.colums = colum;
			  });
		  };
	  $scope.add=function(){
	        var user = {name:$scope.name,age:$scope.age,password:$scope.password,email:$scope.email,icon:$scope.icon};
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
		        	$scope.icon = data.icon;
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
	        	alert(data);
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
	  //图片上传
//	  $scope.upload=function(){
//		  console.log($scope.imageSrc);
//	  var postData = {
////              vacationType: $scope.leave.type,
////              reason: $scope.leave.reason,
////              familyRelation: +$scope.leave.type == 7 ? $scope.leave.relation : "",
////              startTime: startTime,
////              endTime: endTime,
//              fileName: $scope.imageSrc
////              workDelivers: workDelivers,
////              ccmailNickNames: sendPersons,
////              realDays: +$scope.leave.type == 8 ? $scope.leave.timeLong : ""
//          };
//
//          var promise = postMultipart('user/updateIcon.do', postData); 
//
//          function postMultipart(url, data) {
//              var fd = new FormData();
//              angular.forEach(data, function(val, key) {
//                  fd.append(key, val);
//              });
//              var args = {
//                  method: 'POST',
//                  url: url,
//                  data: fd,
//                  headers: {'Content-Type': undefined},
//                  transformRequest: angular.identity
//              };
//              return $http(args);
//          }
//	  }
	  
	
	  
  });
