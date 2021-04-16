<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>
<script>
	$(function(){
		$("input[type='button']").click(function(){
			$("form").submit();
			/* let param = {
					guestName:$("input[name='guestName']").val(),
					password:$("input[name='password']").val(),
					message:$("textarea[name='message']").val()
				}
			$.ajax({
				data:param,
				type:"post",
				dateType:"text",
				url:"",
				success:Check,
				error:function(e){
					alert("에러");
					console.log(e);
				},
			})
			function Check(txt){
				
			} */
		})
	})
</script>
</head>

<body>

	<form action="saveMessage.jsp" name="frm" method="post">
		이름 : <input type="text" name="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input type="button" value="메세지 남기기">
	</form>
</body>
</html>