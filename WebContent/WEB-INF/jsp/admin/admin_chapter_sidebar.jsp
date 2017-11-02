<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="uk-width-1-6 app-side">
            <ul class="uk-nav uk-nav-side">
                <li class="uk-nav-header">章节管理</li>
                <li><a href="${pageContext.request.contextPath}/admin/chapter_list/${book_id}">章节列表</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/add_chapter/${book_id}">新增章节</a></li>
            </ul>
        </div>
</body>
</html>