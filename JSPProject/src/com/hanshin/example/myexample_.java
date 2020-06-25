package com.hanshin.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myexample_")
public class myexample_ extends HttpServlet {
	
	/*
	 * @Override public void service(ServletRequest request, ServletResponse
	 * response) throws ServletException, IOException {
	 * System.out.println("service �����");
	 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
	 * response.getWriter(); out.print("<html><head><title>Service</title></head>");
	 * out.print("<body><h1>service </h1></body>"); out.print("</html>");
	 * out.close(); }
	 */
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet ���� ��");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html><head><title>DoGet</title></head>");
		out.print("<body><h1>doGet </h1></body>");
		out.print("</html>");
		out.close();
	}

	@Override
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
