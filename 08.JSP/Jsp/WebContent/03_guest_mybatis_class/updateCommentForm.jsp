<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML>
<%int commentNo = Integer.parseInt( request.getParameter("cId"));
String userId = request.getParameter("userId"); 
String Content = request.getParameter("Content"); %>
<html>
<head>
	<meta charset="UTF-8">
<title>수정</title>
</head>
<body>

메세지를 수정해주세요.
<form name="frm" action="updateCommentSave.jsp" >
<input type="hidden" name="commentNo" value=<%=commentNo %>>
<table>
	<tr><td>글번호</td><td><%=commentNo %></td></tr>
	<tr><td>사용자</td><td><input type="text" name="userId" value=<%=userId%> size="15"/></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40"><%=Content %></textarea></td></tr>
	<tr><td><input type="submit" value="입력"/></td></tr>
</table>
</form>
</body>
</html>