<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="renderer" content="webkit"/>
<title>账号设置</title>

<link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
<link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">

<script type="text/javascript" src="${base}/resources/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>

</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">

	<div class="ibox">
		<!-- 面包屑 -->
		<div class="ibox-title">
			<div class="path">
				首页
				 &raquo;角色列表 
				 <span>(共<span id="pageTotal">${page.total}</span>条记录)</span>
			</div>
		</div>
		
		<!-- 表单 -->
		<div class="ibox-content">
			<form id="listForm" action="list.jhtml" method="get">
			
				<div class="row">
					<div class="col-sm-5 m-b-xs">
						<a href="add.jhtml" class="btn btn-outline btn-primary"><i class="fa fa-plus"></i>&nbsp;添加</a>
						<a id="deleteButton" class="btn btn-outline btn-danger disabled" ><i class="fa fa-trash-o"></i>&nbsp删除</a>
						<a id="refreshButton" class="btn btn-outline btn-warning" ><i class="fa fa-refresh"></i>&nbsp;刷新</a>
						<div class="btn-group">
							<a href="javascript:;" id="pageSizeSelect" data-toggle="dropdown" class="btn btn-outline btn-info dropdown-toggle">
								每页显示<span class="caret"></span>
							</a>
							<ul id="pageSizeOption" class="dropdown-menu">
								<li>
									<a href="javascript:;" val="10" [#if page.pageSize == 10]class="current"[/#if]>10</a>
								</li>
								<li>
									<a href="javascript:;" val="20"  [#if page.pageSize == 20]class="current"[/#if]>20</a>
								</li>
								<li>
									<a href="javascript:;" val="50"  [#if page.pageSize == 50]class="current"[/#if]>50</a>
								</li>
								<li>
									<a href="javascript:;" val="100"  [#if page.pageSize == 100]class="current"[/#if]>100</a>
								</li>
							</ul>
						</div>
					</div>
					<!--以上左侧按钮-->
	                <div class="col-sm-4 m-b-xs">
	          
	                	
	                </div>
	                <!--以上中部-->
	                <div class="col-sm-3">
						<div id="searchBar" class="input-group m-b">
							<div class="input-group-btn">
								<button id="searchPropertySelect" data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button">
									类别 <span class="caret"></span>
		                        </button>
		                        <ul id="searchPropertyOption" class="dropdown-menu">
									<li>
										<a href="javascript:;" val="name" [#if page.searchProperty == "name"]selected[/#if]>名称</a>
									</li>
									
									
								</ul>
							</div>
							<input type="text" id="searchValue" name="searchValue" value="" placeholder="请输入关键词" class="form-control">
							<span class="input-group-btn">
	                        	<button type="submit" class="btn btn-primary">搜索</button>
	                        </span>
						</div>
					</div>
					<!--以上右侧搜索框-->
				</div>
				<div class="table-responsive">
					<table id="listTable" class="table table-bordered table-striped table-hover">
						<tr>
							<th class="check"><input type="checkbox" id="selectAll" /></th>
							<th>名称</th>
							<th>是否内置</th>
							<th>描述</th>
							<th>创建日期</th>
							<th>操作</th>
						</tr>
						[#list page.content as role]
						<tr>
							<td><input type="checkbox" name="ids" value="${role.id}" /></td>
				 			<td>${role.name}</td>
				 			<td>[#if role.isSystem == true]是[#else]否[/#if]</td>	
				 			<td>${role.description}</td>
				 			<td>${role.createDate?string("yyyy-MM-dd HH:mm")}</td>
				 			
				 			<td>
								<a href="${base}/admin/role/edit.jhtml?id=${role.id}" class="btn btn-sm btn-white btn-bitbucket">
									<i class="fa fa-edit"></i> 编辑
								</a>
							</td>
						</tr>
						[/#list]
					</table>
				</div>
				[#include "/admin/include/pagination.ftl"]
			</form>
		</div>
		<!--ibox content end-->
	</div>
	<!--ibox end-->
</div>
</body>



</html>