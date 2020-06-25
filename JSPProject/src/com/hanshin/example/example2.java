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

@WebServlet("/example2")
public class example2 extends HttpServlet {


	/*
	 * @Override public void service(ServletRequest request, ServletResponse
	 * response) throws ServletException, IOException{ String jdbc_driver =
	 * "com.mysql.cj.jdbc.Driver"; String jdbc_url =
	 * "jdbc:mysql://127.0.0.1:3306/databasetest?serverTimezone=UTC"; try {
	 * Class.forName(jdbc_driver).newInstance(); Connection con =
	 * DriverManager.getConnection(jdbc_url, "root", "123456"); Statement st =
	 * con.createStatement(); String sql =
	 * "CREATE TABLE `databasetest`.`addressbook` (\r\n" +
	 * "  `id` INT NOT NULL,\r\n" + "  `name` VARCHAR(45) NULL,\r\n" +
	 * "  `tel` VARCHAR(45) NULL,\r\n" + "  `email` VARCHAR(45) NULL,\r\n" +
	 * "  `address` VARCHAR(60) NULL,\r\n" + "  PRIMARY KEY (`id`));\r\n" + "";
	 * st.executeUpdate(sql);
	 * 
	 * st.close(); con.close(); } catch (Exception e) { e.printStackTrace(); }
	 * System.out.println("service 실행됨"); }
	 */

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		System.out.printf("cnt = %d\n", cnt); 
		
		String[] values = request.getParameterValues("name");
		for(int i=0; i<values.length; i++) {
		System.out.println(values[i]);	
		}
		String query = request.getQueryString();
		System.out.println(query);
		
		PrintWriter out = response.getWriter();
		for(int i=0; i<cnt; i++) {
			out.print("<html><head><title>doGet</title></head>");
		    out.print("<body><h1>doGet</h1></body>");
		    out.print("</html>");
		}
	    out.close();	
	}	
	
	/*
	 * public void doPost(HttpServletRequest request, HttpServletResponse response)
	 * throws ServletException, IOException { // TODO Auto-generated method stub
	 * response.setContentType("text/html;charset=UTF-8");
	 * 
	 * PrintWriter out = response.getWriter();
	 * out.print("<html><head><title>Query 문자열 테스트</title></head>");
	 * out.print("<body>"); out.print("<h1>Post방식 Query 문자열 추출</h1>");
	 * 
	 * ServletInputStream input = request.getInputStream(); int len =
	 * request.getContentLength(); byte[] buf = new byte[len]; input.readLine(buf,
	 * 0, len); String s = new String(buf); out.print("전체 문자열 : " + s);
	 * out.println("</body></html>"); out.close();
	 * 
	 * }
	 */

}
