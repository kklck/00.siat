$(function(){
    let p = $("#intro>img");
    $("#hideButton").click(function(){
        p.hide();
    })
    $("#showButton").click(function(){
        p.show();
    })
    // $("#toggleButton").click(function(){
    //     p.slideToggle();
    // })
    $("#toggleButton").click(function(){
        if(p.is(":visible")){
            p.fadeOut(1000);
        }else{
            p.fadeIn(1000);
        }
    })

    // $("tbody tr:nth-child(odd)").css({"background" : "orange"})
    // $("tr:nth-child(even)").css({"background" : "blue", "color" : "red"})
    $("tbody tr:odd").addClass("table_striping")

    $("tbody tr").hover(function(){
        $(this).addClass("td_mouseover")
    },function(){
        $(this).removeClass("td_mouseover")
    })
})