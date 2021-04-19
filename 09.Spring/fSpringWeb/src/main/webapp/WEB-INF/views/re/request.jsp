<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request.jsp</title>
</head>
<body>
request.do 요청 param으로 <br><br>
<hr>
아이디 : ${param.id }<br>
이름 : ${param.name }<br>
나이 : ${param.age }<br>
<hr>
request.do 요청 MemberVO 클래스의 첫 글자 소문자로<br><br>
<hr>
권장!!!! - @ModelAttribute 쓰면 동작 안함<br>
아이디 : ${memberVO.id }<br>
이름 : ${memberVO.name }<br>
나이 : ${memberVO.age }<br>
<hr>
request.do 요청 컨트롤러에서 매개변수에 @ModelAttribute<br><br>
<hr>
@ModelAttribute 쓰면 VO 접근 불가
아이디 : ${vo.id }<br>
이름 : ${vo.name }<br>
나이 : ${vo.age }<br>
</body>
</html>