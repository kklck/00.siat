<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// 2. 연결객체 얻어오기
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.94:1521:xe", "SCOTT", "TIGER");
	// 3. sql 문장 만들기
	String sql = "DELETE FROM EMP WHERE ENAME=?";	
	// 4. 전송 객체 얻어오기
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,"kim");
	// 5. 전송
	int rs = ps.executeUpdate();
	// * 닫기
	ps.close();
	con.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_DBInsert.jsp</title>
<style>
	body{
		margin: 0 auto;
		text-align: center;
	}
</style>
</head>
<body>
	<h4><%= rs%>삭제 성공</h4>
	<a href="02_DBtest.jsp">목록보기</a>
</body>
</html>