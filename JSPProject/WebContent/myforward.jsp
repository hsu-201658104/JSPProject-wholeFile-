<%@page import="javax.script.ScriptException"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="javax.script.ScriptEngine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	// 전달된 POST parameter 파싱
	
		String value = request.getParameter("value");
		System.out.print(value);
		String operator = request.getParameter("operator");
		
		// exp 파싱 
		String exp = request.getParameter("exp");
		if(exp == null)
			exp = "0";
		
		
		if(operator!=null && operator.equals("=")) {
			// "=" 연산자일 때	-> 계산
			ScriptEngine engine = new ScriptEngineManager().getEngineByName("JavaScript");
			try {
				exp = String.valueOf(engine.eval(exp));
			} catch (ScriptException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		} else {
			// 문자열에 add
			exp += (value==null)?"":value;
			exp += (operator==null)?"":operator;		
			System.out.print(exp);
		}
		
		if(operator!=null && operator.equals("C")) {
			exp = "0";
		}
		request.setAttribute("exp", exp);

		/* RequestDispatcher rd = request.getRequestDispatcher("myjspexample3.jsp");
		rd.forward(request, response) */;
	%>
	<jsp:forward page="myjspexample3.jsp">forward
<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));

	request.setAttribute("exp", num1+num2);
%>
	</jsp:forward>
</body>
</html>