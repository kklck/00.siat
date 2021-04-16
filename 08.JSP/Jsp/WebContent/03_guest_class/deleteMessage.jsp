<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% String m = request.getParameter("messageId"); 
String firstRow = request.getParameter("firstRow");
String endRow = request.getParameter("endRow");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 삭제 </title>
</head>
<body>
	메세지를 삭제하려면 암호를 입력하세요. <br/><br/>
	<form action="deleteConfirm.jsp?firstRow=<%=firstRow%>&endRow=<%=endRow%>" method="post">
	<input type="hidden" name="messageId" value="<%=m%>"/>
		암호 : <input type="password" name="password"/>
		<input type="submit" value="메세지 삭제"/>
	</form>
</body>
</html>