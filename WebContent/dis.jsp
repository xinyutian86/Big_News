<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加新闻</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="*" name="news"/>
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
		<h1>1:<%=m.get("dis_con") %> &nbsp&nbsp&nbsp&nbsp 2:<%=m.get("from") %> &nbsp&nbsp&nbsp&nbsp 3:<%=m.get("date") %></h1></br>
	<%
	 		}
		}
	%>
</body>
</html>