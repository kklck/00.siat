<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보확인</title>
</head>
<body>
회원정보를 출력해주세요.
<table>
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
	</tr>
		<tr>
			<td>${mem.userId }</td>
			<td>${mem.userPass }</td>
			<td>${mem.userName }</td>
		</tr>
</table>
</body>
</html>