package com.hanshin.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.ResultSet;

@WebServlet("/Servlet_JDBC")
public class Servlet_JDBC extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://127.0.0.1:3306/databasetest?serverTimezone=UTC";
		try {
			Class.forName(jdbc_driver).newInstance();
			Connection con = DriverManager.getConnection(jdbc_url, "root", "123456");
			Statement st = con.createStatement();
			String sql = "SELECT * FROM databasetest.member";
			ResultSet rs = st.executeQuery(sql);
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();

			HttpSession session = request.getSession();
			String op = request.getParameter("operator");

			String id = request.getParameter("id");
			String password = request.getParameter("pwd");
			String name = request.getParameter("name");
			String address = request.getParameter("tel");
			String email = request.getParameter("email");
			String major = request.getParameter("dept");
			String gender = request.getParameter("gender");
			String birth = request.getParameter("birth");
			String word = request.getParameter("introduction");
			int k = 0;
			while (rs.next()) {
				k++;
			}
			String[] id_ = new String[k];
			String[] password_ = new String[k];
			String[] name_ = new String[k];
			String[] address_ = new String[k];
			String[] email_ = new String[k];
			String[] major_ = new String[k];
			String[] gender_ = new String[k];
			String[] birth_ = new String[k];
			String[] word_ = new String[k];

			rs = st.executeQuery(sql);
			int t = 0;
			while (rs.next()) {
				id_[t] = rs.getString("id");
				password_[t] = rs.getString("password");
				name_[t] = rs.getString("name");
				address_[t] = rs.getString("address");
				email_[t] = rs.getString("email");
				major_[t] = rs.getString("major");
				gender_[t] = rs.getString("gender");
				birth_[t] = rs.getString("birth");
				word_[t] = rs.getString("word");
				t++;
			}
			// id, name �� ����, pass ������
			String CorrectP = "";
			// id, name �� ����, pass �ٸ���
			String Correct = "";
			for (int i = 0; i < id_.length; i++) {
				if (id.equals(id_[i])) {
					if (name.equals(name_[i])) {
						if (password.equals(password_[i])) {
							CorrectP = "A";
							Correct = null;
							break;
						} else {
							Correct = "A";
							CorrectP = null;
							break;
						}
					} else {
						Correct = null;
						CorrectP = null;
					}
				} else {
					Correct = null;
					CorrectP = null;
				}

			}

			session.setAttribute("operator", op);
			String Sop = (String) session.getAttribute("operator");
			// ����
			if (Sop.equals("����")) {
				out.print("<html><head><title>201658104 �ڿ�â</title></head>");
				out.print("<body>");
				out.print("<h1>Servlet + JDBC</h1>");
				out.print("\n id=" + id + ", �̸� : " + name + ", �ּ� : " + address + ", email : " + email + ", ���� : "
						+ major + ", ���� : " + gender + ", �¾ ���� : " + birth + ", �Ұ� : " + word);

				// ��� �ٸ���
				if (Correct == "A") {
					out.print("<br>��й�ȣ�� �ٸ��ϴ�.");

				}
				// ��й�ȣ ���� ��
				else if (CorrectP == "A") {
					String stSql = "Update databasetest.member set address ='" + address + "',email ='" + email
							+ "',major ='" + major + "',gender ='" + gender + "',birth ='" + birth + "',word ='" + word
							+ "' where id ='" + id + "'";
					PreparedStatement st2 = con.prepareStatement(stSql);
					st2.executeUpdate();
					st2.close();
					out.print("<br>������Ʈ �Ǿ����ϴ�.");

				}

				// ���� ���� ������
				else {
					String sqlI = "INSERT INTO databasetest.member VALUES('" + id + "','" + password + "','" + name
							+ "','" + address + "', '" + email + "','" + major + "','" + gender + "','" + birth + "','"
							+ word + "')";
					st.executeUpdate(sqlI);
					out.print("<br>������ �߰� �Ǿ����ϴ�.");
				}

				out.println("</body></html>");
			}

			if (Sop.equals("DB����")) {
				out.print("<html><head><title>201658104 �ڿ�â</title></head>");
				out.print("<body>");
				out.print("<h1>Servlet + JDBC</h1>");

				for (int i = 0; i < id_.length; i++) {
					out.print("id=" + id_[i] + ", �̸� : " + name_[i] + ", �ּ� : " + address_[i] + ", email : " + email_[i]
							+ ", ���� : " + major_[i] + ", ���� : " + gender_[i] + ", �¾ ���� : " + birth_[i] + ", �Ұ� : "
							+ word_[i] + "<br>");

				}
				out.print("</body></html>");

			}

			if (Sop.equals("DB��ü����")) {
				out.print("<html><head><title>201658104 �ڿ�â</title></head>");
				out.print("<body>");
				out.print("<h1>Servlet + JDBC</h1>");
				String stSql = "delete from databasetest.member";
				PreparedStatement st2 = con.prepareStatement(stSql);
				st2.executeUpdate();
				st2.close();
				out.print("DB�� ��� ������ �����Ͽ����ϴ�.");
				out.print("</body></html>");

			}

			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
