<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#id_check").click(function(){
			$.ajax({
				type:"get",
				url:"IdCheck.jsp",
				data:{userId:$(".userinput").val()},
				dataType:"text",
				success:parseId,
				error:function(err){
					alert("error");
					console.log(err);
				}
			})
			function parseId(userId){
				if(userId.trim()=="YES"){
					$("#idmessage").text("중복입니다");
				}else if(userId.trim()=="NO"){
					$("#idmessage").text("중복아닙니다");
				}
					$("#idmessage").show();
			}
		})
	})
</script>

</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;">
</div>
</body>
</html>