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
		ArrayList<Members> members = new ArrayList<Members>();
	members.add(new Members(1, "Park", "123"));
	members.add(new Members(2, "Young", "123"));
	members.add(new Members(3, "Chang", "123"));

	for (int i = 0; i < members.size(); i++) {
	%>
	<%=members.get(i).getName()%><br>
	<%
		}
	%>
	<!--  for 문을 대체할 수 있는 것. -->
	<%-- 	
	<c:catch var="errMsg">
		<c:out value="<%=member.get(0).getName() %>"></c:out><br>
		<c:out value="<%=member.get(1).getName() %>"></c:out><br>
		<c:out value="<%=member.get(2).getName() %>"></c:out><br>
	</c:catch> 
	--%>
	<c:forEach items="members" var="member">
	${member.name }
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="20" step="3">			<!--  i을 1부터 10까지 2씩 증가시킨다. step=> 뛰어 넘는 크기 (1,4,7...)-->
	${i }
	</c:forEach>
	
	
</body>
</html>