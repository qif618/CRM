<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>邮件</title>
	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	 <link href="${pageContext.request.contextPath }/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>

</head>
<body style="background-color: rgba(0,0,0,0.3);">
	<div class="container-fluid">
              <div class="mail-header">
                    <div class="pull-right tooltip-demo">
                        <a href="mailbox.html" class="btn"  title="存为草稿"><i class="fa fa-pencil"></i> 存为草稿</a>
                        <a href="mailbox.html" class="btn"  title="放弃"><i class="fa fa-times"></i> 放弃</a>
                    </div>
                    <h2>写信</h2>
                </div>
              <div class="mail-body">
                  <form class="form-horizontal" method="get">
                      <div class="form-group">
                          <div class="col-md-1 control-label">收件人：</div>

                          <div class="col-md-11">
                              <input type="text" class="form-control1" value="i@zi-han.net">
                          </div>
                      </div>
                      <div class="form-group">
                          <label class="col-md-1 control-label">主&nbsp;&nbsp;题：</label>

                          <div class="col-md-11">
                              <input type="text" class="form-control1" value="">
                          </div>
                      </div>
                  </form>

              </div>

              <div class="mail-text h-200">
                  <div class="summernote">
                  		  <h3>输出全靠吼，不要问我为什么！</h3>
                  </div>
                  <div class="clearfix"></div>
              </div>
              <div class="text-right tooltip-demo">
                  <a href="mailbox.html" class="btn"  title="Send"><i class="fa fa-reply"></i> 发送</a>
                  <a href="mailbox.html" class="btn"  title="Discard email"><i class="fa fa-times"></i> 放弃</a>
                  <a href="mailbox.html" class="btn"  title="Move to draft folder"><i class="fa fa-pencil"></i> 存为草稿</a>
              </div>
              <div class="clearfix"></div>



          </div>
		<div class="pagination alternate" style="margin-top:5px;margin-bottom:5px">
			<ul class="clearfix">${pageCode}
			</ul>

		</div>
		 <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/js/content.js?v=1.0.0"></script>


    <!-- iCheck -->
    <script src="${pageContext.request.contextPath }/js/plugins/iCheck/icheck.min.js"></script>

    <!-- SUMMERNOTE -->
    <script src="${pageContext.request.contextPath }/js/plugins/summernote/summernote.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins/summernote/summernote-zh-CN.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });


            $('.summernote').summernote({
                lang: 'zh-CN'
            });

        });
        var edit = function () {
            $('.click2edit').summernote({
                focus: true
            });
        };
        var save = function () {
            var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
            $('.click2edit').destroy();
        };
    </script>
</body>
</html>