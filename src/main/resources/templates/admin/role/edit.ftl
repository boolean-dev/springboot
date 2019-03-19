<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="renderer" content="webkit"/>
<title>编辑角色</title>
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
					<a href="${base}/admin/role/list.jhtml">列表</a> &raquo; 修改
				</div>
			</div>
			<!--ibox title end-->
			<div class="ibox-content">
			<form id="inputForm" action="update.jhtml" method="post" class="form-horizontal">
			<input type="hidden" name="id" value="${role.id}">
					<div class="form-group">
						<div class="col-sm-1 text-right"><span style="color: #ff6d6d;">*</span>名称:</div>
						<div class="col-sm-11">
							<input type="text" name="name" class="text" maxlength="20" value="${role.name}" />
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-1 text-right"><span style="color: #ff6d6d;">*</span>描述:</div>
						<div class="col-sm-11">
							<input type="text" name="description" class="text" maxlength="20" value="${role.description}" />
						</div>
					</div>
					<div class="hr-line-dashed"></div>
					
					<div class="form-group">
						<div class="col-sm-1 text-right">车辆管理:</div>
						<div class="col-sm-11">
							<div class="i-checks">
							<span class="fieldSet">
								<label>
									<input type="checkbox" name="authorities" value="admin:device" [#if role.authorities?seq_contains("admin:device")]checked="checked"[/#if]/>车辆
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:deviceType" [#if role.authorities?seq_contains("admin:deviceType")]checked="checked"[/#if]/>车辆类型
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:lowList" [#if role.authorities?seq_contains("admin:lowList")]checked="checked"[/#if]/>低电设备
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:map" [#if role.authorities?seq_contains("admin:map")]checked="checked"[/#if]/>车辆位置
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:abnormalList" [#if role.authorities?seq_contains("admin:abnormalList")]checked="checked"[/#if]/>异常车辆
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
									<input type="checkbox" name="authorities" value="admin:returnStation" [#if role.authorities?seq_contains("admin:returnStation")]checked="checked"[/#if]/>还车点管理
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:returnStationMap"  [#if role.authorities?seq_contains("admin:returnStationMap")]checked="checked"[/#if]/>还车点位置
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
									<input type="checkbox" name="authorities" value="admin:bikeOrder" [#if role.authorities?seq_contains("admin:bikeOrder")]checked="checked"[/#if]/>骑行订单
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:appointList" [#if role.authorities?seq_contains("admin:appointList")]checked="checked"[/#if]/>预约中订单
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:cyclingList" [#if role.authorities?seq_contains("admin:cyclingList")]checked="checked"[/#if]/>进行中订单
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:successList" [#if role.authorities?seq_contains("admin:successList")]checked="checked"[/#if]/>已完成订单
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
									<input type="checkbox" name="authorities" value="admin:bikeDeposit" [#if role.authorities?seq_contains("admin:bikeDeposit")]checked="checked"[/#if]/>押金规则
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:payRule" [#if role.authorities?seq_contains("admin:payRule")]checked="checked"[/#if]/>定价规则
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:coupon" [#if role.authorities?seq_contains("admin:coupon")]checked="checked"[/#if]/>优惠券
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
									<input type="checkbox" name="authorities" value="admin:member" [#if role.authorities?seq_contains("admin:member")]checked="checked"[/#if]/>用户信息
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:rechargeList" [#if role.authorities?seq_contains("admin:rechargeList")]checked="checked"[/#if]/>充值记录
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:deposit" [#if role.authorities?seq_contains("admin:deposit")]checked="checked"[/#if]/>消费记录
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:balanceList" [#if role.authorities?seq_contains("admin:balanceList")]checked="checked"[/#if]/>余额过低
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:depositList" [#if role.authorities?seq_contains("admin:depositList")]checked="checked"[/#if]/>押金查询
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
									<input type="checkbox" name="authorities" value="admin:statisticalView" [#if role.authorities?seq_contains("admin:statisticalView")]checked="checked"[/#if]/>消费金额统计
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:incomeList" [#if role.authorities?seq_contains("admin:incomeList")]checked="checked"[/#if]/>收入管理
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:refund" [#if role.authorities?seq_contains("admin:refund")]checked="checked"[/#if]/>支出管理
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
									<input type="checkbox" name="authorities" value="admin:log" [#if role.authorities?seq_contains("admin:log")]checked="checked"[/#if]/>日志管理
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
									<input type="checkbox" name="authorities" value="admin:admin" [#if role.authorities?seq_contains("admin:admin")]checked="checked"[/#if]/>管理员
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:role" [#if role.authorities?seq_contains("admin:role")]checked="checked"[/#if]/>角色
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:fault" [#if role.authorities?seq_contains("admin:fault")]checked="checked"[/#if]/>故障
								</label>
					
								<label>
									<input type="checkbox" name="authorities" value="admin:article" [#if role.authorities?seq_contains("admin:article")]checked="checked"[/#if]/>文章管理
								</label>
								<label>
									<input type="checkbox" name="authorities" value="admin:articleCategory" [#if role.authorities?seq_contains("admin:articleCategory")]checked="checked"[/#if]/>文章分类管理
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