<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>    
        #visual .content-container{	
            height:inherit;
            display:flex; 
            align-items: center;
        }
    </style>
</head>

<body>
<%
String id = request.getParameter("del");

    String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/databasetest?serverTimezone=UTC";
     Connection conn = null;
     PreparedStatement pstmt =null;
     ResultSet rs = null;
     
     try{
    	 Class.forName(jdbc_driver).newInstance();
			Connection con = DriverManager.getConnection(jdbc_url, "root", "123456");
			Statement st = con.createStatement();
			String sql = "SELECT * FROM databasetest.final where id ='"+id+"'";
		rs = st.executeQuery(sql);
      
      
      
      while(rs.next()) { //DB�� ������ Ȯ�� �� �� ���� �ٷ� �ڽ��� ȸ�������� ���� �� �� �ֵ��� �Ͽ���.
        %>        
        <a href="pwcheck.jsp?del=<%=rs.getString("id")%>">id = <%= rs.getString("id") %></a>, name =<%=rs.getString("name") %>, major =<%=rs.getString("major") %><br>
    	
    
    <%
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <div id="body">
		<div class="content-container clearfix">
		<main class="main">
			<h2 class="main title">DBP �л� ����</h2>
			
			
			<div class="search-form margin-top first align-right">
			<input type="submit" value="���" onclick="location.href='list.jsp'" />
			<input type="submit" value="����" onclick="location.href='pwcheck.jsp?del='"/>
			</div>
		</main>
		
			
		</div>
	</div>

    </body>
    
    </html>