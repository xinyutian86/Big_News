<%@page import="org.apache.catalina.User"%>
<%@page import="com.sun.swing.internal.plaf.metal.resources.metal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加评论</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="*" name="news"/>
	<%
		HashMap newsinfo=(HashMap)news.getSingleNews();
		if(newsinfo!=null){
	%>
		<br /><br /><h1 align="center">欢迎<%=request.getParameter("from") %>为《<%=newsinfo.get("title") %>》说两句</h1>
	<%
		}
	%>
	
	
	
	<%
		String name=(String)session.getAttribute("user");
		if(name==null){
			%>	
				<br /><br /><h1 align="center">您还没有登录，请<a href="../html/login.html">登录</a>之后再评论~~~</h1>
			<%	
			
		}else{
			%>
				<form method="get" action="dis_do.jsp">
					<div align="center">
						<input type="text" name=id value=${param.id} hidden="hidden">
						<input type="text" name=from value=${param.from} hidden="hidden">
						<textarea cols="80%" rows="20" name="discuss" style="margin-left: 20px;"></textarea>
						<input type="submit"  value="评论" />
					</div>
				</form>
			<%
		}
	%>
	
		
</body>
</html>