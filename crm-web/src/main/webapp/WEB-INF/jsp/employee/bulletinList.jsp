<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>公告</title>
	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet">
	
	<script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript">
$(function(){
	
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
			<form>
				<div class="col-md-4 col-mragin">
             		<input type="text" name="list_describe" class="form-control1" placeholder="查询信息"  value="${list_describe }" />
             	</div>
				<div class="col-md-4 col-mragin">
					 <button type="submit"  class="btn">查&nbsp;询</button>
				</div>
			</form>
		</div>
		<div style="margin-top: 8px;" class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="myTitle">
							<th>序号</th>
							<th>公告人</th>
							<th>公告主题</th>
							<th>公告内容</th>
							<th>公告时间</th>
							<th>公告截止时间</th>
							<th>基本操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>张三</td>
							<td>擂台比武</td>
							<td>回合制，打死为止</td>
							<td>2016-12-15</td>
							<td>2016-12-19</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
						
						<tr>
							<td>2</td>
							<td>李四</td>
							<td>放假通知</td>
							<td>今年提前放假</td>
							<td>2016-12-19</td>
							<td>2016-12-25</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="pagination alternate" style="margin-top:5px;margin-bottom:5px">
			<ul class="clearfix">${pageCode}
			</ul>

		</div>
</body>
</html>