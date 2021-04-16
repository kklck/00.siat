/**
 * 
 */
$(function(){
    $("a:eq(0)").prettyPopin({
        width:400,
        callback:function(){//속성 정의하는 곳에 함수를 쓸 땐, 콜백
            alert("팝업 닫힘")
        }
    });
})