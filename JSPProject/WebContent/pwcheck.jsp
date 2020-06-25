<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>본인 여부 확인</h3>
<form name="youngchang"action="update.jsp" method="post">
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("del");
 %>
사용자 ID :<input type="text" name ="id" value="<%=id %>" readOnly>
비밀 번호 : <input type="password" name ="pw2" value=""><br>
           <input type="submit" value="수정"  onclick="location.href='update.jsp'">           
</form>
</body>
</html>