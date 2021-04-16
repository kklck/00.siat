<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>   
  
 <!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
 <% 
 	request.setCharacterEncoding("utf-8");
 int commentNo = Integer.parseInt( request.getParameter("cId"));
 CommentService.getInstance().deleteComment(commentNo);
 %>
    
    
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>

삭제되었는지 확인해보세요. <br/>
<a href="listComment.jsp">목록보기</a>

</body>
</html>