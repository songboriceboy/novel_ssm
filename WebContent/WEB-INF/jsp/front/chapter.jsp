<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="full-screen" content="yes">
    <meta name="screen-orientation" content="portrait">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="applicable-device" content="pc,mobile">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="description" content="经典小说,武侠小说,魔幻小说,科幻小说,网络小说在线阅读">
    <meta name="keywords" content="小说,魔幻,武侠,奇幻,科幻,经典,在线,阅读,体验,起点,网络小说,排行榜,无广告">
    <title>${chapterinfo.title }</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/2b.png">
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css?v=1.0.5">
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/assets/css/novel.css?v=1.0.27">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js?v=1.0.5" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/novel.js?v=1.0.5" type="text/javascript"></script>

</head>
<body>

<div class="main container">
    <ol class="breadcrumb" style="margin-top: 20px;">
        <li><a href="${pageContext.request.contextPath}">小说列表</a></li>
        <li><a novel-id="1090" href="${pageContext.request.contextPath}/getbook/${chapterinfo.book_id}">${chapterinfo.book_name}</a></li>
        <li class="active">${chapterinfo.title }</li>
    </ol>
    <hr/>
    <nav>
        <ul class="pager">

	<c:if test="${ chapterinfo.prevChapter != 0}">
		  <li class="previous"><a href="${pageContext.request.contextPath}/get_chapter/${chapterinfo.prevChapter}">上一章</a></li>
	</c:if>
          
	<c:if test="${ chapterinfo.nextChapter != 0}">

		 <li class="next"><a href="${pageContext.request.contextPath}/get_chapter/${chapterinfo.nextChapter}">下一章</a></li>
	</c:if>

           

        </ul>
    </nav>
    <div class="btn-group">
        <div id="font-minus" type="button" class="btn btn-default btn-sm">字体-</div>
        <div id="font-plus" type="button" class="btn btn-default btn-sm">字体+</div>
    </div>
    <label class="radio-inline">
        <input type="radio" name="mode" value="day">白天模式
    </label>
    <label class="radio-inline">
        <input type="radio" name="mode" value="night">黑夜模式
    </label>
    <p id="content">
       ${chapterinfo.content } 
    </p>
    <nav>
        <ul class="pager">

	<c:if test="${ chapterinfo.prevChapter != 0}">
		  <li class="previous"><a href="${pageContext.request.contextPath}/get_chapter/${chapterinfo.prevChapter}">上一章</a></li>
	</c:if>
          
	<c:if test="${ chapterinfo.nextChapter != 0}">

		 <li class="next"><a href="${pageContext.request.contextPath}/get_chapter/${chapterinfo.nextChapter}">下一章</a></li>
	</c:if>
        </ul>
    </nav>
    <!--PC和WAP自适应版-->
    <div id="SOHUCS" sid="chapter-429781" ></div>





</div>
<div style="height: 10px;"></div>


</body>
</html>

    