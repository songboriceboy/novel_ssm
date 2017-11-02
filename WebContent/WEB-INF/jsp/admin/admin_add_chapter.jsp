<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        <div class="uk-width-5-6 app-main">
	
	<form class="uk-form" method = "post" action = "${pageContext.request.contextPath}/admin/save_chapter">
		<input type="hidden" name = "book_id" value="${book_id}">
		<input type="hidden" name = "chap_id" value="${chapter.id}">
		<p>
			章节名字：<input type="text" name = "title" value=${chapter.title}>
		</p>
		<p>
			章节内容：
			<!-- <textarea rows="20" cols="50" name="content"></textarea> -->
			<script id="editor" type="text/plain" style="width:1024px;height:500px;">
        </script>
		</p>
	
		<p>
			<input type="submit">
		</p>
	</form>
	
	
        </div>
    </div>
    
    
    <script type="text/javascript">


    $(function () {
        var ue = UE.getEditor('editor');


        //判断ueditor 编辑器是否创建成功
        ue.addListener("ready", function () {
            // editor准备好之后才可以使用
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/ajax_get_chapter/${chapter.id}',
                type: 'GET', //GET
                async: true,    //或false,是否异步
                data: {},
                timeout: 5000,    //超时时间
                dataType: 'html',    //返回的数据格式：json/xml/html/script/jsonp/text
                beforeSend: function (xhr) {
                    console.log(xhr)
                    console.log('发送前')
                },
                success: function (data, textStatus, jqXHR) {
                    //console.log(data)
                    ue.setContent(data);
                    console.log(textStatus)
                    console.log(jqXHR)
                },
                error: function (xhr, textStatus) {
                    console.log('错误')
                    console.log(xhr)
                    console.log(textStatus)
                },
                complete: function () {
                    console.log('结束')
                }
            })
            // ue.setContent(content);

        });
    });

</script>
</body>
</html>