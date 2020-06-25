package com.hanshin.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/fail")
public class fail extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
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

		session.setAttribute("operator", op);
		String Sop = (String) session.getAttribute("operator");
		if (Sop.equals("전송")) {
			out.print("<html><head><title>HI</title></head>");
			out.print("<body>");
			out.print("<h1>Servlet + JDBC</h1>");
			out.print("\n id=" + id + "\n 이름 : " + name + "\n 주소 : " + address + "\n email : " + email + "\n 전공 : "
					+ major + "\n 성별 : " + gender + "\n 태어난 계절 : " + birth + "\n 소개 : " + word);
			out.println("</body></html>");

			response.getWriter().printf("\n id=" + id + "\n 이름 : " + name + "\n 주소 : " + address + "\n email : " + email
					+ "\n 전공 : " + major + "\n 성별 : " + gender + "\n 태어난 계절 : " + birth + "\n 소개 : " + word);

		}
		else if (Sop.equals("DB 보기")) {
			out.print("<html><head><title>HI</title></head>");
			out.print("<body>");
			out.print("<h1>Servlet + JDBC</h1>");
			out.print("\n id=" + id + "\n 이름 : " + name + "\n 주소 : " + address + "\n email : " + email + "\n 전공 : "
					+ major + "\n 성별 : " + gender + "\n 태어난 계절 : " + birth + "\n 소개 : " + word);
			out.println("</body></html>");

			response.getWriter().printf("\n id=" + id + "\n 이름 : " + name + "\n 주소 : " + address + "\n email : " + email
					+ "\n 전공 : " + major + "\n 성별 : " + gender + "\n 태어난 계절 : " + birth + "\n 소개 : " + word);

		}
		else if (Sop.equals("DB 전체 삭제")) {
			
			
			out.print("<html><head><title>HI</title></head>");
			out.print("<body>");
			out.print("<h1>Servlet + JDBC</h1>");
			out.print("\n id=" + id + "\n 이름 : " + name + "\n 주소 : " + address + "\n email : " + email + "\n 전공 : "
					+ major + "\n 성별 : " + gender + "\n 태어난 계절 : " + birth + "\n 소개 : " + word);
			out.println("</body></html>");

			response.getWriter().printf("\n id=" + id + "\n 이름 : " + name + "\n 주소 : " + address + "\n email : " + email
					+ "\n 전공 : " + major + "\n 성별 : " + gender + "\n 태어난 계절 : " + birth + "\n 소개 : " + word);

		}
	}

}
