<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录结果</title>
<style type="text/css">
			#table{
				text-align: center;
				background-color: aquamarine;
				color: black;
			}
		</style>
</head>
<body>
	<jsp:useBean id="news" class="database.Login"/>
	<jsp:setProperty property="username" name="news"/>
	<%
		HashMap userinfo=(HashMap)news.checkuser();
		if(userinfo!=null){
			String name=request.getParameter("username");
			String pass=request.getParameter("password");
			String username=(String)userinfo.get("username");
			String password=(String)userinfo.get("password");
			System.out.println(name+pass+"\n"+username+password);
			if(pass.equals(password)){
				out.println("<h1 align=\"center\">登陆成功!</h1>");
				session.setAttribute("user", name);
				response.setHeader("Refresh", "1;url=./Newindex.jsp");
			}else{
				out.println("<h1 align=\"center\">登陆失败,密码错误!</h1>");
				response.setHeader("Refresh", "1;url=./html/login.html");
			}
		}else{
			out.println("<h1 align=\"center\">用户不存在</h1>");
			response.setHeader("Refresh", "1;url=./html/login.html");
		}
	%>
	</table>
</body>
</html>