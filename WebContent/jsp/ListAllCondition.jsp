<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投稿管理界面</title>
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
	<h2><a href="../html/index4admin.html">返回管理首页</a></h2>
	<h1 align="center">投稿管理系统</h2>
	<jsp:useBean id="news" class="database.News"/>
	<table align="center" border="1" style="width: 88%;" class="table"><tr id="table" ><td style="width: 50px;">序号</td><td>标题</td><td>作者</td><td>日期</td><td>内容</td><td>操作</td></tr>
	<%
		ArrayList newslist=(ArrayList)news.getAllConditionNews();
		for(Object o:newslist){
			Map m=(HashMap)o;
	%>
		<tr id="table" class="admin"><td style="width: 50px;" class="bianhao"><%= m.get("id") %></td><td class="title"><%= m.get("title") %></td><td class="author"><%= m.get("author") %></td>
		<td class="date"><%= m.get("date") %></td><td style="width: 500px;" class="content"><%= m.get("content") %></td>
		</td><td><a href="usernewsedit.jsp?id=<%=m.get("id")%>">采纳</a>&nbsp;<a href="usernewsdel.jsp?id=<%=m.get("id")%>" onclick="return confirm('确定要删除吗?')">删除</a></td></tr>
	<%
		}
	%>
	</table>
</body>
</html>