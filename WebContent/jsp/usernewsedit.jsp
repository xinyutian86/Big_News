<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改新闻信息</title>
</head>
<body>
	<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="id" name="news"/>
	<%
		HashMap newsinfo=(HashMap)news.getUserNews();
		if(newsinfo!=null){
	%>
		<h2 align="center">修改新闻信息</h2>
		<form name="form1" onsubmit="return check()" action="add.jsp" method="post">
			<input type="hidden" name="id" value="<%=newsinfo.get("id")%>" />
			<table align="center" width="60%" border="1">
				<tr>
					<th width="30%">新闻标题</th>
					<td><input type="text" name="title" style="width: 98%;" value="<%=newsinfo.get("title")%>" ></td>
				</tr>
				<tr>
					<th width="30%">新闻作者</th>
					<td><input type="text" name="author" style="width: 98%;" value="<%=newsinfo.get("author")%>"></td>
				</tr>
				<tr>
					<th width="30%">新闻内容</th>
					<td style="height: 200px;"><textarea name="content" style="width: 98%;height: 200px;"><%=newsinfo.get("content")%></textarea></td>
				</tr>
				<tr><th colspan="2"><input type="submit" value="采纳"><input type="reset" value="重置"></th></tr>
			</table>
		</form>
	<%
		}
	%>
</body>
</html>