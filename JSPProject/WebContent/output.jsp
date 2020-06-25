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

String id2 = (String) request.getParameter("id2");
String pw2 = (String) request.getParameter("pw2");
 

 
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
		// id,  pass 같을때
		String CorrectP = "";
		// id,  pass 다를때
		String Correct = "";
		
			
			for(int i=0; i<id_.length; i++){
				if(id2.equals(id_[i])){
					if(pw2.equals(pw_[i])) {
						CorrectP = "A";
						Correct = null;
						break;
					}
					else {
						CorrectP=null;
						Correct = "A";
						break;
					}
					
				}
				else {
					continue;
				}
			}
			
			
			// 비번 다를때
			if (Correct == "A") {
				out.print("<br>비밀번호가 다릅니다.");

			}
			// 비밀번호 같을 때
			else if (CorrectP == "A") {
				 //list 로 보내기
				out.println("<script>");
		        out.println("location.href='list.jsp'"); 
		        out.println("</script>");
			}

			// 같은 것이 없을때
			else {
				out.print("<br>등록 되어 있지 않은 id입니다.");
			}

			out.println("</body></html>");
	


		st.close();
		con.close();
 }catch(Exception e){
  e.printStackTrace();
 }
%>

</body>
</html>
 