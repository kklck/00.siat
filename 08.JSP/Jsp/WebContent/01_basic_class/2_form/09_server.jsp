<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="basic.dto.EmpDTO" %>
<%@ page import="basic.dao.EmpDAO" %>
<%
	//얻어온 사용자 입력 값을 EmpDTO로 지정
	EmpDTO dto = new EmpDTO();
	dto.setEmpno(Integer.parseInt(request.getParameter("empno")));
	dto.setEname(request.getParameter("ename"));
	dto.setDeptno(Integer.parseInt(request.getParameter("deptno")));
	dto.setJob(request.getParameter("job"));
	dto.setSal(Integer.parseInt(request.getParameter("sal")));
	EmpDAO dao = EmpDAO.getInstance();
	
	dao.insert(dto);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
<style>
	*{
		text-align: center;
		margin: 0 auto;
	}
</style>
</head>
<body>
 
</body>
</html>