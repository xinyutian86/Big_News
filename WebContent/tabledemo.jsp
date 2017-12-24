<%@page import="com.sun.org.apache.regexp.internal.recompile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Eclipse</title>
</head>
<body>
	<h1 align="center">${param.lenth}</h1>
	<table border="1">
	<%
		int lenth=Integer.parseInt(request.getParameter("lenth"));
		int b = 3;
		double real = ((double)lenth)/b;
		int d = (int) Math.ceil(real);
		for(int i=0;i<d;i++){
			%>
				<tr>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				</tr>
			<%
		}
	%>
	</table>
</body>
</html>