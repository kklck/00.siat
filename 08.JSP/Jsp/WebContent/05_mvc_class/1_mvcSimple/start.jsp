<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String prjName = "/Jsp"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>start</title>
</head>
<body>
<h1>기존 방식은?</h1>
<a href="./simpleView.jsp"> 기존방식(상대)</a><br>
<a href="<%=prjName%>/05_mvc_class/1_mvcSimple/simpleView.jsp"> 기존방식(절대)</a>
<hr>
<h1>MVC 방식(모델은 DB가 필요하니 VC방식)</h1>
<a href="<%=prjName%>/SimpleControl">MVC1</a>
<a href="<%=prjName%>/kklck.do">MVC2</a>
<a href="<%=prjName%>/siat.kklck?type=first">MVC3</a>
</body>
</html>