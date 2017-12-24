<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/eCommerceStyle.css" rel="stylesheet" type="text/css">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script><script src="http://use.edgefonts.net/montserrat:n4:default;source-sans-pro:n2:default.js" type="text/javascript"></script>
<title>新闻详情</title>
</head>
<style type="text/css">
			#wai {
				font-family: Arial;
				border: 2px solid #379082;
				border-radius: 20px;
				align="center";
				width: 97%;
			}
			#ping{
				font-family: Arial;
				border: 2px solid #379082;
				align="center";
				width: 97%;
			}
</style>
<body style="background-color: #E0F7FA">
<%! long foot=1; %>
<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="id" name="news"/>
	
	<%
		int result=news.addview();
		String msg="失败";
		if(result==1){
			msg="成功";
		}
	%>
	
	<%-- <script type="text/javascript">window.alert('<%=msg%>');</script> --%>
	<div id="mainWrapper">
  <header> 
    <!-- This is the header content. It contains Logo and links -->
    <div id="logo"><a href="../Newindex.jsp"><img src="../img/logo.png" alt="sample logo"></div>
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
      <form name="ifrom" method="get" action="Searchindex.jsp">
			<input type="text"  id="search"  name="condition" value="找想要的新闻">
		</form>
      <div id="menubar">
        <nav class="menu">
          <h2><!-- Title for menuset 1 -->搞个大新闻</h2>
          <hr>
          <ul>
            <!-- List of links under menuset 1 -->
            <li><a href="http://www.tsu.edu.cn/321/list.htm" title="Link">泰院新闻</a></li>
            <li><a href="http://computer.tsu.edu.cn/tzgg/list.htm" title="Link">信科新闻</a></li>
            <li><a href="https://www.ithome.com/" title="Link">科技新闻</a></li>
            <li class="notimp"><a href="../html/contribute.html"  title="Link">我要投稿</a></li>
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
		HashMap newsinfo=(HashMap)news.getSingleNews();
		if(newsinfo!=null){
	%>
	<div id="wai">
		
		<h1 align="center" style="color: red;"><%=newsinfo.get("title")%></h1>
		<h4 align="right" style="color: blue;"><%="作者:"+newsinfo.get("author")%>&nbsp;&nbsp;&nbsp;
		<%="发布时间:"+newsinfo.get("date")%>&nbsp;&nbsp;&nbsp;<%="浏览量:"+newsinfo.get("view") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
		<h2 style="color: black;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=newsinfo.get("content")%></h2>
		<h3 align="right"><a href="adddiscuss.jsp?id=${param.id}&from=${user}" style='text-decoration:none;'>我要评论&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h3>
	</div></br></hr></br>
	<hr/>
	<h3 style="color: red;">新闻评论</h3>
	<%
		}
	%>
	</br>
	<div id="wai">
		<%
		ArrayList newslist=(ArrayList)news.getSigleDis();
	 	if(newslist.isEmpty()){
	 %>
	 	<h1 algin="center">还没有人评论哟~</h1>
	 <%
	 	}
	 	else{
	 		for(Object o:newslist){
				Map m=(HashMap)o;
	%>
		<div>
			<%-- <p align="left" style="font-size: 20px;margin-left: 36px;"><%=m.get("from") %></p>
			<p align="center" style="font-size: 20px;"><%=m.get("dis_con") %></p>
			<p align="right" style="font-size: 20px;margin-right: 36px;"><%=m.get("date") %></p> --%>
			<h2>用户:<%=m.get("from") %>在<%=m.get("date") %>评论道:<%=m.get("dis_con") %></h2></br>
		</div>
	<%
	 		}
		}
	%>
	</div>
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
	
	
</body>
</html>