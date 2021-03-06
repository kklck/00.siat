<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>글 목록</title>
</head>
<body>
		<h1>게시글 목록</h1>
	<form action="getBoardList.do" method="post"><!-- 안써도 같은 동작 -->
		<select name="searchCondition">
			<option value="title">제목</option><!-- 옵션 내 value는 DB 컬럼명과 같도록 미리 지정 -->
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="searchKeyword"/>
		<input type="submit" value="검색"/>
	</form>
		
	<table border="1">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">등록일</th>
				<th bgcolor="orange" width="100">조회수</th>
			</tr>
			<c:forEach items="${boardList }" var="board">
				<tr>
					<td>${board.seq }</td>
					<td align="left"><a href="getBoard.do?seq=${board.seq }">
							${board.title }</a></td>
					<td>${board.writer }</td>
					<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
					<td>${board.cnt }</td>
				</tr>
			</c:forEach>
		</table>
		<br> <a href="insertBoard.do">새글 등록</a>
</body>
</html>