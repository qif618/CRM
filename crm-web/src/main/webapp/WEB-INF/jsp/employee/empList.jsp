<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.crazyit.org/mytags" prefix="lyf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工信息</title>
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
</script>
</head>
<body style="background-color: rgba(0,0,0,0.3);">
	<div class="container-fluid">
		<div class="row">
			<form>
					<input type="hidden" id="hide_sort_a" name="sort_a" value="${sort_a}"><!-- 每次点排序时赋值，初始有值'DESC'显示最新值 -->
				    <input type="hidden" name="page" value="1"><!-- 通过from提交时，page=1 -->
	     		    <input type="hidden" id="hide_pageSize" name="pageSize" value="${pageSize}"><!-- 用作传递并换每页显示数 -->
                 <div class="col-md-4 col-mragin">
             		<input type="text" name="list_describe" class="form-control1" placeholder="查询信息"  value="${list_describe }" />
             	</div>
             	<div class="col-md-4 col-mragin">
	             	 <select name="dd" id="d" class="form-control1" >
	        	 			<option class="bgParent">员工姓名</option>
	        	 			<option class="bgParent">员工部门</option>
	        	 			<option class="bgParent">员工角色</option>
	        	 			<option class="bgParent">员工学历</option>
	          		 </select>
          		 </div>
			</form>
			<div class="col-md-4 col-mragin">
				 <button type="submit"  class="btn">查&nbsp;询</button>
				 <a class="btn" href="${pageContext.request.contextPath }/emp/addEmp.jhtml?flag=true">添&nbsp;加</a>
			</div>
			
		</div>
		<div style="margin-top: 8px;" class="table-responsive"><!-- 表格最小宽767 -->
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="myTitle"><!-- 标题beij颜色 -->
							<th>
								序号
			                    <span id="no-sort-a" style="cursor: pointer;">
			                      <i class="fa fa-long-arrow-up"></i><i class="fa fa-long-arrow-down"></i>
			                    </span>
                 					 <i class="fa" aria-hidden="true" id="sortName" style="cursor: pointer;"></i>
                						 <input type="hidden" id="sort_a" value="${sort_a}">
               				</th>
							<th>姓名</th>
							<th>年龄</th>
							<th>民族</th>
							<th>部门</th>
							<th>角色</th>
							<th>学历</th>
							<th>婚姻</th>
							<th>家庭地址</th>
							<th>手机</th>
							<th>基本操作</th>
						</tr>
					</thead>
					<tbody>
						<tr class="trHover">
							<td>1</td>
							<td>刘德华</td>
							<td>50</td>
							<td>汉族</td>
							<td>品保</td>
							<td>管理员</td>
							<td>高中</td>
							<td>是</td>
							<td>阿富汗</td>
							<td>1369575264</td>
							<td>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6&flag=false"> <i class="glyphicon glyphicon-pencil"></i>详情</a>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6&flag=true"> <i class="glyphicon glyphicon-pencil"></i>编辑</a>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6" > <i class="glyphicon glyphicon-remove"></i>删除</a>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>郭富城</td>
							<td>50</td>
							<td>汉族</td>
							<td>HR</td>
							<td>管理员</td>
							<td>大学</td>
							<td>是</td>
							<td>美国</td>
							<td>1369575264</td>
							<td>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6&flag=false"> <i class="glyphicon glyphicon-pencil"></i>详情</a>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6&flag=true"> <i class="glyphicon glyphicon-pencil"></i>编辑</a>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6" > <i class="glyphicon glyphicon-remove"></i>删除</a>
							</td>
						</tr>
						<tr>
							<td>3</td>
							<td>张学友</td>
							<td>50</td>
							<td>汉族</td>
							<td>品保</td>
							<td>管理员</td>
							<td>小学</td>
							<td>是</td>
							<td>韩国</td>
							<td>1369575264</td>
							<td>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6&flag=false"> <i class="glyphicon glyphicon-pencil"></i>详情</a>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6&flag=true"> <i class="glyphicon glyphicon-pencil"></i>编辑</a>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6" > <i class="glyphicon glyphicon-remove"></i>删除</a>
							</td>
						</tr>
						<tr>
							<td>4</td>
							<td>黎明</td>
							<td>50</td>
							<td>汉族</td>
							<td>品保</td>
							<td>管理员</td>
							<td>博士</td>
							<td>是</td>
							<td>韩国</td>
							<td>13695756521</td>
							<td>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6&flag=false"> <i class="glyphicon glyphicon-pencil"></i>详情</a>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6&flag=true"> <i class="glyphicon glyphicon-pencil"></i>编辑</a>
								<a href="${pageContext.request.contextPath }/emp/editEmp.jhtml?unid=6" > <i class="glyphicon glyphicon-remove"></i>删除</a>
							</td>
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