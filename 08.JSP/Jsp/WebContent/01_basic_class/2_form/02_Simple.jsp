<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String occupation = request.getParameter("occupation");
	String[] hobby = request.getParameterValues("hobby");
	String str="";
   	if(hobby !=null){
    	for(String temp : hobby){
    		str+=" "+temp+" ";
    	}
   	}else{
   		str = " 취미가 없습니다.";
   	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple</title>
</head>
<body>
	<p align="center"> 
		이름 : <%=name %><br>
		성별 : <%=gender %><br>
		직업 : <%=occupation %><br>
		취미 : <%=str %><br>
	</p>
</body>
</html>