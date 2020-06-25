<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>DBP 학생관리</h3>
<hr>
<form name="youngchang"action="output.jsp" method="post">
사용자 ID : <input type="text" size="15" name = "id2" value=""><br>
비밀 번호 : <input type="password" size="15" name ="pw2" value=""><br>
           <input type="submit"  value="로그인">
       </form> <input type="submit"  value="가입" onclick="location.href='join.jsp'">
</body>
</html>