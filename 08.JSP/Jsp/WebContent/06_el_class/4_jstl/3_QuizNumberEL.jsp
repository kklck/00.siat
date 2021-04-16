<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!-- 0. JSTL 설정 -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<title> 1~100까지 중 숫자 맞추기 </title>
</head>
<body>

<!-- 1. 이전화면 값 얻어와 guess 변수에 지정 -->
<c:set var="guess" value="${param.guess}"/>

<!-- 2. 그 값이 없다면 임의의 수를 만들어 세션에 지정 -->
<c:if test="${empty guess}">
<%
	int ranNum = (int)(Math.random()*100)+1;
	session.setAttribute("answer", ranNum);
%>
</c:if>

<!-- 3. 세션의 값을 가져와 answer 변수에 지정 -->
<c:set var="answer" value="${sessionScope.answer}"/>

<!-- 4. guess의 변수에 값이 있다면 -->
<!--  (1) guess와 answer값이 같다면 맞춰다고 출력 -->
<c:choose>
	<c:when test="${guess eq answer}"> 맞 춤 </c:when>
	<c:when test="${guess gt answer}"> 정답보다 큽니당 내려가세요</c:when>
	<c:when test="${guess lt answer}"> 정답보다 작습니당 올라가세요</c:when>
</c:choose>
<!--  (2) 다르다면 guess값이 answer값보다 크면 크다고 출력 작으면 작다고 출력 -->
	<hr><hr>
	1부터 100까지 수 중에서 하나를 잘 찍으시오~!! <br/>
	guess : ${guess}, answer : ${answer}
	<form method='get'>
			어떤 수일까요?
			<input type='text' name='guess'>
			<input type='submit' value="Submit">
	</form>
</body>
</html>