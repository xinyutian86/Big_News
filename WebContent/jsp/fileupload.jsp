<%@ page contentType="text/html;charset=GBK" %>
<html>
<head><title> fileupload.jsp </title></head>
<body>
	<b>文件上传----使用commons-fileupload组件</b>
	<form action="../fileupload" method="post" enctype="multipart/form-data">
		文件描述：<input type="text" name="desc" size="20" maxlength="80"><br/>
		文件名称：<input type="file" name="file" size="20" maxlength="80"><br/>
		<input type="submit" value="上传">
	</form>
</body>
</html>