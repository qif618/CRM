<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.crazyit.org/mytags" prefix="lyf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工信息明细</title>
 	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>

<script type="text/javascript">
$(function(){
	$('#myTitlediv', window.parent.document).html("员工信息");
});
</script>
</head>
<body style="background-color: rgba(0,0,0,0.3);">
	<div class="container-fluid">
			<form>
				<div class="row">
					<div class="col-md-2 col-mragin title-align">
	             		姓名:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="赵子龙" test="${flag}"/>
	             	</div>
	             	<div class="col-md-2 col-mragin title-align">
	             		年龄:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="16" test="${flag}"/>
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-2 col-mragin title-align">
	             		性别:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="男" test="${flag}"/>
	             	</div>
	             	<div class="col-md-2 col-mragin title-align">
	             		民族:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="汉族" test="${flag}"/>
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-2 col-mragin title-align">
	             		学历:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="小学" test="${flag}"/>
	             	</div>
	             	<div class="col-md-2 col-mragin title-align">
	             		婚姻:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="否" test="${flag}"/>
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-2 col-mragin title-align">
	             		部门:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="工程" test="${flag}"/>
	             	</div>
	             	<div class="col-md-2 col-mragin title-align">
	             		角色:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="管理员" test="${flag}"/>
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-2 col-mragin title-align">
	             		座机:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="16456" test="${flag}"/>
	             	</div>
	             	<div class="col-md-2 col-mragin title-align">
	             		爱好:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="打球" test="${flag}"/>
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-2 col-mragin title-align">
	             		银行卡:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="4564165784512568" test="${flag}"/>
	             	</div>
	             	<div class="col-md-2 col-mragin title-align">
	             		手机:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="13658954" test="${flag}"/>
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-2 col-mragin title-align">
	             		身份证:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="56561256223165" test="${flag}"/>
	             	</div>
	             	<div class="col-md-2 col-mragin title-align">
	             		添加时间:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="2016-11-16" test="${flag}"/>
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-2 col-mragin title-align">
	             		添加人:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="李四" test="${flag}"/>
	             	</div>
	             	<div class="col-md-2 col-mragin title-align">
	             		修改人:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="张三" test="${flag}"/>
	             	</div>
             	</div>
             	<div class="row">
					<div class="col-md-2 col-mragin title-align">
	             		E-Mail:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="454664@qq.com" test="${flag}"/>
	             	</div>
	             	<div class="col-md-2 col-mragin title-align">
	             		地址:
	             	</div>
	             	<div class="col-md-3 col-mragin">
	             		<lyf:input name="ddd" aClass="form-control1" value="上海郊外" test="${flag}"/>
	             	</div>
             	</div>
			</form>
			<div class="row">
				<div class="col-md-9 col-mragin title-align">
					<button class="btn" onclick="history.back();">返回</button>
					<lyf:button1 test="true" aClass="btn" value="保存"></lyf:button1>
				</div>
			</div>
	</div>
</body>
</html>