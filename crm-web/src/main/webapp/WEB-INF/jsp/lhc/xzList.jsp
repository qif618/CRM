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

<script type="text/javascript">
$(function(){
	 $('#myTitlediv', window.parent.document).html("下注明细");
  $("#pageSizeSelect").val($("#hide_pageSize").val());
  $("#pageSizeSelect").change(function(){
    $("#hide_pageSize").attr("value",$("#pageSizeSelect").val())
    $("#page").attr("value","1");
    //$("form").attr("action","/com/appConfig/appConfigList.jhtml");
    $("#sub-click").click();
  }); 
	
	/* 列名初始排序 */
	var sort_a = $("#sort_a").attr("value");
  if("ASC" == sort_a){
    $("#sortName").show();
    $("#no-sort-a").hide();
    $("#sortName").removeClass("fa-sort-alpha-desc").addClass("fa-sort-alpha-asc");
  }else if("DESC" == sort_a){
    $("#sortName").show();
    $("#no-sort-a").hide();
    $("#sortName").removeClass("fa-sort-alpha-asc").addClass("fa-sort-alpha-desc");
  }else {
  	// 无序
  }
  /* 点击改变排序规则 */
  $("#sortName,#no-sort-a").click(function(){
    $("#no-sort-a").hide();
    $("#sortName").show();
    //sort_0 = "";//清除其他排
    if(sort_a == "ASC"){
      sort_a = "DESC";
      $("#sortName").removeClass("fa-sort-alpha-asc").addClass("fa-sort-alpha-desc");
    }else{
      sort_a = "ASC";//无序 倒序 -> 正序
      $("#sortName").removeClass("fa-sort-alpha-desc").addClass("fa-sort-alpha-asc");
    }
    $("#hide_sort_a").attr("value",sort_a);
    $("#sub-click").click();
    //form.submit
  });
  
});
function commonDelete(unid){
	if(confirm("确定要删除这条数据吗?")){
		$.post("/com/common/deleteByAppUnid.jhtml",{unid:unid},
				function(result){
					var result=eval('('+result+')');
					if(result.error){
						alert(result.error);
					}else{
						alert("删除成功！");
						window.location.reload(true);
					}
				}
			);
	}
}
function deleteCommonLists(){
	var selectedSpan=$("input:checked");
	var ids = "";
	$("input[type=checkbox]:checked").each(function(){ //由于复选框一般选中的是多个,所以可以循环输出选中的值  
		ids = ids + $(this).val() + ",";
	});
	if(selectedSpan.length==0){
		alert("请选择要删除的数据！");
		return;
	}
	if(confirm("您确定要删除这"+selectedSpan.length+"条数据吗？")){
		$.post("/com/common/deleteCommonLists.jhtml",{ids:ids},function(result){
			if(result.success){
				alert("数据已成功删除！");
				location.reload(true);
			}else{
				alert("数据删除失败！");
			}
		},"json");
	}else{
		return;
	}
}
function resetValue(){
	 $("#id").val("");
	 $("#sectionName").val("");
}
</script>
</head>
<body style="background-color: rgba(0,0,0,0.3);">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-10 col-mragin title-align">
				<table  class="table table-bordered table-hover">
					<tbody>
							<tr>
								<td>${kjhm.qs }</td>
								<td>${kjhm.pm1 }-${kjhm.px1 }</td>
								<td>${kjhm.pm2 }-${kjhm.px2 }</td>
								<td>${kjhm.pm3 }-${kjhm.px3 }</td>
								<td>${kjhm.pm4 }-${kjhm.px4 }</td>
								<td>${kjhm.pm5 }-${kjhm.px5 }</td>
								<td>${kjhm.pm6 }-${kjhm.px6 }</td>
								<td>${kjhm.tm }-${kjhm.tx }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-2 col-mragin" style="padding-top: 5px;">
					<button class="form-control1 btn" onclick="history.back();">返回</button>
				</div>
			</div>
		<div style="margin-top: 8px;" class="table-responsive"><!-- 表格最小宽767 -->
				<table id="example1" class="table table-bordered table-hover">
					<thead>
						<tr class="myTitle"><!-- 标题beij颜色 -->
							<th>期数</th>
							<th>下注时间</th>
							<th>下注人</th>
							<th>下注方式</th>
							<th>下注内容</th>
							<th>下注金额</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${xzmxList }" var="xzmx" varStatus="status">
							<tr>
								<td>${xzmx.qs }</td>
								<td>${xzmx.xzsj }</td>
								<td>${xzmx.xzr }</td>
								<td>${xzmx.xzfs }</td>
								<td>${xzmx.xznr }</td>
								<td>${xzmx.je }</td>
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