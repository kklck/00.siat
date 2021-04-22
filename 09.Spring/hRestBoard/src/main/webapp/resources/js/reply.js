
$(function(){
	$('#replyConfirm').click(function(){
		$.ajax({
             	type :'post',
             	data : { reply : $('#reply').val()},               	
             	url : '../replies/new',
             	success : function(result){
             		alert(result);
             	},
            	error : function(err){
            		alert('error');
            		console.log(err);
            	}
       }); // end of ajax       	
	}); // end of click

	// 댓글버튼이 눌렸을 때
	$('#replyConfirm').click(function(){
		//serialize() jquery api 메소드를 이용해서 form 의 모든 element의 name과 value 값을 넘길수 있음!!         
        var params = $('#replyFrm').serialize();
	
		$.ajax({
             	type :'post',	             	  
             	data : params,
             	url : '../replies/new',
             	success : function(result){
             		alert(result);
             	},
            	error : function(err){
            		alert('error');
            		console.log(err);
            	}
       }); // end of ajax
	}); // end of click



});