<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%!
	int comNum = new java.util.Random().nextInt(100)+1;
	int comNum2 = (int)Math.floor(Math.random()*100)+1;
%>
<%
	String numStr = request.getParameter("num");//파라미터의 num을 받겠다, %=이면 그대로 출력
	int num = new Integer(numStr);
	String msg = "";
	if(num == comNum){
		msg = "정답입니다";
	}else if(num < comNum){
		msg = "높여주세요";
	}else if(num > comNum){
		msg = "낮춰주세요";
	}else{
		msg = "숫자를 입력해주세요";
	}
%>
<%=msg %>
