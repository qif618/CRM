<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.crazyit.org/mytags" prefix="lyf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>明细</title>
 	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>

<script type="text/javascript">
$(function(){
	$('#myTitlediv', window.parent.document).html("录入开奖号码");
});
function save(){
	$("#kjhmForm").submit();
}
</script>
</head>
<body style="background-color: rgba(0,0,0,0.3);">
	<div class="container-fluid">
			<form id="kjhmForm" action="${pageContext.request.contextPath }/lhc/kjhmInsert.jhtml" method="post">
				<div class="row">
					<div class="col-md-4 col-mragin title-align">
	             		第几期：
	             	</div>
	             	<div class="col-md-4 col-mragin title-align">
	             		<input name="qs" class="form-control1" id="qs" value="">
	             	</div>				
             	</div>
             	<div class="row">
					<div class="col-md-4 col-mragin title-align">
	             		第一个：
	             	</div>
	             	<div class="col-md-4 col-mragin title-align">
	             		<input name="pm1" class="form-control1" id="pm1" value="">
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-4 col-mragin title-align">
	             		第二个：
	             	</div>
	             	<div class="col-md-4 col-mragin title-align">
	             		<input name="pm2" class="form-control1" id="pm2" value="">
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-4 col-mragin title-align">
	             		第三个：
	             	</div>
	             	<div class="col-md-4 col-mragin title-align">
	             		<input name="pm3" class="form-control1" id="pm3" value="">
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-4 col-mragin title-align">
	             		第四个：
	             	</div>
	             	<div class="col-md-4 col-mragin title-align">
	             		<input name="pm4" class="form-control1" id="pm4" value="">
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-4 col-mragin title-align">
	             		第五个：
	             	</div>
	             	<div class="col-md-4 col-mragin title-align">
	             		<input name="pm5" class="form-control1" id="pm5" value="">
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-4 col-mragin title-align">
	             		第六个：
	             	</div>
	             	<div class="col-md-4 col-mragin title-align">
	             		<input name="pm6" class="form-control1" id="pm6" value="">
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-4 col-mragin title-align">
	             		特码王：
	             	</div>
	             	<div class="col-md-4 col-mragin title-align">
	             		<input name="tm" class="form-control1" id="tm" value="">
	             	</div>
             	</div>
             	
			</form>
			<div class="row">
				<div class="col-md-8 col-mragin title-align">
					<button class="btn" onclick="history.back();">返回</button>
					<button class="btn" onclick="save()">保存</button>
				</div>
			</div>
	</div>
</body>
</html>