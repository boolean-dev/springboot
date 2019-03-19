<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>hztuen - 后台管理系统</title>

    <meta name="keywords" content="Flashbike,flashbike,Flash bike,flash bike,闪骑">
  
    <!--[if lt IE 9]>
    	<meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${base}/resources/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
    <link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">
    
    <style>
    	#side-menu .loading{
    		display:none;
    	}
    </style>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
						<div class="dropdown profile-element">
							<span><img alt="image" class="img-circle" src="[#if admin.headImgUrl??]${admin.headImgUrl}[#else]${base}/resources/admin/img/profile_small.jpg[/#if]" width="64px" height="64px" /></span>
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear">
							   <span class="block m-t-xs"><strong class="font-bold">${admin.username}</strong></span>
								<span class="text-muted text-xs block">${admin.name}<b class="caret"></b></span>
								</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="J_menuItem" href="${base}/admin/profile/edit.jhtml">个人资料</a>
								</li>
								<li class="divider"></li>
								<li><a href="logout.jhtml">安全退出</a>
								</li>
							</ul>
						</div>
						<div class="logo-element">Flash
						</div>
					</li>
                    <li class="loading">
                        <a href="#">
                            <i class="fa fa-car"></i>
                            <span class="nav-label">车辆管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        		<li><a class="J_menuItem" href="${base}/admin/car/list.jhtml">车辆管理</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/car/monitor.jhtml">车辆监控</a></li>
                        </ul>
                    </li>
                    <li class="loading">
                        <a href="#">
                            <i class="fa fa-file"></i>
                            <span class="nav-label">订单管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        		<li><a class="J_menuItem" href="${base}/admin/order/list.jhtml">所有订单</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/order/finished/list.jhtml">已完成订单</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/order/appointment/list.jhtml">预约中订单</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/order/ongoing/list.jhtml">进行中订单</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/order/error/list.jhtml">异常订单</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/order/cancel/list.jhtml">取消订单</a></li>
                        </ul>
                    </li>
                    <li class="loading">
						<a href="#">
                            <i class="fa fa-user"></i>
                            <span class="nav-label">司机管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        		<li><a class="J_menuItem" href="${base}/admin/driver/list.jhtml">司机信息</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/driverComment/list.jhtml">司机评分</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/encashment/list.jhtml">提现记录</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/driverBill/list.jhtml">流水记录</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/encashment/settlement.jhtml">司机结算</a></li>
                        		<li><a class="J_menuItem" href="${base}/admin/driverMode/list.jhtml">接单模式</a></li>
                        </ul>
                    </li>
                    <li class="loading">
                        <a href="javascript:void(0)">
                            <i class="fa fa-users"></i>
                            <span class="nav-label">用户管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	[@hasPermission name="admin:member"]
                            <li><a class="J_menuItem" href="${base}/admin/member/list.jhtml">用户信息</a></li>
                            <li><a class="J_menuItem" href="${base}/admin/memberComment/list.jhtml">用户评分</a></li>
                            <li><a class="J_menuItem" href="${base}/admin/memberBill/rechargeList.jhtml">充值记录</a></li>
                            <li><a class="J_menuItem" href="${base}/admin/memberBill/list.jhtml">流水记录</a></li>
                            <li><a class="J_menuItem" href="${base}/admin/nameAuthentication/list.jhtml">实名认证</a></li>
                            <li><a class="J_menuItem" href="${base}/admin/invoice/list.jhtml">发票管理</a></li>
                            [/@hasPermission]
                        </ul>
                    </li>
                    <li class="loading">
                        <a href="javascript:void(0)">
                            <i class="fa fa-child"></i>
                            <span class="nav-label">合作伙伴</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<li><a class="J_menuItem" href="${base}/admin/partner/list.jhtml">合作伙伴信息</a></li>
                        	<li><a class="J_menuItem" href="${base}/admin/partnerIncome/list.jhtml">报表查询</a></li>
                        	<li><a class="J_menuItem" href="${base}/admin/partnerEncashment/list.jhtml">合伙人结算</a></li>
                        </ul>
                    </li>
                    <li class="loading">
                        <a href="#">
                            <i class="fa fa-rocket"></i>
                            <span class="nav-label">运营管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<li><a class="J_menuItem" href="${base}/admin/rechargeAllocation/list.jhtml">充值策略</a></li>
                        	<li><a class="J_menuItem" href="${base}/admin/payment/list.jhtml">付款单管理</a></li>
                        	<li><a class="J_menuItem" href="${base}/admin/coupon/list.jhtml">打车券管理</a></li>
                        	<li><a class="J_menuItem" href="${base}/admin/chargeRule/editByType.jhtml?type=member">用户计费规则</a></li>
                        	<li><a class="J_menuItem" href="${base}/admin/chargeRule/editByType.jhtml?type=driver">司机计费规则</a></li>
                        </ul>
                    </li>
                    <li class="loading">
                        <a href="javascript:void(0)">
                            <i class="fa fa-bar-chart"></i>
                            <span class="nav-label">数据统计</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<li><a class="J_menuItem" href="javascript:void(0)">用户统计</a></li>
                        	<li><a class="J_menuItem" href="javascript:void(0)">订单统计</a></li>
                        	<li><a class="J_menuItem" href="javascript:void(0)">退款统计</a></li>
                        	<li><a class="J_menuItem" href="${base}/admin/payment/platformIncome.jhtml">收入统计</a></li>
                        </ul>
                    </li>
                    <li class="loading">
                        <a href="javascript:void(0)">
                            <i class="fa fa-gear"></i>
                            <span class="nav-label">后台管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	[@hasPermission name="admin:admin"]
                            <li><a class="J_menuItem" href="${base}/admin/admin/list.jhtml" data-index="0">管理员</a></li>
                            [/@hasPermission]
                            [@hasPermission name="admin:role"]
                            <li><a class="J_menuItem" href="${base}/admin/role/list.jhtml">角色管理</a></li>
                            [/@hasPermission]
                            [@hasPermission name="admin:articleCategory"]
                            <li><a class="J_menuItem" href="${base}/admin/articleCategory/list.jhtml">帮助分类</a></li>
                            [/@hasPermission]
                            [@hasPermission name="admin:article"]
                            <li><a class="J_menuItem" href="${base}/admin/article/list.jhtml">帮助管理</a></li>
                            [/@hasPermission]
                            <li><a class="J_menuItem" href="${base}/admin/dictionary/list.jhtml">数据字典</a></li>
                            <li><a class="J_menuItem" href="${base}/admin/orderComment/list.jhtml">评价列表</a></li>
                            <li><a class="J_menuItem" href="${base}/admin/driverAuthentication/list.jhtml">行驶认证</a></li>
                            <li><a class="J_menuItem" href="${base}/admin/feedBack/list.jhtml">意见反馈</a></li>
                        </ul>
                    </li>
                    <li class="loading">
                        <a href="#">
                            <i class="fa fa-comment"></i>
                            <span class="nav-label">推送管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<li><a class="J_menuItem" href="${base}/admin/messageDriver/list.jhtml">司机端推送</a></li>
                            <li><a class="J_menuItem" href="${base}/admin/messageMember/list.jhtml">用户端推送</a></li>
                        </ul>
                    </li>							
                    <li class="loading">
                        <a href="#">
                            <i class="fa fa-comment"></i>
                            <span class="nav-label">接口测试</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<li><a class="J_menuItem" href="${base}/admin/apiTest/orderList.jhtml">订单测试</a></li>
                        	<li><a class="J_menuItem" href="${base}/admin/apiTest/driverList.jhtml">上传定位</a></li>
                        </ul>
                    </li>							
                    
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="logout.jhtml" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${base}/admin/welcome.jhtml" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2016-2018 亚汽专车
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

            </div>
        </div>
        <!--右侧边栏结束-->
    </div>

    <!-- 全局js -->
    <script src="${base}/resources/admin/js/jquery.min.js?v=2.1.4"></script>
    <script src="${base}/resources/admin/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${base}/resources/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${base}/resources/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="${base}/resources/admin/js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="${base}/resources/admin/js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="${base}/resources/admin/js/plugins/pace/pace.min.js"></script>
    <script>
	    $(".J_menuItem").click(function(){
			$(".J_iframe").each(function(){
				if($(this).css("display")=="inline"){
				   $(this).attr('src', $(this).attr('src'));
				}
			});
	    });
	    
	    $(".nav-second-level").each(function(){
	    	var i = $(this).children().size();
	    	if(i == 0){
	    		$(this).parent().remove();
	    	}
		});
		
		$("#side-menu .loading").fadeIn(1000,function(){
			$(this).removeClass("loading");
		});
    </script>

</body>

</html>
