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
<form name="youngchang"action="realUpdate.jsp" method="post">

 <%
 String id2 = (String)request.getParameter("id");
 String pw2 = (String)request.getParameter("pw2");
 
    String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/databasetest?serverTimezone=UTC";
     Connection conn = null;
     PreparedStatement pstmt =null;
     ResultSet rs = null;
     
     try{
    	 Class.forName(jdbc_driver).newInstance();
			Connection con = DriverManager.getConnection(jdbc_url, "root", "123456");
			Statement st = con.createStatement();
			String sql = "SELECT * FROM databasetest.final";
		rs = st.executeQuery(sql);
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		int k = 0;
		while (rs.next()) {
			k++;
		}
		String[] id_ = new String[k];
		String[] pw_ = new String[k];
		String[] name_ = new String[k];
		String[] major_ = new String[k];

		rs = st.executeQuery(sql);
		int t = 0;
		while (rs.next()) {
			id_[t] = rs.getString("id");
			pw_[t] = rs.getString("pw");
			name_[t] = rs.getString("name");
			major_[t] = rs.getString("major");
			t++;
		}
		// id,  pass ������
		String CorrectP = "";
		// id,  pass �ٸ���
		String Correct = "";
		 sql = "SELECT * FROM databasetest.final where id ='"+id2+"'and pw='"+pw2+"'";
		rs = st.executeQuery(sql);
		
		
		
		
			int c = 0;
			for(int i=0; i<id_.length; i++){
				if(id2.equals(id_[i])){
					if(pw2.equals(pw_[i])) {
						CorrectP = "A";
						Correct = null;
						c=i;
						break;
					}
					else {
						CorrectP=null;
						Correct = "A";
						c=i;
						break;
					}
					
				}
				else {
					continue;
				}
			}
			
			
			//id pw ��� �´� �����϶�
			if (CorrectP == "A") {
				while(rs.next()) { 
			        %>        
			       id=<input type="text" name = "id2" value="<%=rs.getString("id") %>" readOnly><br>
			       name =<input type="text"  name = "name" value="<%=rs.getString("name") %>" readOnly><br>
			      password =<input type="text" size="15" name = "ppp" value=""><br>
			       major =<input type="text" size="15" name = "mmm" value=""><br>
			   	<input type="submit" name="update" value="����" onclick="location.href='realUpdate.jsp'">
			    <%
			        }
			}
			//pw �ٸ���
			else if (Correct == "A") {
		        out.print("<br>��й�ȣ�� �ٸ��ϴ�.");
			}
      
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</form>

</body>
</html>