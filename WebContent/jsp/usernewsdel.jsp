<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除新闻</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="id" name="news"/>
	<%
		int result=news.delUserNews();
		String msg="删除失败,点击确定跳转新闻列表页";
		if(result==1){
			msg="删除成功,点击确定跳转新闻列表页";
		}
	%>
	<script type="text/javascript">window.alert('<%=msg%>');</script>
	<%
		response.setHeader("Refresh", "1;url=../jsp/ListAllCondition.jsp");
	%>
</body>
</html>