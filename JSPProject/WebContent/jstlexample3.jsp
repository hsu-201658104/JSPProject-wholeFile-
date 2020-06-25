<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.hanshin.example.Members"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		for (int i = 2; i < 10; i++) {
		for (int j = 1; j < 10; j++) {
			out.print("결과: ");
			out.print(i + "*" + j + "=" + i * j);
	%><br>
	<%
		}
	%><br>
	<%
		}
	%>
	<!--  for 문을 대체할 수 있는 것. -->
	
	<c:forEach var="i" begin="2" end="10" step="1">		
		<c:forEach var="j" begin="1" end="10" step="1">	
		${i } * ${j } = ${i*j}<br>
		</c:forEach>
	
	</c:forEach>
	<!-- forTokens => for 문과 비슷하지만 특정 문자를 기준으로 분리하는 것(delims) 이후 분리된 문자열을 var 에 저장. -->
	<c:forTokens items="010-1234-5678" delims="-" var="num">
	${num }
	</c:forTokens>
	
	
</body>
</html>