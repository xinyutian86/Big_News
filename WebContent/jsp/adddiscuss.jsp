<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
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
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="*" name="news"/>
	<jsp:useBean id="user" class="database.Login"/>
	<jsp:setProperty property="*" name="user"/>
	
	<div id="mainWrapper">
  <header> 
    <!-- This is the header content. It contains Logo and links -->
    <div id="logo"><a href="../Newindex.jsp"><img src="../img/logo.png" alt="sample logo"></div>
       <%
       	String state=null;
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
		<br /><br /><h1 align="center">欢迎<%=request.getParameter("from") %>为《<%=newsinfo.get("title") %>》说两句</h1>
	<%
		}
	%>
	
	<%
		HashMap userinfo=(HashMap)user.checkuser2();
		if(userinfo!=null){
	%>
		
	<%
		state=(String)userinfo.get("state");
		}
	%>
	
	<%
		if(name==null){
			%>	
				<br /><br /><h1 align="center">您还没有登录，请<a href="dis_login.jsp?send_id=<%=request.getParameter("id")%>">登录</a>之后再评论~~~</h1>
			<%	
			
		}else if(state!="1"){
			%>
				<form method="get" action="dis_do.jsp">
					<div align="center">
						<input type="text" name=id value=${param.id} hidden="hidden"></br>
						<input type="text" name=from value=${param.from} hidden="hidden">
						
						<textarea   name="discuss" id="editor" style="width: 98%;height: 400px;"></textarea>
						<script type="text/javascript" >
    					//实例化编辑器
    					//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
   						var ue = UE.getEditor('editor');
						</script>
						<input type="submit"  value="评论" />
					</div>
				</form>
			<%
		}else{
			%>
				<br /><br /><h1 align="center">您已被禁言，请<a href="../jsp/why.jsp?username=${param.from}">查看原因</a></h1>
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
	
	
</body>
</html>