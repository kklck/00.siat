$(function(){
	$("form").validate({// 데이터 유효성 검사 플러그인
        rules:{
        	id:"required",
            password:{required:true, minlength:4},//최소 4자리 이상으로 써라
            passconf:{equalTo:("#password")},//password와 같은지 
            name:"required"//name 속성이 name인 input 태그에 required 검사가 유효한지
        },
       messages:{
        	id:"아이디를 입력하세요.",
        	password:{required: "비밀번호를 입력하세요.", minlength:  "{0}자리 이상 입력하세요."},
        	passconf:{required: "비밀번호를 다시 입력하세요.",equalTo: "같은 비밀번호를 입력하세요."},
        	name: "이름을 입력하세요."
        }
	})
	$("#check_id").click(function(){
		let id = $("input[name='id']").val();
		$.ajax({
			data:{id:id},
			type:"get",
			dataType:"text",
			url:"CheckId.jsp",
			success:Check,
			error:function(error){
				alert("에러");
				console.log(error);
			}
		})
		function Check(data){
			let dt = data.split("|");
			$("#red").css("color",dt[0].trim());
			$("#red").text(" * "+dt[1]);
		};
	})
	$(".tbox").focusin(function(){
		$(this).attr("placeholder","");
	});
	$(".tbox").focusout(function(){
		if($(this).val()==""){
			let ph = $(this).prev().text();
			console.log(ph);
			$(this).attr("placeholder",ph);
		}
	})
	$("#check_id").click(function(){
		$("#red").css("opacity",0);
		$("#red").animate({
			opacity:1
		})
	})
})