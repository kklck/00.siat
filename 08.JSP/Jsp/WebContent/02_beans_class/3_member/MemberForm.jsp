<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입  </title>
<link href="./signup.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
<script src="./signup.js"type="text/javascript"></script>
</head>
<body>
 <div id="wrap">
        <div id="title"><h1>Sign Up</h1></div>
        <div id="form_div">
            <br>
            <form action="InsertMember.jsp" method="post" name="frm">
                <p class="info">ID</p>
                <input type="text" name="id" id="id" placeholder="ID" class="tbox"><br><br>
                <input type="button" value="Check ID" id="check_id" class="btn">
                <span id="red"></span><br><br>
                <p class="info">Password</p>
                <input type="password" name="password" id="password" placeholder="Password" class="tbox"/><br/><br>
                <p class="info">Confirm Password</p>
                <input type="password" name="passconf" id="passconf" placeholder="Confirm Password" class="tbox"/><br/><br>
                <p class="info">Name</p>
                <input type="text" name="name" id="name"placeholder="Name" class="tbox"/><br/><br>
                <p class="info">Tell</p>
                <input type="text" size="15" name="tel" id="tel" placeholder="Tell" class="tbox"/><br><br>
                <p class="info">Address</p>
                <input type="text" size="40" name="addr" name="addr" placeholder="Address" class="tbox"/><br/><br>
                <div id="btn_div">
                    <input type="submit" value="SIGN UP" class="btn">
                    <input type="reset" name="cancel" value="CANCEL" class="btn"><br/>
                </div>
                </form>
                <br>
        </div>
    </div>
 </body>
</html>
    
    