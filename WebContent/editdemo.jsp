<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>完整demo</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="./ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>
<div>
    <h1 style="font-family: &quot;Microsoft YaHei&quot;; white-space: normal; text-align: center;"><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(84, 141, 212);"><strong><em>新闻编辑</em></strong></span><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;"><strong></strong><strong><em>&nbsp;</em></strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(146, 208, 80);"><strong><em>Demo</em></strong></span></span></h1></h1>

    
</div>
	<div align="center">
	<form name="iform" method="post" action="getdemo.jsp">
			<textarea name="content" id="editor" style="width:1024px;height:700px;">这里写你的初始化内容</textarea>
				<script type="text/javascript" >
    			//实例化编辑器
    			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
   				var ue = UE.getEditor('editor');
				</script>
			<input type="submit" value="提交"/>
	</form>
	</div>
</body>
</html>