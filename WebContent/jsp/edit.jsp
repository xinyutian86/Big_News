<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
<title>修改新闻信息</title>
</head>
<body>
	<jsp:useBean id="news" class="database.News"/>
	<jsp:setProperty property="id" name="news"/>
	<%
		HashMap newsinfo=(HashMap)news.getNews();
		if(newsinfo!=null){
	%>
		<h2 align="center">修改新闻信息</h2>
		<div align="center">
		<form name="form1" onsubmit="return check()" action="edit_do.jsp" method="get">
		<input type="hidden" name="id" value="<%=newsinfo.get("id")%>" />
		<input type="hidden" name="view" value="<%=newsinfo.get("view")%>" />
						新闻标题:<input type="text" name="title" style="width: 88%;" value="<%=newsinfo.get("title")%>" >
						</br>
						新闻作者:<input type="text" name="author" style="width: 88%;" value="<%=newsinfo.get("author")%>">
						<textarea name="content" id="editor" style="width:88%;height:700px;"><%=newsinfo.get("content")%></textarea>
						<script type="text/javascript" >
    					//实例化编辑器
    					//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
   						var ue = UE.getEditor('editor');
						</script>
						<input type="submit" value="修改"><input type="reset" value="重置">
		</form>
		</div>
	<%
		}
	%>
</body>
</html>