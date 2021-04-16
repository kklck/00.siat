<%@ page language="java" contentType="text/html; charset=utf-8" %>
 <%@ page import="java.util.*" %>
 <%@ page import="model.*" %>    
 <%@ page import="service.*" %>  
  
  <!-- 서비스의 메소드 호출  -->
  <%
     //Map condition = new HashMap();
     List<HashMap> mList = EmpService.getInstance().selectEmp();
 %>
  
<!DOCTYPE HTML>
<html> 
<head>
	<meta charset="UTF-8">
<title>목록보기</title>
</head>
<body>
<table border="1">
			<tr>
				<th>사원번호</th>
				<th>사원명</th>
				<th>직업</th>
				<th>월급</th>
				<th>부서번호</th>
			</tr>
			<% for(HashMap vo : mList) {%>
				<tr>
					<td><%= vo.get("EMPNO") %></td>
					<td><%= vo.get("ENAME") %></td>
					<td><%= vo.get("JOB") %></td>
					<td><%= vo.get("SAL") %></td>
					<td><%= vo.get("DEPTNO") %></td>
				</tr>
			<% } %>
		</table>

</body>
</html>