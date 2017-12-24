<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传图片</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="*" name="news"/>
	<%
		int result=news.addImg();
		String msg="失败";
		if(result==1){
			msg="成功";
		}
	%>
	<script type="text/javascript">window.alert('<%=msg%>');</script>
	<%
		response.setHeader("Refresh", "1;url=Newindex.jsp");
	%>
</body>
</html>