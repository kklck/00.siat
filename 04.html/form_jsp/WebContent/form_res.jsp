<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
JSP TEST<br>
query = ${param.mycolor}<br>
query = ${param.mydate}<br>

<%
/*	String str = request.getParameter("gender");//str�� �Ķ���͸� ���� ���� gender �׷��� ���� ���� ����
	if(str.equals("male")){
		out.print("����");
	}else if(str.equals("female")){
		out.print("����");
	}*/
/*	if("male".equals(str)){
		out.print("����");
	}else if("female".equals(str)){
		out.print("����");
	}*/ // NullPoint ���� �߻����� ����.
%>
</body>
</html>