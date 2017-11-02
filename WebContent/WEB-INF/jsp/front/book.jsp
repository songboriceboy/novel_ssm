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
    <title>${bookInfo.book.book_name}</title>
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
        <li class="active">${bookInfo.book.book_name}</li>
    </ol>
    
    
    <div id="article-description">
        <h3>封面</h3>
        <img class="big-cover" src="${pageContext.request.contextPath}/assets/${bookInfo.book.book_url}" alt="${bookInfo.book.book_intro}">
        <h3>内容简介</h3>
        <div id="description" class="well">
            ${bookInfo.book.book_intro}
        </div>
        <a id="unfold-description" href="#" class="unfold" style="display:none;">展开全部</a>
        <div class="clearfix"></div>
        <h3>作者</h3>
        <div id="author-resume" class="well">
        ${bookInfo.book.book_author}
        </div>
        <a id="unfold-resume" href="#" class="unfold" style="display:none;">展开全部</a>

        <h3>章节</h3>
        <table class="table table-bordered" style="margin-top: 10px;">
            <!--thead>
                <tr><th>章节</th></tr>
            </thead-->
            <tbody>

			<c:forEach items="${bookInfo.chapters}" var = "chapter">
		
				<tr>
                	<td><a href="${pageContext.request.contextPath}/get_chapter/${chapter.id}">${chapter.title}</a></td>
            	</tr>
			</c:forEach>
        


            </tbody>
        </table>
    </div>

</div>

</body>
</html>

    