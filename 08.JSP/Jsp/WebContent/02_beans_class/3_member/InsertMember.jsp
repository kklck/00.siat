<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean  id="mem" class="member.beans.Member">
	<jsp:setProperty name="mem" property="*"/>
</jsp:useBean>
<%
	MemberDao dao = MemberDao.getInstance();
	dao.insertMember(mem);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입 확인  </title>
<link href="./signup.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
<script src="./signup.js"type="text/javascript"></script>
<style>
	#wrap{
		text-align: center;
		height: 200px;
	}
</style>
</head>
<body>
<div id=wrap>
	아이디 : <%=mem.getId() %><br>
	패스워드 : <%=mem.getPassword() %><br>
	이름 : <%=mem.getName() %><br>
	전화 : <%=mem.getTel() %><br>
	주소 : <%=mem.getAddr() %><br>
</div>
</body>
</html>