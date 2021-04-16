<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		


<%	
	// 1. Cookie 객체 생성
	Cookie c = new Cookie("yourId","roy");
	
	// 2. 속성 부여, 하지 않아도 됌.
	c.setMaxAge(1*60*2); //쿠키 유지 기간 설정. 기본 값은 브라우저 닫을 때 까지, 초 단위
	
	// 3. 클라이언트에 쿠키 전송
	response.addCookie(c);
%>

<html>
<head><title>쿠키</title></head>
<body>

<b>Simple Cookie Example</b><hr>

<br><a href="01_GetCookie.jsp"> 쿠키검색 </a>

</body></html>