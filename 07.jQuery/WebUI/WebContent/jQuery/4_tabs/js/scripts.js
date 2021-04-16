$(function(){
    //tabSet 클래스 지정
    let topDiv = $(".tabSet");
    // a 태그들 지정
    let anchors = topDiv.find("ul.tabs a");
    // panel 클래스들 지정
    let panelIdivs = topDiv.find("div.panel")// let panelIdivs = topDiv.find($(anchors).attr("href"));
    //첫 번째~네 번째 목록만 보이는 상태
    anchors.show();
    panelIdivs.hide();
    //on 클래스 가진 a 태그
    let lastAnchor = anchors.filter(".on")
    //위 a 태그에 맞는 panel
    let lastPanel = $(lastAnchor.attr("href"));
    //해당 panel 보이기
    lastPanel.show();
    // ~ 번째 클릭 시
    anchors.click(function(){
        //클릭한 a 태그 하나만 따로 받아
        let currAnchor = $(this);
        //해당 a 태그의 href 값을 아이디로 받는 panel 지정
        let currPanel = $(currAnchor.attr("href"))
        //과거에 열었던 panel 닫고
        lastPanel.hide()
        //현재 panel 열기
        currPanel.show()
        //a 태그에 흰 배경을 넣어주는 on 클래스를 현재 a태그에 삽입
        currAnchor.addClass("on")
        //과거 a 태그에 on 클래스 삭제
        lastAnchor.removeClass("on")
        //다음 동작을 위해 현재 a태그와 panel을 모두 과거화
        lastAnchor = currAnchor;
        lastPanel = currPanel;
    })
})