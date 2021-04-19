<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String id = request.getParameter("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/re/c.do와 비슷한 /re/c.jsp</title>
</head>
<body>
c.do 요청 requst.getParameter : <%=id %><br>
c.do 요청 jstl : ${ param.id }
</body>
</html>