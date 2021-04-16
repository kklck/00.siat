$(function(){
  $("#topMenu li").hover(function(){
    $(this).css("text-decoration","underline")
  }, function(){
    $(this).css("text-decoration","none")
  });

  $(".mid_m>li").hover(function(){
    $(this).find(".mid_s li").css("display","block")
  }, function(){
    $(this).find(".mid_s li").css("display","none")  
  })
})