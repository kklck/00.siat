<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>아약스 get</title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
<script>
	$(function(){
		let param = {
            cate:"book",
            name:"kim"
        }
        //사용자 클라이언트 모르게 뒷단에서 서버 접속
       /*
        $.ajax({
        	type:"get",				//전송 방식,브라우저마다 기본 값이 다르기 때문에 선언을 권장
            data:param,				// 서버로 보낼 data
            url:"01_server.jsp",	//서버에 요청할 페이지
            success:parseData,		// 요청 성공 시 함수 호출.
            error:function(){
                alert("에러");
            }
        });
		*/
		$.get("01_server.jsp",param,parseData);// 간결하고 깔끔하나 가동률이 떨어져 잘 쓰이지 않음
        function parseData(data){	//서버에서 보내주는 데이터(여기서는 out.write)
            let arrData = data.split('|');
            for(let i = 0; i<arrData.length;i++){
                let keyValue = arrData[i].split("=");
                if(keyValue[0].trim() == 'cate'){
                    $("#cate").val(keyValue[1]);
                }else if(keyValue[0].trim() == 'name'){
                    $("#name").val(keyValue[1]);
                }
            }
        }
        alert("시작");
	})
</script>
</head>


<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


