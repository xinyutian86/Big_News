<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件上传结果</title>
</head>
<body>
    <center>
        <h2>${message}</h2>
        <h2>${disc}</h2>
        <h2>文件路径:</br><a href="file://localhost/${path}">${path}</a></h2>
        <img src="file://localhost/${path}" /></br></br>
        <form name="form1" method="get" action="send_img.jsp">
			<input type="hidden" name="path" value="file://localhost/${path}" />
			文件描述:<input type="text" name="disc"/>
			<input type="submit" value="确认提交" />
		</form>
    </center>
</body>
</html>