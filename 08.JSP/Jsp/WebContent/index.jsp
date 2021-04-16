<%@ page
    language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! String name; %>
<% 
    String msg;
    name = "홍길동";
    msg = "안녕하세용";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	한 주를 열심히 보냅시다<br>
    <%= name%>님, <%= msg%>!!!
</body>
</html>