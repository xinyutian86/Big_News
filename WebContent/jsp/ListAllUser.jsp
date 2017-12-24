<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/demo.css" />
        <link rel="stylesheet" type="text/css" href="../css/style4.css" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<title>用户管理界面</title>
<style type="text/css">
			#table{
				text-align: center;
				color: black;
			}
		</style>
</head>
<body>
	<h2><a href="../html/index4admin.html">返回管理首页</a></h2>
	<h1 align="center">用户管理系统</h2>
	
	<jsp:useBean id="news" class="database.Login"/>
	<table align="center" border="1" style="width: 88%;" class="table"><tr id="table" ><td style="width: 50px;">序号</td><td>用户名</td><td>密码</td><td>状态</td><td>备注</td><td>操作</td></tr>
	<%
		ArrayList newslist=(ArrayList)news.alluser();
		String state=null;
		for(Object o:newslist){
			Map m=(HashMap)o;
			if(m.get("state").equals("0")){
				state="正常";}else{
					state="禁言中";}
	%>
		<form name="ifrom" method="get" action="addwhy.jsp">
		<tr id="table" class="admin">
		<td style="width: 50px;" class="bianhao"><%= m.get("id") %></td>
		<td class="title"><%= m.get("username") %></td>
		<td class="author"><%= m.get("password") %></td>
		<td class="date"><%= state %></td>
		<td style="width: 500px;" class="content">
		<input type="text" name="why" value=<%= m.get("why") %>>
		<input type="text" name="username" hidden="hidden" value=<%= m.get("username") %>>
		</td>
		<td>
		<a href="shutup.jsp?username=<%=m.get("username")%>&state=1">禁言</a>&nbsp;
		<a href="shutup.jsp?username=<%=m.get("username")%>&state=0" onclick="return confirm('确定要解禁吗?')">解除禁言</a>&nbsp;
		<input type="submit" value="更改备注">
		</td>
		</tr>
		</form>
	<%
			
		}
	%>
	</table>
</body>
</html>