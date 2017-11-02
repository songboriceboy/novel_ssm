<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <div id="main">
	<h1>小说管理后台</h1>
	<div id = "sidebar">
		<a href="${pageContext.request.contextPath}/admin">书籍列表</a>
		<a href="${pageContext.request.contextPath}/addbook">新增书籍</a>
	</div>
	<hr>
	<div id = "content"> --%>
	
<!DOCTYPE html>
<html lang="en" class="uk-height-1-1">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/uikit.almost-flat.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/uikit.js"></script>
 <script src="${pageContext.request.contextPath}/assets/js/components/pagination.js"></script>
 <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
 

    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/assets/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/assets/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/assets/ueditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body class="uk-height-1-1">
    <nav class="uk-navbar  app-navbar">
        <a href="${pageContext.request.contextPath}/" class="uk-navbar-brand">小说管理平台</a>
        <div class="uk-navbar-flip">
            <ul class="uk-navbar-nav">
                <li><a href="#"><i class="uk-icon-automobile"></i>退出登录</a></li>
            </ul>
        </div>
        <ul class="uk-navbar-nav">
            <li><a href="${pageContext.request.contextPath}/admin/admin"><i class="uk-icon-automobile"></i>图书管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/get_category_list"><i class="uk-icon-cog"></i>分类管理</a></li>
        </ul>

    </nav>