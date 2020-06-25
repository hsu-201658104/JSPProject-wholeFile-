<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.hanshin.example.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- c:out 사용하려면 위에 선언해 줘야함, JSP 표현식( <%-- <%= %> --%> )를 대체하기 위한 것. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//request.setAttribute("name", "Kyung");	//설정 안하면 default 값
	//request.setAttribute("name", "<font color=blue>박영창</font>");		//글씨가 파란색으로 
	/* 
	Member member = new Member();
	member.setName("Park");	 
	*/					//set 해줌
	%>
	<%-- 
	<c:set value="<%=new Member() %>" var="member" />			<!-- 이걸 추가하면 member 라는 변수에 new Member()를 저장 -> 이후 member를 ${member }를 통해서 가져옴 -->
	<c:out value="<%=member.getName() %>"/>			<!--  할수없이 <%= %> 사용 -->
	<c:out value="${member.name } "/>				<!-- 객체에 속성을 어떤 값(member)로 할 수 있다. -->
	<c:set value="yeon" property="name"  />		<!--  한줄로 줄일 수 있다. -->
	<c:set value="<%=new Member() %>" var="member" /> 
	--%>


	<%-- 	
<c:set value="Kyung" var="name" scope="request"/>			<!--<% request.setAttribute("name", "Kyung"); %> 사용 안해도 됨.-->
	
${requestScope.name }<br>			<!--태그 이해 해서 글씨가 파란색으로 출력  --> 
<c:out value ="${requestScope.name }" default="디폴트", escapeXml="false"/>	<!-- 태그를 이해 못함 <font color=blue>박영창</font>으로 출력  -->
														<!--  escapeXml ="false"를 해야 파란색 글씨로 나옴 true 하면 <font color=blue>박영창</font>출력 -->
--%>

	<%--  	
	<c:set var="name" value="Park"/>
 	${name }<br>
 	<c:remove var="name" />
 	${name } 
 --%>
	<%-- 에러가 났을때 try/catch 와 같은 기능을 하는 것. --%>

	<%--  	
		<c:catch var="errMsg">
 		<%=2/0 %>				<!--  여기서 잡힌 에러메시지가 errMsg에 저장됨. -->
 		</c:catch>
 		에러메시지: ${errMsg }
  --%>
  
<!--  else if 문 구현 -->
<%-- 
	<c:set var="name" value="Young" />
	<c:choose>
		<c:when test="${name == 'Young' }">
  	Young이 저장되어있습니다.
  </c:when>
		<c:when test="${name == 'park'}">
  Park이 저장되어있습니다.
  </c:when>
		<c:otherwise>
  park, young 둘다 아닙니다.
  </c:otherwise>
	</c:choose>
 --%>




</body>
</html>