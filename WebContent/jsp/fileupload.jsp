<%@ page contentType="text/html;charset=GBK" %>
<html>
<head><title> fileupload.jsp </title></head>
<body>
	<b>�ļ��ϴ�----ʹ��commons-fileupload���</b>
	<form action="../fileupload" method="post" enctype="multipart/form-data">
		�ļ�������<input type="text" name="desc" size="20" maxlength="80"><br/>
		�ļ����ƣ�<input type="file" name="file" size="20" maxlength="80"><br/>
		<input type="submit" value="�ϴ�">
	</form>
</body>
</html>