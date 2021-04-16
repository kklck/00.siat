/**
 * 
 */
$(function(){
    //이미지 로드를 위한 배열
    let img = [["cpu_i5","cpu_i7","cpu_i9"],["ram_hp","ram_micron_16gb","ram_samsung_8gb"],["vga_2060","vga_3090","vga_6900"],["hdd_toshiba_1tb","hdd_wd_4.0tb","hdd_seagate"], ["ssd_SK hynix","ssd_XPG","ssd_samsung"]]
    //가격 로드를 위한 배열
    let price = [[250000,300000,450000],[45000,90000,50000],[650000,3000000,2160000],[55000,110000,115000],[98000,70000,100000]]
    //이름 로드를 위한 배열
    let name = [["인텔 코어i5-10세대 10500","인텔 코어i7-10세대 10700","인텔 코어i9-10세대 10900"],["HP DDR4 (8GB)","마이크론 Crucial DDR4 (16GB)","삼성전자 DDR4 (8GB)"],["GeForoce RTX 2060","GeForoce RTX 3090","라데온 RX 6900"],["도시바 DT01 (1TB)","Western Digital WD (4TB)","Seagate BarraCuda 5400"],["SK하이닉스 Gold P31","ADATA XPG","삼성전자 970 EVO"]]
    //수량 관리를 위한 배열
    let count = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]];
    //합계 관리를 위한 배열
    let money = [[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]];
    //장바구니 스크롤 고정
    $(window).scroll(function(){
        $("#rightdiv").css({"top":$(document).scrollTop()})
    })
    //각 부품의 설명 사진 출력
    $(".menu>img").click(function(){
        let v = $(this).attr("src").split("_s.");
        let v2 = v[0];
        $("#details>img").attr({"src":v2+"_d.jpg"})
        $("#details>img").css({"display":"inline"})
    })
    //부품 이미지 클릭 디자인
    $(".menu>img").hover(function(){
        $(this).css({"cursor":"pointer","border":"1px dashed black"})
    },function(){
        $(this).css("border","0px")
    })
    //천의자리 컴마 넣기 위한 함수
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    //상단바 꾸미기
    $("#menu li").hover(function(){
        $(this).css("background","#96fab1")
    },function(){
        $(this).css("background","#44c767")
    })
    //상단바 제어
    $("#menu li:not(li:has(ul))").click(function(){
        $("#details>img").css({"display":"none"})
        let x =0
        if($(this).text()=="CPU"){
        }else if($(this).text()=="RAM"){
            x = 1
        }else if($(this).text()=="VGA"){
            x = 2
        }else if($(this).text()=="HDD"){
            x = 3
        }else if($(this).text()=="SSD"){
            x = 4
        }
        for(let i = 0; i<3;i++){
            let num = Number(i)+1;
            if(x!=2){
                $   ("#menu"+num+">img").attr("src","./images/"+img[x][i]+"_s.jpg")
            }else{//vga는 gif 파일
                $   ("#menu"+num+">img").attr("src","./images/"+img[x][i]+"_s.gif")
            }
            $("#label"+num).attr("value",img[x][i])
            $("#price"+num).attr("value",price[x][i])
            $("#label"+num).text(name[x][i])
            $("#price"+num).text(numberWithCommas(price[x][i]))
        }
    })

    //장바구니 담는 동작
    $("td>.myButton").click(function(){
        let idx = $(this).attr("id");
        let name3 = $("#label"+idx).text();
        let part = $("#label"+idx).attr("value");
        let part2 = part.substring(0,3);
        let x =0
        if(part2=="cpu"){
        }else if(part2=="ram"){
            x = 1
        }else if(part2=="vga"){
            x = 2
        }else if(part2=="hdd"){
            x = 3
        }else if(part2=="ssd"){
            x = 4
        }
        let y=name[x].indexOf(name3);
        let flag = false;
        $("#listTable td:nth-child(1)").each(function(){
            if($(this).text()==name3){
                count[x][y]++;
                flag = true;
            }
        })
        let price = $("#price"+idx).attr("value")
        let qty = count[x][y]+1;
        money[x][y] = Number(price) * qty;
        let price3 = numberWithCommas(Number(money[x][y]))
        let del = "<img src='./images/x.png'>";
        let flag2=false;
        if(flag==true){
            $("#listTable td:nth-child(1)").each(function(){
                if($(this).text()==name3){
                    let d2 = $(this).next();
                    let d3 = d2.next();
                    d2.text(qty);
                    d3.text(price3)
                    flag2=true;
                }
            })
        }
        let num = (x*3)+(y+1);
        sum()

        if(flag2==true)
            return;
        else
            $("#listTable").append("<tr class="+num+">"+num+"<td>"+name3+"</td><td>"+qty+"</td><td>"+price3+"</td><td>"+del+"</td></tr>")
        
    })
    //삭제 동작
    $("#listTable").on("click","img",function(){
        let name2 = $(this).parents("tr").find("td:nth-child(1)").text()
        for(let i = 0; i<img.length;i++){
            for(let j = 0; j<img[0].length;j++){
                if(name[i][j] == name2){
                    count[i][j] = 0;
                    money[i][j] = 0;
                }
            }
        }
        $(this).closest("tr").remove()
        sum()
    })
    //합계 정산 함수
    function sum(){
        let sum = 0;
        for(let i = 0; i<img.length;i++){
            for(let j = 0; j<img[0].length;j++){
                sum += money[i][j];
            }
        }
        $("#result").html("<span class='price'>"+numberWithCommas(sum)+"</span>원")
    }
    //구매 동작
    $("#buy").click(function(){
        alert("총 " + $("#result").text()+" 입니다.")
        window.location.reload();
    })
    //조립 라디오 동작
    $(".btn-switch").change(function(){
        if($("input[name='switch']:checked").attr("id")=="yes"){
            let sum = 0;
            for(let i = 0; i<img.length;i++){
                for(let j = 0; j<img[0].length;j++){
                    sum += money[i][j];
                }
            }
            sum+=20000;
        $("#result").html("<span class='price'>"+numberWithCommas(sum)+"</span>원")
        }else{
            sum();
        }
    })
    
})