<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
<ul class="breadcrumb">
	<li>
		<i class="icon-home"></i>
		<a href="#/userList">Home</a> 
		<i class="icon-angle-right"></i>
	</li>
	<li><a href="#/register">注册</a></li>
	<li class="pull-right no-text-shadow">
		<div id="dashboard-report-range" class="dashboard-date-range tooltips no-tooltip-on-touch-device responsive" data-tablet="" data-desktop="tooltips" data-placement="top" data-original-title="Change dashboard date range">
			<i class="icon-calendar"></i>
			<span></span>
			<i class="icon-angle-down"></i>
		</div>
	</li>
</ul>
<div ng-controller="userList" ng-init="getAll()">
<div ng-show="reply!=null"id="myAlert" class="alert alert-success">
   <a href="#" class="close" data-dismiss="alert">&times;</a>
   <strong>{{reply}}</strong>。
</div>
<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" ng-click="init()">添加用户</button>
<table class="table table-hover table-bordered" >
   <caption><h4>用户列表</h4></caption>
   <thead>
      <tr>
      	 <th>选择</th>
         <th>用户名</th>
         <th>年龄</th>
         <th>邮箱</th>
         <th>属性</th>
      </tr>
   </thead>
   <tbody>
      <tr  ng-repeat="item in items">
      	 <td><input type="checkbox"></td>
         <td>{{item.name}}</td>
         <td>{{item.age}}</td>
         <td>{{item.email}}</td>
         <td>
         <div class="btn-group">
		  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" ng-click="edit(item)">编辑</button>
		  <button type="button" class="btn btn-danger" ng-click="del(item)">删除</button>
		</div>
		</td>
      </tr>
     
   </tbody>
</table>

<div class="pagination ">
<nav style="text-align: center">
  <ul>
    <li><a href="#">前一页</a></li>
    <li class="active">
      <a href="#">1</a>
    </li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">后一页</a></li>
  </ul>
  </nav>
</div>



<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
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
 
   <div class="form-group">
      <div>
         <div class="checkbox">
            <label>
               <input type="checkbox" required> 同意用户协议
            </label>
         </div>
      </div>
   </div>
   
</form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" ng-show="!update" ng-disabled="userForm.$invalid" class="btn btn-primary" ng-click="add()" data-dismiss="modal">
               提交添加
            </button>
            <button type="button" ng-show="update" ng-disabled="userForm.$invalid" class="btn btn-primary" ng-click="updates()" data-dismiss="modal">
               提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>