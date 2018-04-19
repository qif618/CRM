<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>吃吃吃</title>
 	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/dataTables.bootstrap.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dataTables.js"></script>

</head>
<body style="background-color: rgba(0,0,0,0.3);">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-mragin title-align">
				<a class="btn form-control1" href="${pageContext.request.contextPath}/lhc/toKjhmInsert.jhtml">录入开奖号码</a>
			</div>
		</div>
		<div style="margin-top: 8px;" class="table-responsive"><!-- 表格最小宽767 -->
				<table id="example1" class="table table-bordered table-hover">
					<thead>
						<tr class="myTitle"><!-- 标题beij颜色 -->
							<th>期数</th>
							<th>第一个</th>
							<th>第二个</th>
							<th>第三个</th>
							<th>第四个</th>
							<th>第五个</th>
							<th>第六个</th>
							<th>特码</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${kjhmList }" var="kjhm" varStatus="status">
							<tr>
								<td>${kjhm.qs }</td>
								<td>${kjhm.pm1 }-${kjhm.px1 }</td>
								<td>${kjhm.pm2 }-${kjhm.px2 }</td>
								<td>${kjhm.pm3 }-${kjhm.px3 }</td>
								<td>${kjhm.pm4 }-${kjhm.px4 }</td>
								<td>${kjhm.pm5 }-${kjhm.px5 }</td>
								<td>${kjhm.pm6 }-${kjhm.px6 }</td>
								<td>${kjhm.tm }-${kjhm.tx }</td>
								<td><a href="${pageContext.request.contextPath}/lhc/allzhongjiang.jhtml?qs=${kjhm.qs}">中奖明细</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	<script type="text/javascript">
	 $(function () {
	        $("#example1").DataTable({
	        	 "order": [],
	        });
	 });
	</script>
</body>















</html>