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
	<table border="1" spacing="2">  
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
            int empno = rs.getInt(1);  
            String ename = rs.getString(2);  
            String job = rs.getString(3);  
            String hiredate = rs.getString(4);  
            String sal = rs.getString(5);  
            String comm = rs.getString(6);  
            count++;  
            %>  
        <tr>  
            <td><%=empno%></td>  
            <td><%=ename%></td>  
            <td><%=job%></td>  
            <td><%=hiredate%></td>  
            <td><%=sal%></td>  
            <td><%=comm%></td>  
        </tr>  
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