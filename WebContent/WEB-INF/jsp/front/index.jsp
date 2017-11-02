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
    <title>经典小说在线阅读 - 全部 - (第1页)</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/2b.png">
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css?v=1.0.5">
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/assets/css/novel.css?v=1.0.27">
    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js?v=1.0.5" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/novel.js?v=1.0.5" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/uikit.almost-flat.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/uikit.js"></script>
 <script src="${pageContext.request.contextPath}/assets/js/components/pagination.js"></script>
 <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>


<script>
	
	var pagination;
	//规定，cateid=0代表加载全部分类的图书
	//index:要第几页
	//catetoryid:分类是什么（0，代表全部分类）
	//book_name按书名模糊搜索（如果为空，代表搜索全部图书）
	function loadData(index,catetoryid,book_name)
	{
		$.get('${pageContext.request.contextPath}/getpagedbooks'
				,{pageIndex:index,pageSize:9,category_id:catetoryid,bookname:book_name},function(data)
				{
				
					var jsonObj = JSON.parse(data);
					
					var html = template('table',jsonObj);
					//alert(html);
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
				//#：代表查找全部图书
				$.get('${pageContext.request.contextPath}/getbookcounts/0',{bookname:''},function(param){
					//alert(param)
					//$('#count').html(param);
					
					//var pagination = UIkit.pagination(分页组件元素,配置选项json对象);
					var json=JSON.parse(param);
				
					pagination = UIkit.pagination('.uk-pagination', {items:json.counts,itemsOnPage:9});
				
				loadData(0,0,'');
				
				$('.uk-pagination').on('select.uk.pagination',function(e,index){
					//alert(index);
					//向服务器要第二页数据（每页3条）
				
					loadData(index,0);
					
				})
				}); 
				
				//监听搜索按钮点击事件
				
				$('#btn').click(function(){
					//取得用户在输入框里输入的书名
					var bookname = $('#keyword').val();
					
					//发起ajax请求，获得该书名对应图书列表数据
					$.get('${pageContext.request.contextPath}/getbookcounts/0',{bookname:bookname},function(param){
						//alert(param)
						//$('#count').html(param);
						
						//var pagination = UIkit.pagination(分页组件元素,配置选项json对象);
						var json=JSON.parse(param);
					
						pagination.options.items = json.counts;
						pagination.init();
						//var pagination = UIkit.pagination('.uk-pagination', {items:json.counts,itemsOnPage:9});
					//第二次发ajax
					loadData(0,0,bookname);
					
					$('.uk-pagination').on('select.uk.pagination',function(e,index){
						//alert(index);
						//向服务器要第二页数据（每页3条）
					
						loadData(index,cateid);
						
					})
					}); 
					
				});
				
				
				
				
				
				//监听分类链接点击事件
				
				$('.novel-nav li a').on('click',function(){
					//alert('ddd');
					var cateid = $(this).attr("cateid");
					
					$.get('${pageContext.request.contextPath}/getbookcounts/'+cateid,{bookname:''},function(param){
						//alert(param)
						//$('#count').html(param);
						
						//var pagination = UIkit.pagination(分页组件元素,配置选项json对象);
						var json=JSON.parse(param);
					
						pagination.options.items = json.counts;
						pagination.init();
						//var pagination = UIkit.pagination('.uk-pagination', {items:json.counts,itemsOnPage:9});
					//第二次发ajax
					loadData(0,cateid,'');
					
					$('.uk-pagination').on('select.uk.pagination',function(e,index){
						//alert(index);
						//向服务器要第二页数据（每页3条）
					
						loadData(index,cateid);
						
					})
					}); 
				})
				
			})
</script>

</head>
<body>

<nav class="navbar navbar-default" xmlns="http://www.w3.org/1999/html">
    <div class="container">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <span class="navbar-brand" href="/">
                        <img src="${pageContext.request.contextPath}/assets/images/favicon.png" alt=""> 世界纷扰，沉浸阅读
                    </span>
            </div>


        </div>
    </div>
</nav>

<div class="main container">

    <form class="input-group" action="#" method="get">
        <input id="keyword" type="text" class="form-control" placeholder="搜索书名..">
        <span class="input-group-btn">
                <button type="button" class="btn btn-default" id="btn">搜索</button>
            </span>
    </form>

    <div class="clearfix"></div>


    <h3>小说分类</h3>
    <hr/>
    <ul class="novel-nav">





			<c:forEach items="${categorys}" var="category">
				<li>
					<div>
						<a href="#" cateid="${category.id}">${category.category_name}</a>
					</div>
				</li>
			</c:forEach>




		</ul>

   

    <div class="clearfix"></div>
  
    
    <div id="content"></div>
    
    
    
    <div class="clearfix"></div>
    <!-- 翻页 -->
 <ul class="uk-pagination">

</ul>

    <!--PC和WAP自适应版-->
    <div id="SOHUCS" sid="novels" ></div>

</div>




<script type="text/html" id="table">
	<ul class="bookshelf">



	{{each list as book i}}

		<li>
            <a href="getbook/{{book.id}}">
                <img class="cover" src="${pageContext.request.contextPath}/assets/{{book.book_url}}" alt="{{book.book_name}}" alt="{{book.book_name}}">
                <div>
                    <h4>{{book.book_name}}</h4>
                    <p class="popularity">人气: 1195</p>
                </div>
            </a>
            <a class="author" href="#">{{book.book_author}}</a>
        </li>
		
	{{/each}}

</ul>
	</script>


</body>
</html>



