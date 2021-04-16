<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl</title>
</head>
<body>
<c:set var="gender" value="female"/>
<c:if test="${ gender == 'male'}">
	남성
</c:if>
<c:if test="${ gender eq 'female'}">
	여성
</c:if><hr>
<c:set var="age" value="25"/>
<c:choose>
	<c:when test="${age lt 10 }">어린이</c:when>
	<c:when test="${age ge 10 and age le 20 }">청소년</c:when>
	<c:otherwise>성인</c:otherwise>
</c:choose><hr>
<c:forEach var="i" begin="2" end="100" step="2">
	<c:set var="even" value="${even+i}"/>
	<c:set var="odd" value="${odd+i-1}"/>
</c:forEach>
1 ~ 100 짝수 : ${even}<br>
1 ~ 100 홀수 : ${odd}<hr>
<c:forEach var="i" begin="1" end="9">
		구구단 ${i}단<br>
	<c:forEach var="j" begin="1" end="9">
		<c:set var="mul" value="${i*j}"/>
		${i} X ${j} = ${mul}<br>
	</c:forEach>
	<hr>
</c:forEach>
</body>
</html>