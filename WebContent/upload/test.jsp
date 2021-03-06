<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/eCommerceStyle.css" rel="stylesheet" type="text/css">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script><script src="http://use.edgefonts.net/montserrat:n4:default;source-sans-pro:n2:default.js" type="text/javascript"></script>
<title>最新闻</title>
</head>
<style type="text/css">
			#wai {
				font-family: Arial;
				border: 2px solid #379082;
				border-radius: 20px;
				padding: 3px 3px;
				width: 90%;
			}
		</style>
		<script type="text/javascript">
			function del(){
				if(confirm("退出登录?")==true){
					window.navigate("log_off.jsp"); 
					
					alert("已注销");
				}else{
					history.back();
				}
			}
		</script>
<body style="background-color: #E0F7FA">

<jsp:useBean id="news" class="database.News"/>

<div id="mainWrapper">
  <header> 
    <!-- This is the header content. It contains Logo and links -->
    <div id="logo"> <!-- <img src="logoImage.png" alt="sample logo"> --> 
      <!-- Company Logo text --> 
      最新闻 </div>
    <%
    	String name=(String)session.getAttribute("user");
    	if(name==null){
    		out.println("<div id=\"headerLinks\"><a href=\"../html/login.html\" title=\"Login/Register\" style=\"color: wheat\"><b>登录/注册&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></a></div>");
    	}else{
    		out.println("<div id=\"headerLinks\"><a href=\"javascript:del()\" title=\"Login/Register\" style=\"color: wheat\"><b>"+"欢迎回来:"+name+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></a></div>");
    	}
    %>
    <!-- <div id="headerLinks"><a href="login.html" title="Login/Register" style="color: wheat"><b>登录/注册&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></a></div> -->
  </header>
  <section id="offer"> 
   	<div>
   		<h2 style="color:red;font-family: Constantia, Lucida Bright, DejaVu Serif, Georgia, serif">IT之家</h2>
    <p style="color:beige;font-size: 20px;font-family:' 微软雅黑'"><b>爱科技，爱这里</b></p>
   	</div>
    <!-- The offer section displays a banner text for promotions -->
    
  </section>
  <div id="content">
    <section class="sidebar"> 
      <!-- This adds a sidebar with 1 searchbox,2 menusets, each with 4 links -->
      <input type="text"  id="search" value="找你想找的">
      <div id="menubar">
        <nav class="menu">
          <h2><!-- Title for menuset 1 -->搞个大新闻</h2>
          <hr>
          <ul>
            <!-- List of links under menuset 1 -->
            <li><a href="#" title="Link">泰院新闻</a></li>
            <li><a href="#" title="Link">信科新闻</a></li>
            <li><a href="#" title="Link">科技新闻</a></li>
            <li class="notimp"><!-- notimp class is applied to remove this link from the tablet and phone views --><a href="#"  title="Link">我要投稿</a></li>
          </ul>
        </nav>
        <nav class="menu">
          <h2>来呀，快活呀</h2>
          <!-- Title for menuset 2 -->
          <hr>
          <ul>
            <!--List of links under menuset 2 -->
            <li><a href="#" title="Link">留言板</a></li>
            <li><a href="#" title="Link">表白墙</a></li>
            <!--<li><a href="#" title="Link">Link 3</a></li>
            <li class="notimp"><a href="#" title="Link">Link 4</a></li>-->
          </ul>
        </nav>
      </div>
    </section>
    <section class="mainContent">
      <div class="productRow"><!-- Each product row contains info of 3 elements -->
      
      <%
		ArrayList newslist=(ArrayList)news.getAllNews();
		for(Object o:newslist){
			Map m=(HashMap)o;
	%>
		<article>
        	<div>
        		<p align="left" style="color: red;font-size: 20px" id="wai">
        		<img src="../img/ic_menu_pay_alipay.png" width="66">
        		<b>
        		<a href="getsingleNews.jsp?id=<%=m.get("id")%>"><%=m.get("title") %></a>
        		</b>
        		</p>
        	</div>
        </article>
	<%
		}
	%>
       
		</div>
    </section>
  </div>
  <footer> 
    <!-- This is the footer with default 3 divs -->
   	<div>
		<p style="color: red;font-size: 20px"><img src="../img/ic_live_share_weibo.png" width="66"><b>微博:HDRplus</b></p>
   	</div>
   	<div>
   	  <p style="color: red;font-size: 20px"><img src="../img/ic_live_share_wechatmoment.png" width="66"><b>泰山学院信息科学技术学院</b></p>
   	</div>
   	<div>
   	<p style="color: red;font-size: 20px"><img src="../img/ic_menu_pay_alipay.png" width="66"><b>鲁ICP备17015522号</b></p>
	  
   	</div>
  </footer>
</div>
	
	<!-- <table align="center" border="1" style="width: 88%;" class="table"><tr id="table" ><td style="width: 50px;">序号</td><td>标题</td><td>作者</td><td>日期</td><td>内容</td><td>浏览量</td><td>评论量</td><td>操作</td></tr>
	
	</table> -->
</body>
</html>