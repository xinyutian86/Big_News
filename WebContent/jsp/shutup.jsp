<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改用户状态</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="news" class="database.Login"/>
	<jsp:setProperty property="*" name="news"/>
	<%
		int result=news.changestate();
		String msg="更改失败,点击确定跳转用户列表页";
		if(result==1){
			msg="更改成功,点击确定跳转用户列表页";
		}
	%>
	<h1><%=msg %></h1>
	<script type="text/javascript">window.alert('<%=msg%>');</script>
	<%
		response.setHeader("Refresh", "1;url=../jsp/ListAllUser.jsp");
	%>
</body>
</html>