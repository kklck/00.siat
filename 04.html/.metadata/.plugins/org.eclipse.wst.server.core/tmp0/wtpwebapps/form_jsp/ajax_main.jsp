<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아약스 메인</title>
<script type="text/javascript">

window.onload = function(){
	document.querySelector("#ok").onclick = fn_click
};
//웹 페이지와 자원을 모두 로드 하면~

function fn_click(){
	//XMLHttpRequest 객체의 생성
	let req = new XMLHttpRequest();
	// 비동기 방식으로 Request를 오픈한다
	req.open('GET', 'time.jsp', true);
	// Request를 전송한다
	req.send();
	
	// XMLHttpRequest.readyState 프로퍼티가 변경(이벤트 발생)될 때마다 콜백함수(이벤트 핸들러)를 호출한다.
	req.onreadystatechange = function (e) {
	  // 이 함수는 Response가 클라이언트에 도달하면 호출된다.
	
	  // readyStates는 XMLHttpRequest의 상태(state)를 반환
	  // readyState: 4 => DONE(서버 응답 완료)
	  if (req.readyState === XMLHttpRequest.DONE) {//응답 완료 되면~
	    // status는 response 상태 코드를 반환 : 200 => 정상 응답
	    if(req.status == 200) {//정상 응답 하면~
	      //console.log(req.responseText);
	      show_data(req.responseText);
	    } else {
	      console.log("Error!");
	    }
	  }
	};	
}
function show_data(txt) {
	let h1 = document.querySelector("h1")
	h1.textContent = txt
};
</script>
</head>
<body>
	<h1>Ajax Test</h1>
	<button id="ok">OK</button>
</body>
</html>