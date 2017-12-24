<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="./ueditor/lang/zh-cn/zh-cn.js"></script>
<link href="./css/eCommerceStyle.css" rel="stylesheet" type="text/css">
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
					window.navigate("./jsp/log_off.jsp"); 
					
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
    <div id="logo"><a href="Newindex.jsp"><img src="./img/logo.png" alt="sample logo"></a></div>
    <%
    	String name=(String)session.getAttribute("user");
    	if(name==null){
    		out.println("<div id=\"headerLinks\"><a href=\"./html/login.html\" title=\"Login/Register\" style=\"color: wheat\"><b>登录/注册&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></a></div>");
    	}else{
    		out.println("<div id=\"headerLinks\"><a href=\"javascript:del()\" title=\"Login/Register\" style=\"color: wheat\"><b>"+"欢迎回来:"+name+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></a></div>");
    	}
    %>
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
      <form name="ifrom" method="get" action="./jsp/Searchindex.jsp">
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
            <li class="notimp"><a href="./html/contribute.html"  title="Link">我要投稿</a></li>
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
       <article>
        	<div>
        		
        		<p><span style="color: rgb(0, 176, 240);"><em><strong><span style="font-size: 36px; font-family: &quot;comic sans ms&quot;;">Leave a message</span></strong></em></span></p>
        		
        	</div>
        </article>
      <%!  
    	public static final String DRIVER = "com.mysql.jdbc.Driver";  
    	public static final String USER = "root";  
   		public static final String PASS = "woaixinke";  
    	public static final String URL = "jdbc:mysql://123.207.161.92:3306/news";  
    	public static final int PAGESIZE = 2;  
    	int pageCount;  
    	int curPage = 1;  
	%>  
<%  
    //一页放5个  
    String user = null;  
    String pass = null;  
    try{  
        Class.forName(DRIVER);  
        Connection con = DriverManager.getConnection(URL,USER,PASS);  
        String sql = "SELECT * FROM messages";  
        PreparedStatement stat = con.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);  
        ResultSet rs = stat.executeQuery();  
        rs.last();  
        int size = rs.getRow();  
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount;  
        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);  
        //out.println(curPage);  
        int count = 0;  
          
        do{  
            if(count>=PAGESIZE)break;  
            int id = rs.getInt(1);  
            String uname = rs.getString(2);  
            String message = rs.getString(3);
            String date = rs.getString(4);    
            count++;  
            %>  
        <article>
        	<div>
        		<hr>
        		<p align="left" style="color: red;font-size: 20px" id="wai2">
        		
        		<b>
        		<b style="margin-left: 48px;">用户:<%=uname %></b><br/>
        		<h3 style="margin-left: 148px;"><%=message %></h3><br/>
        		<h3 style="margin-left: 600px;">发布日期:<%=date%></h3>
        		</b>
        		</p>
        		<hr>
        	</div>
        </article>
            <%  
        }while(rs.next());  
        con.close();  
    }  
    catch(Exception e){  
          
    }  
%>
<a href = "Leave_a_message.jsp?curPage=1" >首页</a>  
<a href = "Leave_a_message.jsp?curPage=<%=curPage-1%>" >上一页</a>  
<a href = "Leave_a_message.jsp?curPage=<%=curPage+1%>" >下一页</a>  
<a href = "Leave_a_message.jsp?curPage=<%=pageCount%>" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  

       <div style="margin-left: 8px;">
       <br/><br/>
		<form name="iform" method="post" action="lam_do.jsp">
			你的昵称:<input type="text" name="uname"/>
			<textarea name="message" id="editor" style="width:960px;height:200px;">来留言吧</textarea>
				<script type="text/javascript" >
    			//实例化编辑器
    			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
   				var ue = UE.getEditor('editor');
				</script>
			<input type="submit" value="提交"/>
	</form>
	</div>
		</div>
    </section>
  </div>
  <footer> 
    <!-- This is the footer with default 3 divs -->
   	<div>
		<p style="color: red;font-size: 20px"><img src="./img/ic_live_share_weibo.png" width="66"><b>微博:HDRplus</b></p>
   	</div>
   	<div>
   	  <p style="color: red;font-size: 20px"><img src="./img/ic_live_share_wechatmoment.png" width="66"><b>泰山学院信息科学技术学院</b></p>
   	</div>
   	<div>
   	<p style="color: red;font-size: 20px"><img src="./img/ic_menu_pay_alipay.png" width="66"><b>鲁ICP备17015522号</b></p>
	  
   	</div>
  </footer>
</div>
	
	<!-- <table align="center" border="1" style="width: 88%;" class="table"><tr id="table" ><td style="width: 50px;">序号</td><td>标题</td><td>作者</td><td>日期</td><td>内容</td><td>浏览量</td><td>评论量</td><td>操作</td></tr>
	
	</table> -->
</body>
</html>