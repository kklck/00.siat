/*
form 태그 유효성 검사
*/
$(function () {
    let arr = ["10","20","30","40"];
    $("button").click(function(){
        if($("#ename").val().length>5){// 다섯 글자 넘으면
            alert("사원명 5글자 이내여야 함");
            return;
        }
        if($("#ename").val()==""||$("#empno").val()==""){
            alert("사번과 사원명은 필수입니다.")
            return
        }
        if(arr.indexOf($("#deptno").val())==-1){
            alert("부서 번호는 10, 20, 30, 40 가능")
            return;
        }
        //유효성 검사 통과 시, 전송
        $("form").submit();
    })
})