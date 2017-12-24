<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册结果</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="news" class="database.Login"/>
	<jsp:setProperty property="*" name="news"/>
	<%
		int result=news.adduser();
		String msg="注册失败";
		if(result==1){
			msg="注册成功";
		}
	%>
	<script type="text/javascript">window.alert('<%=msg%>');</script>
	<%
		response.setHeader("Refresh", "1;url=../html/login.html");
	%>
</body>
</html>