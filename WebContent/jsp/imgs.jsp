<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理界面</title>
<script type="text/javascript">
			function copyUrl2() {
				var Url2 = document.getElementById("biao1");
				Url2.select(); // 选择对象
				document.execCommand("Copy"); // 执行浏览器复制命令
				alert("已复制好，可贴粘");
			}
		</script>
</head>
<body>
	<jsp:useBean id="news" class="database.News"/>
	<%
		ArrayList newslist=(ArrayList)news.getAllImg();
		for(Object o:newslist){
			Map m=(HashMap)o;
	%>
		<h1>图片描述:<%=m.get("disc") %></h1>
		</br>
		<textarea><img src=<%=m.get("path") %>></textarea>
		<%-- <input type="text" value="<img src=<%=m.get("path") %>>"  style="width: 600px;"> --%>
		</br>
		<img src=<%=m.get("path") %>>
		</br>
		<hr />
	<%
		}
	%>
	</table>
</body>
</html>