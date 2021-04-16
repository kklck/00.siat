<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%><!-- 위쪽에 써야 돼ㅑㅁ 변수 선언하고 쓰면 안돼 -->
<%@ page import="info.InfoBean" %>
<jsp:useBean id="bean" class="info.InfoBean">
	<jsp:setProperty name="bean" property="*"/><!-- * 쓰면 알아서 찾아 쓰도록(실제 태그의 name과 bean.java의 변수 이름이 같아야 함 -->
</jsp:useBean>
<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	이   름  : <jsp:getProperty property="name" name="bean"/><br/>
	주민번호 : <jsp:getProperty property="id" name="bean"/><br/>
	성  별   : <jsp:getProperty property="gender" name="bean"/><br/>  
	맞습니까????
</body>
</html>