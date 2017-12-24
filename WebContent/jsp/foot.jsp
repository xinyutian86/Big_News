<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>记录</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="id" name="news"/>
	<%
		int result=news.addview();
		String msg="失败";
		if(result==1){
			msg="成功";
		}
	%>
	<h1><%=msg %></h1>
	<script type="text/javascript">window.alert('<%=msg%>');</script>
</body>
</html>