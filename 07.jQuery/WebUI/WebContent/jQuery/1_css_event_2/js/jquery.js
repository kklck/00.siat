/**
 * 
 */
$(function(){
    //이미지 태그의
    let img = $(".rollover>img");
    //src 속성 찾기, off=>on 대체
    img.hover(function(){
        let src = $(this).attr("src").replace("off","on");
        //대체한 값 덮어쓰기
        $(this).attr("src",src);
    },function(){
        let src = $(this).attr("src").replace("on","off");
        //대체한 값 덮어쓰기
        $(this).attr("src",src);
    })
    
})