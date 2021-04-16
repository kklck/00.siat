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
/*	String str = request.getParameter("gender");//str에 파라미터를 통해 받은 gender 그룹의 선택 값이 저장
	if(str.equals("male")){
		out.print("남성");
	}else if(str.equals("female")){
		out.print("여성");
	}*/
/*	if("male".equals(str)){
		out.print("남성");
	}else if("female".equals(str)){
		out.print("여성");
	}*/ // NullPoint 예외 발생하지 않음.
%>
</body>
</html>