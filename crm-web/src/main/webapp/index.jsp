<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>输出全靠吼</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

   <link type="favicon.ico" rel="icon" href="favicon.ico">
     <link href="${pageContext.request.contextPath }/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/calendar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/styleSkin.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.css?v=4.1.0" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
<script type="text/javascript">
/* 	$(function(){居然直接跳转到新开页面，而不是ifram
		$.ajax({ 
		    url:$("#url").val(), 
		    dataType: "json",
		    success:function(data){
		    	var content = "";
		    	for(var i=0;i<data.length;i++){
		    		content=content+'<li><a  class="J_menuItem" href="${pageContext.request.contextPath }/lhc/xzEveryList.jhtml">'+
		    		data[i]+'</a></li>';
		    	}
		    	$("#xzr").html(content);
		    }
		    });
	}); */
</script>
</head>

<body  class="fixed-sidebar full-height-layout gray-bg" >
	<input id="url" type="hidden" value="${pageContext.request.contextPath }/lhc/xzrList.jhtml"/>
    <div id="wrapper" class="changeSkin" style="background-image: url(img/body/yellow.jpg)">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
        
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;text-align: center;">
                                        <strong class="font-bold">输出全靠吼</strong>
                                    </span>
                                </span>
                            </a>
                        </div>
                        <div class="logo-element">CRM
                        </div>
                    </li>
                    <li class="calendar">
                    	 <!-- Calendar -->
                   		 <div class="s-widget m-b-25" style="background: rgba(0,0,0,0.2);">
                   	     <div id="sidebar-calendar"></div>
                   		 </div>
                    </li>
                    <!-- <li class="line dk"></li> -->
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-copyright-mark"></i>
                            <span class="nav-label">下注选手</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul id="xzr" class="nav nav-second-level">
                        	<li>
                                <a  class="J_menuItem" href="${pageContext.request.contextPath }/lhc/xzEveryList.jhtml?xzr=刘德华">刘德华</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/lhc/xzEveryList.jhtml?xzr=张学友">张学友</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-copyright-mark"></i>
                            <span class="nav-label">开奖相关</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a  class="J_menuItem" href="${pageContext.request.contextPath }/lhc/kjhmList.jhtml">每期号码</a>
                            </li>
                             <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/lhc/viewList.jhtml">每期总额</a>
                            </li>
                        </ul>
                    </li>
                    
                     
                     <%--  <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-th"></i>
                            <span class="nav-label">管理员</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/login.jhtml">添加员工</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_flot.html">添加部门</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_morris.html">添加角色</a>
                            </li>
                        </ul>
                    </li> --%>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                   <ul class="nav navbar-top-links navbar-left" >
                   		<li>
                   			<a class="navbar-minimalize" href="#">
                   				<i class="fa fa-bars"></i>
                   			</a>
                   		</li>
                   		<li>
                   			<a class="J_menuItem" href="${pageContext.request.contextPath }/lhc/viewList.jhtml">
                           	 <i class="glyphicon glyphicon-home"></i>
                           	 <span class="nav-label">首页</span>
                      		</a>
                   		</li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="glyphicon glyphicon-user"></i>
                                 <span class="nav-label">常山赵子龙</span>
                            </a>
                        </li>
                    </ul>
                    <div id="time" class="pull-right" style="padding: 10px;font-size: 20px;">
                        <span id="hours"></span>
                        :
                        <span id="min"></span>
                        :
                        <span id="sec"></span>
                    </div>
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main" >
            	<div class="ibox float-e-margins" style="height: 100%;">
                    <div class="ibox-title"><!-- 标题固定不动 -->
                        <h5 id="myTitlediv">工作台</h5>
                    </div>
                    <div class="ibox-content" style="height: 100%;">
                    	 <iframe id="J_iframe" width="100%" height="100%" src="${pageContext.request.contextPath }/lhc/viewList.jhtml"  frameborder="0" data-id="index_v1.html" seamless></iframe>
                    </div>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath }/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins/layer/layer.min.js"></script>
 	<script src="${pageContext.request.contextPath }/js/calendar.min.js"></script> <!-- Calendar -->
    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/js/hAdmin.js?v=4.1.0"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>

    <!-- 第三方插件 -->
    <script src="${pageContext.request.contextPath }/js/plugins/pace/pace.min.js"></script>
</body>

</html>
