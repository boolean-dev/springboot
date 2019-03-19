<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="renderer" content="webkit"/>
	<title>欢迎</title>

	<link href="${base}/resources/admin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${base}/resources/admin/css/font-awesome.css?v=4.4.0" rel="stylesheet">
	<link href="${base}/resources/admin/css/animate.css" rel="stylesheet">
	<link href="${base}/resources/admin/css/style.css?v=4.1.0" rel="stylesheet">

	<script type="text/javascript" src="${base}/resources/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/echarts.common.min.js"></script>
	<script type="text/javascript" src="${base}/resources/admin/js/plugins/layer/laydate/laydate.js"></script>


	<script>
		//扩展的日期格式化
		Date.prototype.format = function(formatStr){
		    var str = formatStr;
		    var Week = ['日','一','二','三','四','五','六'];

		    str=str.replace(/yyyy|YYYY/,this.getFullYear());
		    str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));

		    var month = this.getMonth()+1;
		    str=str.replace(/MM/,month>9?month+"":'0' + month);
		    str=str.replace(/M/g,month);

		    str=str.replace(/w|W/g,Week[this.getDay()]);

		    str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());
		    str=str.replace(/d|D/g,this.getDate());

		    str=str.replace(/aa/,this.getHours()<12?"AM":"PM");
		    str=str.replace(/AA/,this.getHours()<12?"上午":"下午");

		  	var hours = this.getHours();
		  	hours = hours > 12?hours-12:hours;
		    str=str.replace(/hh/,hours>9?hours.toString():'0' + hours);
		    str=str.replace(/h/g,hours);
		    str=str.replace(/HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());
		    str=str.replace(/H/g,this.getHours());
		    str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());
		    str=str.replace(/m/g,this.getMinutes());

		    str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());
		    str=str.replace(/s|S/g,this.getSeconds());

		    return str;
		};

$(document).ready(function() {
	showLineChart();
    showBarChart();
});
	</script>

	<style>
		.end_date_time::before{
			content: "";
			width: 20px;
			height: 2px;
			background: #494949;
			position: absolute;
			left: -10px;
			top: 12px;
		}
		.form-group{
			position: absolute;
		    top: 15px;
		    right: 20px;
		    z-index: 2;
		}
		.ng-scope .ibox{
			overflow: hidden;
		}
		@media only screen and (max-width: 768px) {
			.end_date_time::before{
				display: none;
			}
			.form-group{
				position: absolute;
			    top: 15px;
			    left: 50%;
			    margin: 0 auto;
			    z-index: 2;
			}
		}
	</style>
</head>

<body class="gray-bg">

	<br/>

	<div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2 ng-if="isMain" class="ng-binding ng-scope">系统首页</h2>
        </div>
        <div class="col-lg-2 text-center">
        <h2 class="ng-binding fadeInRight" id="bjTime">----/--/-- --:--:--</h2>
        <script>
        	document.getElementById("bjTime").innerHTML = new Date().format('yyyy年MM月dd日 HH:mm:ss');
        	setInterval(function(){var time = new Date().format('yyyy年MM月dd日 HH:mm:ss');document.getElementById("bjTime").innerHTML = time;},1000);
        </script>
        </div>
    </div>

    <div ui-view="" class="ng-scope">
	    <div class="wrapper wrapper-content animated fadeInRight ng-scope" >
		    <div class="row" style="background-color:#fff;">
				<div class="col-sm-3">
                	<div class="ibox">
                    	<div class="ibox-content" style="background-color:#FFCC33;position: relative;">
                    		<span class="fa-stack fa-4x">
  								<i class="fa fa-circle fa-stack-2x" style="color:#FABF00;"></i>
  								<i class="fa fa-line-chart fa-stack-1x fa-inverse"></i>
							</span>
							<span class="total" style="position: absolute;left: 135px;top: 40px;color: #fff;font-size: 18px;height: 20px;overflow: hidden;">今日流入</span>
							<span class="amount" style="position: absolute;left: 135px;bottom: 20px;color: #fff;font-size: 40px;font-weight: bold;">${todayPay}</span>
                   		</div>
                	</div>
                </div>
                <div class="col-sm-3">
                	<div class="ibox">
                    	<div class="ibox-content " style="background-color:#7CC956;position: relative;">
                     	   	<span class="fa-stack fa-4x">
  								<i class="fa fa-circle fa-stack-2x" style="color:#76BA52;"></i>
  								<i class="fa fa-hourglass-end fa-stack-1x fa-inverse"></i>
							</span>
							<span class="total" style="position: absolute;left: 135px;top: 40px;color: #fff;font-size: 18px;height: 20px;overflow: hidden;">今日订单总数</span>
							<span id="isnull" class="amount" style="position: absolute;left: 135px;bottom: 20px;color: #fff;font-size: 40px;font-weight: bold;">${todayOrder}</span>
                   		</div>
                	</div>
            	</div>
            	<div class="col-sm-3">
                	<div class="ibox">
                    	<div class="ibox-content" style="background-color:#5C6876;position: relative;">
                        	<span class="fa-stack fa-4x">
  								<i class="fa fa-circle fa-stack-2x" style="color:#586470;"></i>
  								<i class="fa fa-android fa-stack-1x fa-inverse"></i>
							</span>
							<span class="total" style="position: absolute;left: 135px;top: 40px;color: #fff;font-size: 18px;height: 20px;overflow: hidden;">用户总数</span>
							<span class="amount" style="position: absolute;left: 135px;bottom: 20px;color: #fff;font-size: 40px;font-weight: bold;">${memberCount}</span>
                    	</div>
                	</div>
            	</div>
            	<div class="col-sm-3">
                	<div class="ibox">
                    	<div class="ibox-content" style="background-color:#0098FF;position: relative;">
                        		<span class="fa-stack fa-4x">
  									<i class="fa fa-circle fa-stack-2x" style="color:#078CEA;"></i>
  									<i class="fa fa-user fa-stack-1x fa-inverse"></i>
								</span>
								<span class="total" style="position: absolute;left: 135px;top: 40px;color: #fff;font-size: 18px;height: 20px;overflow: hidden;">司机总数</span>
								<span class="amount" style="position: absolute;left: 135px;bottom: 20px;color: #fff;font-size: 40px;font-weight: bold;">${allDriver}</span>
                    	</div>
                	</div>
            	</div>
            </div>
            <div class="row" style="background-color:#fff;">
            	<div class = "row">
            		 <h5 class="m-b-md" style="text-indent:40px">本月统计</h1>
            	</div>
				<div class="col-sm-3">
                	<div class="ibox">
                    	<div class="ibox-content" style="position: relative;">
                   	 	   <span class="fa-stack fa-4x">
  								<i class="fa fa-circle fa-stack-2x" style="color:#2BB8F6;"></i>
  								<i class="fa fa-money fa-stack-1x fa-inverse"></i>
							</span>
							<span class="total" style="position: absolute;left: 135px;top: 40px;color: #AEBABD;font-size: 18px;">收入</span>
							<span class="amount" style="position: absolute;left: 135px;bottom: 20px;color: #666666;font-size: 40px;font-weight: bold;">${tomonthPay}</span>
                   		</div>
                	</div>
                </div>
                <div class="col-sm-3">
                	<div class="ibox">
                    	<div class="ibox-content " style="position: relative;">
                     	   	<span class="fa-stack fa-4x">
  								<i class="fa fa-circle fa-stack-2x" style="color:#828CC7;"></i>
  								<i class="fa fa-thumbs-o-up fa-stack-1x fa-inverse"></i>
							</span>
							<span class="total" style="position: absolute;left: 135px;top: 40px;color: #AEBABD;font-size: 18px;">司机提现</span>
							<span class="amount" style="position: absolute;left: 135px;bottom: 20px;color: #666666;font-size: 40px;font-weight: bold;">${monthEncashment}</span>
                   		</div>
                	</div>
            	</div>
            	<div class="col-sm-3">
                	<div class="ibox">
                    	<div class="ibox-content" style="position: relative;">
                        	<span class="fa-stack fa-4x">
  								<i class="fa fa-circle fa-stack-2x" style="color:#7CC956;"></i>
  								<i class="fa fa-group fa-stack-1x fa-inverse"></i>
							</span>
							<span class="total" style="position: absolute;left: 135px;top: 40px;color: #AEBABD;font-size: 18px;">合作伙伴获利</span>
							<span class="amount" style="position: absolute;left: 135px;bottom: 20px;color: #666666;font-size: 40px;font-weight: bold;">${sumParentMonth}</span>
                    	</div>
                	</div>
            	</div>
            	<div class="col-sm-3">
                	<div class="ibox" style="position:relative;">
                    	<div class="ibox-content" style="position: relative;">
                        		<span class="fa-stack fa-4x">
  									<i class="fa fa-circle fa-stack-2x" style="color:#FABF00;"></i>
  									<i class="fa fa-rmb fa-stack-1x fa-inverse"></i>
								</span>
								<span class="total" style="position: absolute;left: 135px;top: 40px;color: #AEBABD;font-size: 18px;">平台利润</span>
							<span class="amount" style="position: absolute;left: 135px;bottom: 20px;color: #666666;font-size: 40px;font-weight: bold;">${sumPlatformMonth}</span>
                    	</div>
                	</div>
            	</div>
            </div>
            <div class="row" style="background-color:#fff;">
            	<div class="col-sm-8" >
            		<div class="ibox">
            			<span style="position:absolute;top:8px;left:80px;z-index:2;font-size: 20px;color: color: #AEBABD;font-weight: bold;">订单数走势</span>
            			<div class="form-group" style="position:absolute;top:8px;right:80px;z-index:2">
							<div class="col-sm-6">
								<input id="start_date" name="start_date" type="text" style="width:115px;height:25px;padding-left:5px" class="laydate-icon" value="${startDate}" onclick="ss()">
							</div>

							<div class="col-sm-6 end_date_time">
								<input id="end_date" name="end_date" type="text" style="width:115px;height:25px;padding-left:5px" class="laydate-icon" value="${endDate}" onclick="ss()">
							</div>
            			</div>
            			<div class="ibox-content" style="width: 100%;height:615px;" id="lineChart">
            			折线图-订单数走势
            			</div>
            		</div>
            	</div>
            	<div class="col-sm-4">
            		<div class="ibox float-e-margins">
                    <div class="ibox-content" style="width: 100%;height:615px;" id="barChart">
                        柱状图-司机评价星级
                    </div>
                </div>
            	</div>
            </div>
		</div>
	</div>
	
	
</body>
<script>
	function spanNull(){
		if($('#isnull').text()==""){
			window.location.href = "${base}/admin/common/index.jhtml";
		}
	}
	spanNull()
</script>
<script>
	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('lineChart'));
	// 指定图表的配置项和数据
	option = {
	    tooltip: {
	        trigger: 'axis'
	    },
	    toolbox: {
        	show: true,
        	feature: {
            	/*dataZoom: {
                	yAxisIndex: 'none'
            	},
           		dataView: {readOnly: false},*/
            	magicType: {type: ['line', 'bar']}
            	/*restore: {},
            	saveAsImage: {}*/
        	}
    	},
	    xAxis:  {
	        type: 'category',
	        name: '日期',
	        nameLocation: 'end',
	        boundaryGap: false,
	        data: []
	    },
	    yAxis: {
	        type: 'value',
	        name: '数量',
	        nameLocation: 'end'

	    },
	    series: [
	        {
	            name:'订单数',
	            type:'line',
	            data:[],
	            itemStyle : {
	            	normal : {
						color:'#2F4554'
					}
				},
	            markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        }
	    ]
	};

	// 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    function ss(){
		var timer=setInterval(function(){
			if($('#laydate_box').css('display')==="none"){
				showLineChart();
				clearInterval(timer);
				console.log(1)
			}
		},100)
	}


    function showLineChart(){
	    var dates=[];    //日期数组（实际用来盛放X轴坐标值）
	    var nums=[];    //订单数目数组（实际用来盛放Y坐标值）

    	myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画

		var startDate = document.getElementById("start_date").value;
		var endDate = document.getElementById("end_date").value;
		if((startDate != "" && startDate != null) && (endDate != "" && endDate != null)){
			if(startDate > endDate){
				layer.msg("开始时间必须小于结束时间");
				myChart.hideLoading();    //隐藏加载动画
				return;
			}
		}

		$.ajax({
			type: "post",
			async : true,
			url: "${base}/admin/order/lineChart",
			data: {
				"startDate":startDate,
				"endDate":endDate
			},
			dataType: "json",
			success:function(result){
				//请求成功时执行该函数内容，result即为服务器返回的json对象
             	if (result) {
                    for(var i=0;i<result.length;i++){
                       dates.push(result[i].departure);    //挨个取出日期并填入日期数组
                     }
                    for(var i=0;i<result.length;i++){
                        nums.push(result[i].id);    //挨个取出订单数目并填入订单数目数组
                      }
                    myChart.hideLoading();    //隐藏加载动画
                    myChart.setOption({        //加载数据图表
                        xAxis: {
                        	name:'日期',
                            data: dates
                        },
                        series: [{
                            // 根据名字对应到相应的系列
                            name: '订单数',
                            data: nums
                        }]
                    });
				}
        	}
		});
	}


    laydate({
  		elem: '#start_date', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
 		event: 'focus' //响应事件。如果没有传入event，则按照默认的click
	});

	laydate({
  		elem: '#end_date', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
 		event: 'focus' //响应事件。如果没有传入event，则按照默认的click
	});
</script>

<script >
 	var datas=[];
    var counts=[];
    <#list countLevels as countLevel>
	 	datas.push("星级"+${countLevel.star_level});
    	counts.push(${countLevel.count});
	</#list>
    function showBarChart(){
   

    //这个echarts对象应该是在echarts-all.js文件里面初始化好的，所以直接拿来用，
    var myChart = echarts.init(document.getElementById('barChart'));
    var option = {
        title : {
            text: '司机评价柱状图',
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:datas
        },
        
        color: ['rgb(78,191,240)'],

        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : datas,
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'人数：',
                type:'bar',
                data:counts,
            },

        ]
    };
    myChart.setOption(option);
}

</script>

</html>