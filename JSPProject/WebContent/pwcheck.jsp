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
<h3>���� ���� Ȯ��</h3>
<form name="youngchang"action="update.jsp" method="post">
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("del");
 %>
����� ID :<input type="text" name ="id" value="<%=id %>" readOnly>
��� ��ȣ : <input type="password" name ="pw2" value=""><br>
           <input type="submit" value="����"  onclick="location.href='update.jsp'">           
</form>
</body>
</html>