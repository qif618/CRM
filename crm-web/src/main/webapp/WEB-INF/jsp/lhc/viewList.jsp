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
    <style type="text/css">
    	.txt {
	height: 22px;
	border: 1px solid #cdcdcd;
	width: 75%;
}

.btnBrowse {
	cursor:pointer;
	background-color: #FFF;
	border: 1px solid #CDCDCD;
	height: 24px;
	width: 120px;
}

#file1 {
	position: absolute;
	top: 10px;
	left: 0;
	height: 27px;
	width: 100%;
	filter: alpha(opacity : 0);
	opacity: 0;
}
    </style>
<script type="text/javascript"> 
    function check() {  
          var excel_file = $("#excel_file").val();  
          if (excel_file == "" || excel_file.length == 0) {  
              alert("请选择文件路径！");  
              return false;  
          } else {  
             return true;  
          }  
     } 
    

 </script>
</head>
<body style="background-color: rgba(0,0,0,0.3);">
	<div class="container-fluid">
		<div class="row">
		<form id="uploadForm" action="${pageContext.request.contextPath }/lhc/import.jhtml" method="post" enctype="multipart/form-data" onsubmit="return check();">
	        <div class="col-md-3 col-mragin">
	        	<input type='text' id='text1' class="form-control1" value="选择文件" class='txt' readonly="readonly" />&nbsp;
				<input type="file" class="form-control1" accept="xlsx" size="80" name="filename" id="file1" size="28" onchange="document.getElementById('text1').value=this.value" />
	        </div>
	         <div class="col-md-4 col-mragin">
	       		<button type="submit" id="import"  class="btn">导入Excel</button>
	         </div>
	     </form>
		</div>
		<div style="margin-top: 8px;" class="table-responsive"><!-- 表格最小宽767 -->
				<table id="example1" class="table table-bordered table-hover">
					<thead>
						<tr class="myTitle"><!-- 标题beij颜色 -->
							<th>期数</th>
							<th>总金额</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mqzeList }" var="mqze" >
							<tr>
								<td>${mqze.qs}</td>
								<td>${mqze.je}</td>
								<td>
									<a href="${pageContext.request.contextPath}/lhc/allzhongjiang.jhtml?qs=${mqze.qs}"><i class="glyphicon glyphicon-pencil"></i>中奖明细</a>
									<a href="${pageContext.request.contextPath }/lhc/xzList.jhtml?qs=${mqze.qs}"><i class="glyphicon glyphicon-pencil"></i>下注明细</a>
								</td>
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