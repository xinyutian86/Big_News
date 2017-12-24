<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻分页</title>
</head>
<body>
	<table align="center" border="1" style="width: 88%;" class="table"><tr id="table" ><td style="width: 50px;">序号</td><td>标题</td><td>作者</td><td>日期</td><td>内容</td><td>浏览量</td><td>操作</td></tr>
<%!  
    public static final String DRIVER = "com.mysql.jdbc.Driver";  
    public static final String USER = "root";  
    public static final String PASS = "woaixinke";  
    public static final String URL = "jdbc:mysql://123.207.161.92:3306/news";  
    public static final int PAGESIZE = 5;  
    int pageCount;  
    int curPage = 1;  
%>  
<%  
    //一页放5个  
    String user = null;  
    String pass = null;  
    try{  
        Class.forName(DRIVER);  
        Connection con = DriverManager.getConnection(URL,USER,PASS);  
        String sql = "SELECT * FROM newslist";  
        PreparedStatement stat = con.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);  
        ResultSet rs = stat.executeQuery();  
        rs.last();  
        int size = rs.getRow();  
        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
        String tmp = request.getParameter("curPage");  
        if(tmp==null){  
            tmp="1";  
        }  
        curPage = Integer.parseInt(tmp);  
        if(curPage>=pageCount) curPage = pageCount;  
        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);  
        out.println(curPage);  
        int count = 0;  
          
        do{  
            if(count>=PAGESIZE)break;  
            int id = rs.getInt(1);  
            String title = rs.getString(2);  
            String author = rs.getString(3);  
            String date = rs.getString(4);  
            String content = rs.getString(5);  
            String view = rs.getString(6);  
            count++;  
            %>  
   
        <tr id="table" class="admin"><td style="width: 50px;" class="bianhao"><%=id %></td><td class="title"><%=title %></td><td class="author"><%=author %></td>
		<td class="date"><%=date %></td><td style="width: 500px;" class="content"><%=content %></td><td><%=view%></td>
		<td><a href="edit.jsp?id=<%=id%>">修改</a>&nbsp;<a href="del.jsp?id=<%=id%>" onclick="return confirm('确定要删除吗?')">删除</a></td></tr>
            <%  
        }while(rs.next());  
        con.close();  
    }  
    catch(Exception e){  
          
    }  
%>  
</table>  
<a href = "multipage.jsp?curPage=1" >首页</a>  
<a href = "multipage.jsp?curPage=<%=curPage-1%>" >上一页</a>  
<a href = "multipage.jsp?curPage=<%=curPage+1%>" >下一页</a>  
<a href = "multipage.jsp?curPage=<%=pageCount%>" >尾页</a>  
第<%=curPage%>页/共<%=pageCount%>页  
</body>
</html>