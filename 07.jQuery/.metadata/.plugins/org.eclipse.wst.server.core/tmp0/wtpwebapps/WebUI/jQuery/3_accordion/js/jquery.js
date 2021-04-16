/**
 * 
 */
$(function(){
    //해당 클래스 각각 탐색
    $(".accordion").each(function(){
        //모든dt
        let allDt = $(this).find("dt");
        //모든dd
        let allDd = $(this).find("dd");
        //모든dd 숨기기
        allDd.hide()
        //dt에 커서 포인터
        allDt.css("cursor","pointer")
        //dt 클릭할 때 해당 dd만 뜨게
        allDt.click(function(){
            //dt에 커서 포인터
            allDt.css("cursor","pointer")
            //일단 모든 dd를 닫고
            allDd.hide()
            //해당 dt 다음에 오는 dd가 열려있으면
            if($(this).next().attr("display")!="none")
                //커서에 포인터 해제
                $(this).css("cursor","default")
            //해당 dt 다음에 오는 dd만 열기
            $(this).next().show();
        })
    })
})