 
<ul class="breadcrumb">
	<li>
		<i class="icon-home"></i>
		<a href="#/userList">Home</a> 
		<i class="icon-angle-right"></i>
	</li>
	<li><a href="#/">用户</a></li>
	<li class="pull-right no-text-shadow">
		<div id="dashboard-report-range" class="dashboard-date-range tooltips no-tooltip-on-touch-device responsive" data-tablet="" data-desktop="tooltips" data-placement="top" data-original-title="Change dashboard date range">
			<i class="icon-calendar"></i>
			<span></span>
			<i class="icon-angle-down"></i>
		</div>
	</li>
</ul>
<div ng-controller="userList" ng-init="getPageUser()">
<div ng-show="reply!=null"id="myAlert" class="alert alert-success">
   <a href="#" class="close" data-dismiss="alert">&times;</a>
   <strong>{{reply}}</strong>。
</div>

<form class="well form-search" user="searchform">
  <input type="text" ng-model="search" class="search-query" placeholder="根据用户名查找">
  <button type="button" class="btn" ng-click="getPageUser(1)">搜索</button>
</form>
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" ng-click="init()">添加用户</button>

<table class="table table-hover table-bordered" >
   <caption><h4>用户列表</h4></caption>
   <thead>
      <tr>
      	 <th>序号</th>
      	 <th>头像</th>
         <th>用户名</th>
         <th>年龄</th>
         <th>邮箱</th>
         <th>属性</th>
      </tr>
   </thead>
   <tbody>
      <tr  ng-repeat="item in items">
      	 <td>{{sequence+$index}}</td>
         <td><img src="{{path+item.icon}}" width="40px" height="40px"></td>
         <td>{{item.name}}</td>
         <td>{{item.age}}</td>
         <td>{{item.email}}</td>
         <td>
         <div class="btn-group">
		  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" ng-click="edit(item)">编辑</button>
		  <button type="button" class="btn btn-danger" ng-click="del(item,currentPage)">删除</button>
		</div>
		</td>
      </tr>
     
   </tbody>
</table>

<div class="pagination">
<nav style="text-align: center">
  <ul>
  <li><a href="javascript:void(0)" ng-click="getPageUser(1)"><<第一页</a></li>
	    <li ng-hide="currentPage==1">
	    <a href="javascript:void(0)" ng-click="getPageUser(currentPage-1)"><前一页</a>
	    </li>
	    <li ng-show="currentPage==1">
	    <a><前一页</a>
	    </li>
   
    	<li ng-repeat="colum in colums"><a href="javascript:void(0)" ng-click="getPageUser(beginPageIndex+$index)">{{beginPageIndex+$index}}</a></li>
    
    	<li><a href="javascript:void(0)" ng-hide="currentPage==endPageIndex"  ng-click="getPageUser(currentPage+1)">后一页></a></li>
	    <li ng-show="currentPage==endPageIndex">
	    <a>后一页></a>
	    </li>
    <li><a href="javascript:void(0)" ng-click="getPageUser(endPageIndex)">尾页>></a></li>
  </ul>
  </nav>
   
</div>



		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
		   aria-labelledby="myModalLabel" aria-hidden="false" >
		   <div class="modal-dialog">
		      <div class="modal-content">
		         <div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal" 
		               aria-hidden="true">
		            </button>
		            <h4 class="modal-title" id="myModalLabel">
		               添加用户{{name}}
		            </h4>
		         </div>
		         <div class="modal-body">
		         <div class="row">
		         <div class="span5">
				<form role="form" name="userForm" >
				   <div class="form-group">
				      <label for="name">用户名</label>
				      <input type="text" class="form-control" id="name" ng-model="name"
				         placeholder="请输入名称" required>
				   </div>
				   <div class="form-group">
				      <label for="age">年龄</label>
				      <input type="text" class="form-control" id="age" ng-model="age" 
				         placeholder="请输入年龄" required>
				   </div>
				    <div class="form-group">
				      <label for="password">密码</label>
				      <input type="password" class="form-control" id="password" ng-model="password"
				         placeholder="请输入密码" required>
				   </div>
				   <div class="form-group">
				      <label for="email">邮箱</label>
				      <input type="email" class="form-control" id="email" ng-model="email"
				         placeholder="请输入邮箱" required>
				   </div>
				   <div class="form-group" ng-show="update">
					   <div class="row">
						   <div class="span3">
						 	 <label for="file">头像</label>
						     <input type="file" id="file" ng-model="file" accept="image/*" name="file"><br/>
						    <input type="hidden" id="flag" name="flag" value="{{uid}}" />
						    </div>
						     <div class="span2">
						    <img src="{{path+icon}}" width="40px" height="40px">
						    </div>
						    <div class="span1">
						    <input type="button" ng-disabled="!userForm.file.$valid" id="btnUpload" value="上传图片" />
						    </div>
						   
					    </div>
				   </div>
				   
				</form>
				 </div>
		         </div>
		         <div class="modal-footer">
		            <button type="button" class="btn btn-default" 
		               data-dismiss="modal">关闭
		            </button>
		            <button type="button" ng-show="!update" ng-disabled="userForm.$invalid" class="btn btn-primary" ng-click="add()" data-dismiss="modal">
		               提交添加
		            </button>
		            <button type="button" ng-show="update" ng-disabled="userForm.$invalid" class="btn btn-primary" ng-click="updates(currentPage)" data-dismiss="modal">
		               提交更改
		            </button>
		         </div>
		      </div><!-- /.modal-content -->
		   </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	
</div>


<script src="js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function(){
       //上传图片
       $("#btnUpload").click(function() {
               ajaxFileUpload();
       });
    });
    function ajaxFileUpload() {
        // 开始上传文件时显示一个图片
      //  $("#wait_loading").ajaxStart(function() {
          //  $(this).show();
        // 文件上传完成将图片隐藏起来
       // }).ajaxComplete(function() {
          //  $(this).hide();
       // });
        var uid =$('#flag').val()
        $.ajaxFileUpload({
            url: 'user/updateIcon.do', 
            type: 'post',
            secureuri: false, //一般设置为false
            fileElementId: 'file', // 上传文件的id、name属性名
            dataType: 'text', //返回值类型，一般设置为json、application/json
            data:{'id':uid},
            success: function(data, status){ 
            alert(data);
            },
            error: function(data, status, e){ 
                alert(e);
            }
        });
        //return false;
    }
    </script>


