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
</head>

<body  class="fixed-sidebar full-height-layout gray-bg" >
    <div id="wrapper" class="changeSkin" style="background-image: url(img/body/city.jpg)">
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
                            <span class="nav-label">客户相关</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/customer/customerList.jhtml">客户信息</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/customer/customerFpList.jhtml">客户分配</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/customer/customerGhList.jhtml">客户关怀</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/customer/customerTypeList.jhtml">客户类型</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/customer/customerZtList.jhtml">客户状态</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/customer/customerLyList.jhtml">客户来源</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/customer/customerLxjlList.jhtml">联系记录</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/customer/customerLxrList.jhtml">联系人</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-list-alt"></i>
                            <span class="nav-label">员工相关</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/emp/empList.jhtml">员工信息</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/house/houseList.jhtml">房屋信息</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/house/houseTypeList.jhtml">房屋类型</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/emp/deptList.jhtml">部门信息</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/emp/bulletinList.jhtml">公告</a>
                            </li>
                        </ul>
                    </li>
                     <li>
                        <a href="#">
                            <i class="glyphicon glyphicon-envelope"></i>
                            <span class="nav-label">邮件相关</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/mail/mailCompose.jhtml">写邮件</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="${pageContext.request.contextPath }/mail/mailList.jhtml">收邮件</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="graph_morris.html">草稿箱</a>
                            </li>
                        </ul>
                    </li>
                      <li>
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
                    </li>
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
                   			<a class="J_menuItem" href="article.html">
                           	 <i class="glyphicon glyphicon-home"></i>
                           	 <span class="nav-label">首页</span>
                      		</a>
                   		</li>
                   			<li>
                   			<a href="#">
                           	 <i class="glyphicon glyphicon-off"></i>
                           	 <span class="nav-label">退出</span>
                      		</a>
                   		</li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="glyphicon glyphicon-user"></i>
                                 <span class="nav-label">常山赵子龙</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a7.jpg">
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>小四</strong> 是不是只有我死了,你们才不骂爵迹
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>二愣子</strong> 呵呵
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="mailbox.html">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
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
              <!--           <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="tabs_panels.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="tabs_panels.html#">选项1</a>
                                </li>
                                <li><a href="tabs_panels.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div> -->
                    </div>
                    <div class="ibox-content" style="height: 100%;">
                    	 <iframe id="J_iframe" width="100%" height="100%" src="${pageContext.request.contextPath }/customer/customerList.jhtml"  frameborder="0" data-id="index_v1.html" seamless></iframe>
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
