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
<form name="youngchang"action="output2.jsp" method="post">
����� ID : <input type="text" size="15" name = "id" value=""><br>
����� Name : <input type="text" size="15" name = "name" value=""><br>
����� password : <input type="text" size="15" name = "password" value=""><br>
����� Major : <input type="text" size="15" name = "Major" value=""><br>
<input type="submit"  value="���� ��û">
</form>


</body>
</html>