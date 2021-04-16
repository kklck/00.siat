$(function(){
    $(".year").text(new Date().getFullYear());
    $(".month").text(new Date().getMonth()+1);
    $(".date").text(new Date().getDate());

    $("#keyword").focusin(function(){
        $(this).css("background","none")
    })
    $("#keyword").focusout(function(){
        if($(this).val()=="")
            $(this).css({"backgroundImage":"url('images/sch_guide.gif')","backgroundRepeat":"no-repeat"})
    })

    //3
    //tabmenu 지정
    let tabmenu = $("#tabmenu");
    // dt 태그들 지정
    let dts = tabmenu.find("dt");
    // dd 태그들 지정
    let dds = tabmenu.find("dd")
    //목록만 보이는 상태
    dts.show();
    dds.hide();
    //첫 번째 dt
    let lastdt = dts.filter(".tab_btn1")
    //그에 맞는 dd
    let lastdd = $(lastdt.next());
    //해당 d 보이기
    lastdd.show();
    // dt 클릭 시
    dts.click(function(){
        //클릭한 dt 하나만 따로 받아
        let currdt = $(this);
        //해당 dd 지정
        let currdd = $(currdt.next())
        //과거에 열었던 dd 닫고
        lastdd.hide()
        //현재 dd 열기
        currdd.show()
        // over사진 삽입
        currdt.find("img").attr("src",currdt.find("img").attr("src").replace("out","over"))
        // out사진 삽입
        lastdt.find("img").attr("src",lastdt.find("img").attr("src").replace("over","out"))
        //다음 동작을 위해 현재 dt dd을 모두 과거화
        lastdt = currdt;
        lastdd = currdd;
    })
    $('#best_bg').bxSlider({
        maxSlides:5,
        slideWidth:210,
        auto:true,
        pause:2000,
        moveSlides:1,
        pager:true,
        // nextSelector: '.next_btn',
        // prevSelector: '.prev_btn'
    });
    $(".bx-wrapper .bx-next").css({
        "right": "10px",
        "background": "url('images/bestbook_btn_right.png'",
        "backgroundRepeat":"no-repeat"
    })
    $(".bx-wrapper .bx-prev").css({
        "right": "10px",
        "background": "url('images/bestbook_btn_left.png')",
        "backgroundRepeat":"no-repeat"
    })
    $(".login_wrap>a>img").click(function(){
        $("#login_f").css("top","30px")
    })
    $(".login_close_btn img").click(function(){
        $("#login_f").css("top","-500px")
    })
    $("#total_btn>a>img").click(function(){
        menu_change()
    })
    $("#total_close").click(function(){
        menu_change()
    })
    function menu_change(){
        $("#total_menu").toggle();
        let m = $("#total_btn img")
        if(m.attr("src").indexOf("out")==-1){
            m.attr("src",m.attr("src").replace("over","out"))
        }else{
            m.attr("src",m.attr("src").replace("out","over"))
        }
    }
})