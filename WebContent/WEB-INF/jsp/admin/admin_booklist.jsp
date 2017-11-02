<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%@include file="admin_header.jsp" %>
	
	<div class="uk-grid uk-height-1-1">
        
        
        <!-- 侧边栏 -->
       <%@include file="admin_book_sidebar.jsp" %>
         <!-- 主体部门 -->
        <div class="uk-width-5-6 app-main">
       <div id="content">
       
       </div>
	
	   <ul class="uk-pagination">

        </ul>
        </div>
    </div>
	

	 <script type="text/html" id="table">
     <table class="uk-table uk-table-striped uk-table-hover">
		<tbody>
		<tr>
			<td>书名</td>
			<td>操作</td>
		</tr>
	
		{{each list}}
		
		<tr>
			<td>{{$value.book_name}}</td>
			<td>
			<a href="#">删除</a>
			<a href="/novel_ssm/admin/getbookinfo/{{$value.id}}">编辑</a>
			<a href="/novel_ssm/admin/chapter_list/{{$value.id}}">章节管理</a>
			</td>
		</tr>
		
		{{/each}}
		
	</tbody>
	</table> 

		
     </script>
	
	<%-- <%@include file="admin_footer.jsp" %> --%>
	<script type="text/javascript">
$(function () {
	
	//发ajax请求给服务器，获得图书记录数量
	$.get('${pageContext.request.contextPath}/getbookcounts/0',{bookname:''},function(data)
			{
				var json = JSON.parse(data);
				
				var pagination = UIkit.pagination('.uk-pagination', {items:json.counts, itemsOnPage:10,currentPage:3});
			    $('.uk-pagination').on('select.uk.pagination',function (e,page_index) {
			     
			         $.get('${pageContext.request.contextPath}/getpagedbooks'
			        		,{"pageIndex":page_index,"pageSize":10,category_id:0,bookname:''},function(data)
			        		{
			        			
			        			var jsonObj = JSON.parse(data);
			        			var html = template('table',jsonObj);
			        			$('#content').html(html);
			        		}) 

			    })

			    $('.uk-pagination li').eq(0).find('a').trigger('click'); 
			});
   /*  */

})
</script>
</body>
</html>




