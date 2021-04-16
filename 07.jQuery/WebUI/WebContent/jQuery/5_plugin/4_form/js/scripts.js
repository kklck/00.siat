$(function(){
    $("#signup>form").validate({// 데이터 유효성 검사 플러그인
        rules:{
            name:{required:true},//name 속성이 name인 input 태그에 required 검사가 유효한지
            email:{required:true, email:true},
            website:{url:true},
            password:{required:true, minlength:6},//최소 6자리 이하로 써라
            passconf:{equalTo:("#password")}//password와 같은지 
        },
        success:function(label){//유효하다면 
            label.addClass("valid");//클래스 추가하여 라벨 표시
            label.text("ok")//출력 X, 그러나 없으면 정상동작 X
        }
    });
    $(".check-all").click(function(){
        $(".agree").prop("checked",$(this).prop("checked"))
    })
    $(".agree").click(function(){
        let c = 0
        $(".agree").each(function(){
            if($(this).prop("checked")){
                c++
            }
        })
        let ch = (c==5)?true:false;
        $(".check-all").prop("checked",ch)
    })
})