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
 String major1 = (String) request.getParameter("major");
 
    String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/databasetest?serverTimezone=UTC";
     Connection conn = null;
     PreparedStatement pstmt =null;
     ResultSet rs = null;
     
     try{
    	 Class.forName(jdbc_driver).newInstance();
			Connection con = DriverManager.getConnection(jdbc_url, "root", "123456");
			Statement st = con.createStatement();
			String sql = "SELECT * FROM databasetest.final where major ='"+major1+"'";
		rs = st.executeQuery(sql);
      
      
      
      while(rs.next()) { //DB를 일일이 확인 할 것 없이 바로 자신의 회원정보를 열람 할 수 있도록 하였다.
        %>        
        <a href="detail.jsp?del=<%=rs.getString("id")%>">id=<%= rs.getString("id") %></a>,  major =<%=rs.getString("major") %><br>
    	
    
    <%
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</body>
</html>