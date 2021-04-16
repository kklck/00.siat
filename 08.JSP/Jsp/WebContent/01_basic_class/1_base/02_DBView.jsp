<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//int sabun = 7369;	
	// 8899 사번 가진 사원 정보
	int sabun = Integer.parseInt(request.getParameter("sabun"));
%>
<%
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// 2. 연결객체 얻어오기
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "TIGER");
	// 3. sql 문장 만들기
	String sql = "SELECT * FROM EMP WHERE EMPNO="+sabun;	
	// 4. 전송 객체 얻어오기
	PreparedStatement ps = con.prepareStatement(sql);
	// 5. 전송
	ResultSet rs = ps.executeQuery();
	// * 닫기
	//ps.close();
	//con.close();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
<style>
	body{
		margin: 0 auto;
		text-align: center;
		table-align: center;
	}
</style>
</head>
<body>
<table border=2 cellSpacing=3>	
	<% if(rs.next()){ %>
	<tr>
		<%for(int i = 1; i<=8;i++){ %>
		<td><%= rs.getString(i) %></td>
		<%} %>
	</tr>
	<%}%>
</table>
	<%
	ps.close();
	con.close();
	%>
	<a href="02_DBtest.jsp">목록보기</a>
</body>
</html>