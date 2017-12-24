<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻管理界面</title>
<link rel="stylesheet" type="text/css" href="../css/demo.css" />
        <link rel="stylesheet" type="text/css" href="../css/style4.css" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<style type="text/css">
			#table{
				text-align: center;
				color: black;
			}
		</style>
</head>
<body>
	<h1 align="center">新闻管理系统</h2>
	<p align="center"><a href="../html/add.html">添加新闻</a></p>
	<jsp:useBean id="news" class="database.News"/>
	<table border="1">
	<!-- <table align="center" border="1" style="width: 88%;" class="table"><tr id="table" ><td style="width: 50px;">序号</td><td>标题</td><td>作者</td><td>日期</td><td>内容</td><td>浏览量</td><td>评论量</td><td>操作</td></tr> -->
	<%
		ArrayList newslist=(ArrayList)news.getAllNews();
		int lenth=newslist.size();
		int b = 3;
		double real = ((double)lenth)/b;
		int d = (int) Math.ceil(real);
		for(int i=0;i<d;i++){
			for(Object o:newslist){
				Map m=(HashMap)o;
				%>
					<tr>
					<td><%=m.get("title") %></td>
					<td><%=m.get("author") %></td>
					<td><%=m.get("date") %></td>
					</tr>
				<%	
			}
			
		}
	%>
	</table>
</body>
</html>