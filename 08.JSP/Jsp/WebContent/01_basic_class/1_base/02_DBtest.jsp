<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// 2. 연결 객체 얻어오기
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.94:1521:xe", "SCOTT", "TIGER");
	// 3. sql 문장 만들기
	String sql = "SELECT * FROM EMP";
	// 4. 전송 객체 얻어오기
	PreparedStatement ps = con.prepareStatement(sql);
	// 5. 전송
	ResultSet rs = ps.executeQuery(); 
%>
<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
<div align=center>
<table border=2 cellSpacing=3>
	<tr class="title">
		<td>사번</td>
		<td>사원명</td>
		<td>업무</td>
		<td>관리자사번</td>
		<td>입사일</td>
	</tr>
	<% while(rs.next()){ %>
	<tr>
		<td><%= rs.getString(1) %></td>
		<td>
			<a href="02_DBView.jsp?sabun=<%= rs.getString(1) %>">
				<%= rs.getString(2) %>
			</a>
		</td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
	</tr>
	<%}%>
</table>
<%
//* 닫기
	ps.close();
	con.close();
%>

<a href="02_DBInsert.jsp">emp 테이블에 추가</a><br>
<a href="02_DBUpdate.jsp">emp 테이블 속성 변경</a><br>
<a href="02_DBDelete.jsp">emp 테이블 삭제</a>
</div>
</body>
</html>
