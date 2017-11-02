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
        
        <div class="uk-width-5-6 app-main">
	
	<form class="uk-form" method = "post" action = "${pageContext.request.contextPath}/admin/save_book" enctype="multipart/form-data">
		<input type="hidden" value="${book.id}" name="id">
		
		<p>
			书籍名字：<input type="text" name = "book_name" value="${book.book_name}">
		</p>
		<p>
			书籍分类：
			<select name="category_id">
			
			
			<c:forEach items="${categorys}" var="category">
				<c:if test="${category.id == book.category_id}">
				<option value="${category.id}" selected="selected">${category.category_name}</option>
				</c:if>
				<c:if test="${category.id != book.category_id}">
				<option value="${category.id}">${category.category_name}</option>
				</c:if>
			</c:forEach>

			
			</select>
		</p>
		<p>
			书籍介绍：<textarea rows="10" cols="20" name="book_intro">${book.book_intro}</textarea>
		</p>
		<p>
			书籍作者：<input type="text" name = "book_author" value="${book.book_author}">
		</p>
		
<%-- 		<p>
			<img src="${pageContext.request.contextPath}/assets/${book.book_url}" height="300px" width="180px">
		</p> --%>
		
		<p>
			上传封面：<input type="file" name = "bookface">
		</p>
		
		<p>
			<input type="submit" class="uk-button">
		</p>
		</form>
	
	
        </div>
    </div>
</body>
</html>