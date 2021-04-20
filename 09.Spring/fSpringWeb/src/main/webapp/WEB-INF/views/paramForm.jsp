<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠라뽐</title>
</head>
<body>
아이디 : ${param.id }
이름 : ${param.name }
나이 : ${param.age }
<hr>
아이디 : ${memberVO.id }
이름 : ${memberVO.name }
나이 : ${memberVO.age }
<hr>
세션 값 : ${sessionScope.login }
<hr>
</body>
</html>