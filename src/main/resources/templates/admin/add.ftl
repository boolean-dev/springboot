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
<link href="${base}/resources/admin/css/iCheck/custom.css" rel="stylesheet">
<script type="text/javascript" src="${base}/resources/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>

<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	$.validator.addMethod("requiredTo", 
		function(value, element, param) {
			var parameterValue = $(param).val();
			if ($.trim(parameterValue) == "" || ($.trim(parameterValue) != "" && $.trim(value) != "")) {
				return true;
			} else {
				return false;
			}
		},
		"必填"
	);
	
	// 表单验证
	$inputForm.validate({
		rules: {
			username:{
				required: true,
				remote: {
					url: "${base}/admin/checkUsername",
					cache: false
				}
			},
			currentPassword: {
				requiredTo: "#password",
				remote: {
					url: "check_current_password",
					cache: false
				}
			},
			password: {
				required: true,
				pattern: /^[^\s&\"<>]+$/,
				minlength: 4,
				maxlength: 20
			},
			rePassword: {
				required: true,
				equalTo: "#password"
			},
			name: {
				required: true,
			}
		},
		messages: {
			password: {
				pattern: "非法字符"
			},
			username:{remote:"用户名已存在"},
		}
	});
	
});
</script>
</head>
<body class="gray-bg">

	<div class="wrapper wrapper-content animated fadeInRight">	
		<div class="ibox">
			<!--面包屑-->
			<div class="ibox-title">
				<a href="${base}/admin/list">
					<small>列表</small>
				</a>
				 &raquo; 
				<small>添加</small>
			</div>
			
			<div class="ibox-content">
				<form id="inputForm" action="${base}/admin/save" method="post" class="form-horizontal">
				
					<div class="form-group">
						<div class="col-sm-2 text-right"><span style="color: #ff6d6d;">*</span>用户名:</div>
						<div class="col-sm-4">
							<input type="text" name="username" class="text" maxlength="20" />
						</div>
						<div class="col-sm-2 text-right"><span style="color: #ff6d6d;">*</span>姓名:</div>
						<div class="col-sm-4">
							<input type="text" name="name" class="text" maxlength="20" />
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					
					
					<div class="form-group">
						
						<div class="col-sm-2 text-right"><span style="color: #ff6d6d;">*</span>密码: </div>
						<div class="col-sm-4">
							<input type="password" id="password" name="password" class="text" maxlength="20" />
						</div>
						<div class="col-sm-2 text-right"><span style="color: #ff6d6d;">*</span>确认密码: </div>
						<div class="col-sm-4">
							<input type="password" name="rePassword" class="text" maxlength="20" />
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					
					
					<div class="form-group">
					<div class="col-sm-2 text-right">部门:</div>
						<div class="col-sm-4">
							<input type="text" name="department" class="text" maxlength="20" />
						</div>
						
						<div class="col-sm-2 text-right">E-mail: </div>
						<div class="col-sm-4">
							<input type="text" name="email" class="text" maxlength="20" />
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-2 text-right">角色: </div>
						<div class="col-sm-4">
						<div class="i-checks">
							<span class="fieldSet">
							[#list roles as role]
								<label>
									<input type="checkbox" name="ids" value="${role.id}" />${role.name}
								</label>
							[/#list]
							</span>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					
					
					<div class="form-group actions">
					
						<div class="col-sm-2 text-right"></div>
						<div class="col-sm-10">
							<input type="submit" class="btn btn-primary" value="确&nbsp;&nbsp;定" />
							<a class="btn btn-white" href="${base}/admin/list">返&nbsp;&nbsp;回</a>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
				</form>
			</div>
			<!--ibox content end-->
		</div>
		<!--ibox end-->
	</div>
	<script src="${base}/resources/admin/js/iCheck/icheck.min.js"></script>
	<script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</body>
</html>