<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View - autoScan.jsp</title>
</head>
<body>
<h4> 여기는 View ~</h4>
회원정보 : ${vo}<br>
아이디 : ${vo.getId() }<br>
이름 : ${vo.name }<br><!-- get 함수든 함수처럼 불러오든 가능 -->
나이 : ${vo.getAge() }<br>
</body>
</html>