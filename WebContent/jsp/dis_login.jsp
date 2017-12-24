<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登录</title>
</head>
<body>
<%
        	String id=request.getParameter("send_id");
        %>
	<div id="login" align="center">  
        <h1>用户登录</h1>  
        <form method="post" action="../LoginServlet"> 
        	<textarea name="send_id" hidden="hidden"><%=id %></textarea>
            <input type="text" required="required" placeholder="用户名" name="username"></input><br/> 
            <input type="password" required="required" placeholder="密码" name="password"></input><br/> 
            <button class="but" type="submit">登录</button></br>
            <button class="but"><a href="register.html">注册</a></button>
        </form>  
    </div>  
</body>
</html>