<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ tablib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setAttribute("name", "Kyung");
	session.setAttribute("name", "Yeun");
	application.setAttribute("name", "Woong");
%>

$(requestScope.name)<br>
$(settionScope.name)<br>
$(applicationScope.name)<br>
${name }

</body>
</html>