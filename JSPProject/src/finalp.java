

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/finalp")
public class finalp extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			PrintWriter out = response.getWriter();

			HttpSession session = request.getSession();
			String op = request.getParameter("operator");

			String id = request.getParameter("id2");
			String password = request.getParameter("pw2");

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
			

			session.setAttribute("operator", op);
			String Sop = (String) session.getAttribute("operator");
			// 전송
			if (Sop.equals("로그인")) {
				
				for(int i=0; i<id_.length; i++){
					if(id.equals(id_[i])){
						if(password.equals(pw_[i])) {
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
						CorrectP=null;
						Correct = null;
					}
				}
				
				
				// 비번 다를때
				if (Correct == "A") {
					out.print("<br>비밀번호가 다릅니다.");

				}
				// 비밀번호 같을 때
				else if (CorrectP == "A") {
					 //list 로 보내기


				}

				// 같은 것이 없을때
				else {
					out.print("<br>등록 되어 있지 않은 id입니다.");
				}

				out.println("</body></html>");
			}

			if (Sop.equals("가입")) {
				for(int i=0; i<id_.length; i++){
					if(id.equals(id_[i])){
						if(password.equals(pw_[i])) {
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
						CorrectP=null;
						Correct = null;
					}
				}

				if (Correct == "A"||CorrectP=="A") {
					out.print("<br>이미 등록되어있는 id.");

				}
				else {
					String sqlI = "INSERT INTO databasetest.member VALUES('" + id + "','" + password +"')";
					st.executeUpdate(sqlI);
					out.print("<br>내용이 추가 되었습니다.");
				}

				out.print("</body></html>");

			}


			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
