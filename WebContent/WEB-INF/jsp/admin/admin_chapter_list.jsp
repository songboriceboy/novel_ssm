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
       <%@include file="admin_chapter_sidebar.jsp" %>
         <!-- 主体部门 -->
        <div class="uk-width-5-6 app-main">
   
   <table class="uk-table uk-table-striped uk-table-hover">
		<tr>
			<td>章节</td>
			<td>操作</td>
		</tr>
	
		<c:forEach items="${chapters}" var="chapter">
		<tr>
			<td>${chapter.title}</td>
			<td>
			<a href="${pageContext.request.contextPath}/admin/edit_chapter/${chapter.id}">编辑</a>
			<a href="#">删除</a>
		
			</td>
		</tr>
		</c:forEach>
		
	</table>
	
	
        </div>
    </div>
	
</body>
</html>