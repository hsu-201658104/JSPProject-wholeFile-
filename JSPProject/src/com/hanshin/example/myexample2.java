package com.hanshin.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/my2")
public class myexample2 extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print("<html><head><title>Get</title></head>");
		out.print("<body>");
		out.print("<h1>GET</h1>");

		String id = request.getParameter("id");
		String password = request.getParameter("pwd");
		String name = request.getParameter("name");
		String[] depts = request.getParameterValues("dept");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String intro = request.getParameter("introduction");

		out.print("ID : " + id + "<br/>");
		out.print("��й�ȣ : " + password + "<br/>");
		out.print("�̸� : " + name + "<br/>");
		out.print("�к� : ");

		try {
			Thread.sleep(10000);
		} catch (Exception e) {
			System.out.println(e);
		}

		for (int i = 0; i < depts.length; i++) {
			out.print(depts[i] + " ");
		}
		out.print("<br/>");
		out.print("���� : " + gender + "<br/>");
		out.print("birth : " + birth + "<br/>");
		out.print("�Ұ� : " + intro + "<br/>");
		out.print("��ü Query ���ڿ� : " + request.getQueryString());

		out.println("</body></html>");
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		out.print("<html><head><title>Query ���ڿ� �׽�Ʈ</title></head>");
		out.print("<body>");
		out.print("<h1>Post��� Query ���ڿ� ����</h1>");

		ServletInputStream input = request.getInputStream();
		int len = request.getContentLength();
		byte[] buf = new byte[len];
		input.readLine(buf, 0, len);
		String s = new String(buf);
		out.print("��ü ���ڿ� : " + s);
		out.println("</body></html>");
		out.close();

	}

}
