<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="renderer" content="webkit"/>
<title>添加角色</title>
<link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="${base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
<link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">
<link href="${base}/resources/admin/css/iCheck/custom.css" rel="stylesheet">
<script type="text/javascript" src="${base}/resources/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<style type="text/css">
.authorities label {
	min-width: 120px;
	_width: 120px;
	display: block;
	float: left;
	padding-right: 4px;
	_white-space: nowrap;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $selectAll = $("#inputForm .selectAll");
	
	
	
	$selectAll.click(function() {
		var $this = $(this);
		var $thisCheckbox = $this.closest("tr").find(":checkbox");
		if ($thisCheckbox.filter(":checked").size() > 0) {
			$thisCheckbox.prop("checked", false);
		} else {
			$thisCheckbox.prop("checked", true);
		}
		return false;
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name:{
				required:true
			},
			description: {
				required:true
			},
		},
	});
	
});
</script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox">
			<div class="ibox-title">
				<div class="path">
					<a href="${base}/admin/role/list.jhtml">列表</a> &raquo; 添加角色
				</div>
			</div>
			<!--ibox title end-->
			<div class="ibox-content">
			<form id="inputForm" action="save.jhtml" method="post" class="form-horizontal">
					<div class="form-group">
						<div class="col-sm-1 text-right"><span style="color: #ff6d6d;">*</span>名称:</div>
						<div class="col-sm-11">
							<input type="text" name="name" class="text" maxlength="20"  />
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-1 text-right"><span style="color: #ff6d6d;">*</span>描述:</div>
						<div class="col-sm-11">
							<input type="text" name="description" class="text" maxlength="20"  />
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-1 text-right">车辆管理:</div>
						<div class="col-sm-11">
							<div class="i-checks">
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:device" />车辆
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:deviceType" />车辆类型
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:lowList" />低电设备
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:map" />车辆位置
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:abnormalList" />异常车辆
								</label>								
							</span>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
						<div class="form-group">
						<div class="col-sm-1 text-right">还车点管理:</div>
						<div class="col-sm-11">
							<div class="i-checks"> 
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:returnStation" />还车点管理
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:returnStationMap" />还车点位置
								</label>
							</span>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					<div class="form-group">
						<div class="col-sm-1 text-right">运营管理:</div>
						<div class="col-sm-11">
							<div class="i-checks">
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:bikeDeposit" />押金规则
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:payRule" />定价规则
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:coupon" />优惠券
								</label>	
							</span>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-1 text-right">订单管理:</div>
						<div class="col-sm-11">
							<div class="i-checks">
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:bikeOrder" />骑行订单
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:appointList" />预约中订单
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:cyclingList" />进行中订单
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:successList" />已完成订单
								</label>	
							</span>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-1 text-right">用户管理:</div>
						<div class="col-sm-11">
							<div class="i-checks">
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:member" />用户信息
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:rechargeList" />充值记录
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:deposit" />消费记录
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:balanceList" />余额过低
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:depositList" />押金查询
								</label>					
							</span>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-1 text-right">财务管理:</div>
						<div class="col-sm-11">
							<div class="i-checks">
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:statisticalView" />消费金额统计
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:incomeList" />收入管理
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:refund" />支出管理
								</label>	
							</span>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-1 text-right">日志管理:</div>
						<div class="col-sm-11">
							<div class="i-checks">
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:log" />日志管理
								</label>
							</span>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-1 text-right">管理员:</div>
						<div class="col-sm-11">
							<div class="i-checks">
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:admin" />管理员
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:role" />角色
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:fault" />故障
								</label>
					
								<label>
									<input type="checkbox" name="authorities" value="admin:article" />文章管理
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:articleCategory" />文章分类管理
								</label>
					
			
							</span>
							</div>
						</div>
					</div>
					<div class="hr-line-dashed"></div>
	
		
					<tr>
						<th>
							&nbsp;
						</th>
						<td>
							<input type="submit" class="btn btn-primary" value="确&nbsp;&nbsp;定" />
							<input type="button" class="btn btn-white" value="返&nbsp;&nbsp;回" onclick="location.href='list.jhtml'" />
						</td>
					</tr>
				</table>
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