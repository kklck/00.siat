$(function(){
    let p = $("#intro>img");
    $("#hideButton").click(function(){
        p.hide();
    })
    $("#showButton").click(function(){
        p.show();
    })
    $("#toggleButton").click(function(){
        p.slideToggle();
    })
})