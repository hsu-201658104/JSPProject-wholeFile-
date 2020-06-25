<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

 String id2 =(String) request.getParameter("id2");
 String pw2 = (String) request.getParameter("ppp");
 String name = (String) request.getParameter("name");
 String major = (String) request.getParameter("mmm");
    String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/databasetest?serverTimezone=UTC";
     try{
    	 Class.forName(jdbc_driver).newInstance();
			Connection con = DriverManager.getConnection(jdbc_url, "root", "123456");
			Statement st = con.createStatement();
		String stSql = "Update databasetest.final set pw ='" + pw2 + "', major ='" + major+"' where id='"+id2+"'";
		PreparedStatement st2 = con.prepareStatement(stSql);
		st2.executeUpdate();
		st2.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
     String k = id2;
		 %>
 <jsp:include page="detail.jsp?del=<%=k %>"/>

</body>
</html>