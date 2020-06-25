<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>output</h3>

<%
String id2 = (String) request.getParameter("id");
String pw2 = (String) request.getParameter("password");
String name2 = (String) request.getParameter("name"); 
String major2 = (String) request.getParameter("Major");
 
 String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/databasetest?serverTimezone=UTC";
	try {
		Class.forName(jdbc_driver).newInstance();
		Connection con = DriverManager.getConnection(jdbc_url, "root", "123456");
		Statement st = con.createStatement();
		String sql = "SELECT * FROM databasetest.final";
		ResultSet rs = st.executeQuery(sql);
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

		// id
		String Correct = "";

		
			for(int i=0; i<id_.length; i++){
				if(id2.equals(id_[i])){
						Correct = "A";
						break;
				}

				else {
					continue;
				}
			}
			if (Correct == "A") {
				out.print("<br>이미 있는 id입니다. 가입할 수 없습니다.");

			}
			else {
				String sqlI = "INSERT INTO databasetest.final VALUES('" + id2 + "','" + pw2 +"','"+name2+"','"+major2+"')";
				st.executeUpdate(sqlI);
				out.print("<br>내용이 추가 되었습니다.");
			}

			out.print("</body></html>");

		


		st.close();
		con.close();
 }catch(Exception e){
  e.printStackTrace();
 }
%>
</body>
</html>
 