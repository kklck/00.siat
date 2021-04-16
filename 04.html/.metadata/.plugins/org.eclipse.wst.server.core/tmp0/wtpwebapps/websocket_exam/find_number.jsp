<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<!DOCTYPE html>	
<html>	
<head><title>Web Socket Example</title></head>	
<body>	
  <form>	
    <!-- 유저 명을 입력하는 텍스트 박스(기본 값은 anonymous(익명)) -->	
    <label>사용자 명을 정하세용<!-- #user의 textContent -->
    	<input id="user" type="text" value="">
    </label><br>
    <!-- 송신 메시지를 작성하는 텍스트 박스 -->	
    <label>1 ~ 100 사이 숫자를 입력하세요
    	<input id="textMessage" type="number">	
    </label><br>
    <!-- 메세지를 송신하는 버튼 -->	
    <input onclick="sendMessage()" value="Send" type="button">	
    <!-- WebSocket 접속 종료하는 버튼 -->	
    <input onclick="disconnect()" value="Disconnect" type="button">	
  </form>	
  <br />	
  <!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->	
  <textarea id="messageTextArea" rows="10" cols="50"></textarea>	
  <script type="text/javascript">	
    // 「WebSocketEx」는 프로젝트 명	
    // 「broadsocket」는 호스트 명	
    // WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)	
    var webSocket = new WebSocket("ws://localhost:8081/websocket_exam/find_number_socket");	
    // 콘솔 텍스트 에리어 오브젝트	
    //var messageTextArea = document.getElementById("messageTextArea");//옛 할당법
    var messageTextArea = document.querySelector("#messageTextArea");
    // WebSocket 서버와 접속이 되면 호출되는 함수	
    webSocket.onopen = function(message) {	
      // 콘솔 텍스트에 메시지를 출력한다.	
      messageTextArea.value += "Server connect..."+message.data+"\n";	
    };	
    // WebSocket 서버와 접속이 끊기면 호출되는 함수	
    webSocket.onclose = function(message) {	
      // 콘솔 텍스트에 메시지를 출력한다.	
      messageTextArea.value += "Server Disconnect...\n";	
    };	
    // WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수	
    webSocket.onerror = function(message) {	
      // 콘솔 텍스트에 메시지를 출력한다.	
      messageTextArea.value += "error...\n";	
    };	
    /// WebSocket 서버로 부터 메시지가 오면 호출되는 함수	
    webSocket.onmessage = function(evnet) {	
      // 콘솔 텍스트에 메시지를 출력한다.	
      messageTextArea.value += event.data + "\n";	
    };	
    // Send 버튼을 누르면 호출되는 함수	
    function sendMessage() {	
      // 유저명 텍스트 박스 오브젝트를 취득	
      var user = document.getElementById("user");	
      // 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득	
      var message = document.getElementById("textMessage");
      //공백
      if(user.value.trim()==""||message.value.trim()==""){
    	  return
      }
      // 콘솔 텍스트에 메시지를 출력한다.	
      messageTextArea.value += user.value + "(me) => " + message.value + "\n";	
      // WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)	
      webSocket.send("{{" + user.value + "}}" + message.value);	
      // 송신 메시지를 작성한 텍스트 박스를 초기화한다.	
      message.value = "";	
    }	
    // Disconnect 버튼을 누르면 호출되는 함수	
    function disconnect() {	
      // WebSocket 접속 해제	
      webSocket.close();	
    }	
  </script>	
</body>	
</html>
