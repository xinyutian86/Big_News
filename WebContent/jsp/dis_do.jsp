<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加评论</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="*" name="news"/>
	<%
		int result=news.addDis();
		String msg="添加失败,点击确定跳转新闻页";
		if(result==1){
			int re=news.addDis_Num();
			msg="添加成功,点击确定跳转新闻页";
		}
	%>
	<h1><%=msg %></h1>
	<script type="text/javascript">window.alert('<%=msg%>');</script>
	<%
		String id=request.getParameter("id");
		response.setHeader("Refresh", "1;url=getsingleNews.jsp?id="+id);
	%>
</body>
</html>