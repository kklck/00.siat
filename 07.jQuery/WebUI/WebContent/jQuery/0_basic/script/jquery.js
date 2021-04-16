$(function(){
    //첫 번째 요소 찾기
    // $("li:first").css({"border":"2px solid green"})

    //짝수 요소 찾기
    // $("li:odd").css({"border":"2px solid green"})

    //네 번째 요소 찾기
    // $("li:eq(3)").css({"border":"2px solid green"})

    //세 번째 보다 작은 요소 찾기
    // $("li:lt(2)").css({"border":"2px solid green"})

    //첫 번째를 제외한 요소 찾기
    // $("li:not(li:first)").css({"border":"2px solid green"})

    //튀김을 포함한 요소 찾기
    // $("li:contains('튀김')").css({'border':'2px solid green'})

    //li 태그에 마우스 올라가면 bg 클래스 적용, 내려가면 해지
    // $("#food>li:not(#food>li>ul)").hover(function(){
    //     $(this).addClass("bg");
    // },function(){
    //     $(this).removeClass("bg");
    // })

    //어묵 자식 제외
    // $("#food>li:not(li:has(ul))").mouseenter(function(){
    //     $(this).addClass("bg");
    // })
    // $("#food>li:not(li:has(ul))").mouseleave(function(){
    //     $(this).removeClass("bg");
    // })

    //각각 그룹에 첫 번째 li 요소 찾아 클래스 적용
    $("body>ul>li:nth-child(3)").addClass("borderBlue");
})