/**
 * 
 */
$(function(){
    $("p#intro").animate({
        "padding":"20px",
        "fontSize":"30px"
    },2000)
    $("#navigation li").hover(function(){
        $(this).animate({
            "paddingLeft":"+=15px",
        },500)
    }, function(){
        $(this).animate({
            "paddingLeft":"-=15px",
        },500)
    });
    $(window).scroll(function(){//스크롤 움직일 때 마다
        //네비게이션 내 요소들이 문서의 top위치에 고정
        $("#navigation").css({"top":$(document).scrollTop()})
    })
})