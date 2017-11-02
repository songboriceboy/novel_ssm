<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书分类列表</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/uikit.almost-flat.css" />
  
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/uikit.js"></script>
 <script src="${pageContext.request.contextPath}/assets/js/components/pagination.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
<script>
	
	

	function loadData(index)
	{
		$.get('${pageContext.request.contextPath}/admin/get_paged_category'
				,{pageIndex:index,pageSize:3},function(data)
				{
				
					var jsonObj = JSON.parse(data);
					
					var html = template('table',jsonObj);
				//	alert(html);
					$('#content').html(html);
					/* var jsonObj = JSON.parse(data);
					var html='<tr><td>分类id</td><td>分类名称</td></tr>';
					for(var i = 0; i < jsonObj.length;i++)
					{
						html += '<tr><td>'+ jsonObj[i].id+'</td>'
						+'<td>'+ jsonObj[i].category_name+'</td></tr>';
					}
					
					$('#count').html(html); */
				})
	}
	
	$(function()
			{
				//alert('ddd');
				//向服务器发起ajax请求，询问分类表中一共有多少条记录
				//回调函数,服务器回应我们的请求后，该回调函数会被浏览器调用
				//并且将服务器回应的数据，通过data参数传进来
				//$.get('请求地址','发给服务器的参数',回调函数(data));
				
				$.get('${pageContext.request.contextPath}/admin/get_category_count','',function(param){
					//alert(param)
					//$('#count').html(param);
					
					//var pagination = UIkit.pagination(分页组件元素,配置选项json对象);
				var pagination = UIkit.pagination('.uk-pagination', {items:param,itemsOnPage:3});
				
				loadData(0);
				
				$('.uk-pagination').on('select.uk.pagination',function(e,index){
					//alert(index);
					//向服务器要第二页数据（每页3条）
				
					loadData(index);
					
				})
				}); 
				
				
				
				
				
				
			})
</script>
</head>
<body>


<%@include file="admin_header.jsp" %>
	
	<div class="uk-grid uk-height-1-1">
        
        
        <!-- 侧边栏 -->
        	<%@include file="admin_category_sidebar.jsp" %>
        
        <div class="uk-width-5-6 app-main">
       <div id="content">
       
       </div>
	
	   
        </div>
    </div>
	
<!-- <table id="count"></table> -->

	<script type="text/html" id="table">
	<table class="uk-table uk-table-striped uk-table-hover" id="count">
		<tr>
			<td>分类id</td>
			<td>分类名称</td>
		</tr>
		
		{{each list as value i}}
		<tr>
			<td>{{value.id}}</td>
			<td>{{value.category_name}}</td>
		</tr>
		{{/each}}
	</table>
	</script>

	<ul class="uk-pagination">

</ul>

<!-- <ul>
<li></li>
</ul> -->
</body>
</html>