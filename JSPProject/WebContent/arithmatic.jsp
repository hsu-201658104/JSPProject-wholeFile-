<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.hanshin.example.Members"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int start = Integer.parseInt(request.getParameter("start"));
	int end = Integer.parseInt(request.getParameter("end"));
	int step = Integer.parseInt(request.getParameter("step"));
	%>

	<c:forEach var="i" begin="<%= start %>" end="<%= end %>" step="<%= step %>">		
	${i}
	</c:forEach>

</body>
</html>