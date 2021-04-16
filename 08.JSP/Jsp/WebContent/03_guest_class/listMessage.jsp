<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>
 
<%
	// 전체 메세지 레코드 검색 
	String firstRow = request.getParameter("firstRow");
	String endRow = request.getParameter("endRow");
	if(firstRow==null&&endRow==null){
		firstRow = "1";
		endRow = "3"; 	
	}
	ListMessageService service = ListMessageService.getInstance();
	List <Message> mList =  service.getMessageList(firstRow, endRow);		
	int perPage = service.getTotalPage();
	int p = service.getCountPerPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>
<style>
	#wrap{
		width:500px; height: 800px;
		border: 1px solid black;
		border-radius: 10px;
		margin: 0 auto;
		text-align: center;
	}
	table{
		margin: 20px auto;
	}
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
<div id="wrap">
	<% if( mList.isEmpty() ) { %>
 		남겨진 메세지가 하나도~~없습니다. <br>
	<% } else { %>
	<table border="1">
		<%for(Message m : mList){%>
		<tr>	
			<td> <%=m.getMessageId()%></td> 
			<td> <%=m.getGuestName()%></td> 
			<td> <a href="deleteMessage.jsp?messageId=<%=m.getMessageId()%>&firstRow=<%=firstRow%>&endRow=<%=endRow%>">삭제</a></td>			
		</tr>
		<tr>
			<td colspan='3'> 
			<textarea cols=74 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%=m.getMessage()%></textarea>
			</td>
		</tr>
		<%}%>
	</table>
	
	<% } // end if-else %>
	<%for(int i = 0; i< perPage;i++){ 
		int first = 1+p*i, end = p+p*i;
	%>
	<a href="listMessage.jsp?firstRow=<%=first%>&endRow=<%=end%>">[<%=i+1%>]</a>
	<%} %>
	<br>
	<a href="insertMessage.jsp">글쓰기</a>
	</div>
</body>
</html>