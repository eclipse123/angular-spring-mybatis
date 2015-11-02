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
<div  ng-controller="register">
<form role="form" >
   <div class="form-group">
      <label for="name">用户名</label>
      <input type="text" class="form-control" id="name" ng-model="name"
         placeholder="请输入名称">
   </div>
   <div class="form-group">
      <label for="age">年龄</label>
      <input type="text" class="form-control" id="age" ng-model="age" 
         placeholder="请输入年龄">
   </div>
    <div class="form-group">
      <label for="password">密码</label>
      <input type="password" class="form-control" id="password" ng-model="password"
         placeholder="请输入名称">
   </div>
   <div class="form-group">
      <label for="email">邮箱</label>
      <input type="email" class="form-control" id="email" ng-model="email"
         placeholder="请输入邮箱">
   </div>
 
   <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
         <div class="checkbox">
            <label>
               <input type="checkbox"> 同意用户协议
            </label>
         </div>
      </div>
   </div>
   <div class="form-group">
      <div class="col-sm-offset-2 col-md-10">
         <button type="submit" class="btn btn-default" ng-click="add()">欢迎{{name}}注册</button>
      </div>
   </div>
</form>
<div>


