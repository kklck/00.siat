<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%@ page import="member.beans.*" %>
<%
	String id = request.getParameter("id");
	MemberDao dao = MemberDao.getInstance();
	boolean result = dao.isDuplicatedId(id);
	if(result==true){
		out.write("#f05454|중복된 아이디입니다.");
	}else{
		if(id.length()==0){
			out.write("#206a5d|아이디를 입력하세요.");			
		}else{
			out.write("#3c415c|사용 가능한 아이디입니다.");
		}
	}
%>	