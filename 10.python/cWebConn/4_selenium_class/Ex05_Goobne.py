"""
    [ 굽네치킨 매장 주소 가져오기 ]

    굽네치킨 http://www.goobne.co.kr > 매장찾기 > 매장찾기
                  http://www.goobne.co.kr/store/search_store.jsp

    개발자모드( F12 ) 열고 페이지 번호를 누르면
    <tbody> 부분이 교체되는 것을 볼 수 있다

    또한 2번 페이지 번호에 <a href="javascript:store.getList('2');">2</a>로 자바스트립트 함수를 호출한다.

    이 때 WebDriver 라는 특정 웹 브라우저의 원격 제어 인터페이스를 이용하고
    selenium 패키지를 이용하여  DOM  요소를 가져오거나 자바스크립트에서 제어하는 동작을 할 수 있도록 한다.
"""

from selenium import webdriver
import time
from bs4 import BeautifulSoup

# -------------------------------1. 웹 페이지 접근
# 웹드라이버 객체 생성
driver = webdriver.Chrome('./webdriver/chromedriver')
# 페이지 접근
driver.get('http://www.kyochon.com/shop/overseas_view.asp')

html = driver.page_source
soup = BeautifulSoup(html, "html.parser")

cls = soup.select(".overseasTab a")

attr = []
for i in cls:
    attr.append(i["href"])

print(attr)

for page_idx in attr:
    # 페이지 이동
    print("http://www.kyochon.com/shop/" + page_idx)
    # driver.execute_script("http://www.kyochon.com/shop/" + page_idx)
    # time.sleep(2)
    #
    # html = driver.page_source
    # soup = BeautifulSoup(html, "html.parser")
    #
    # body = soup.select(".slide dd")
    #
    # for i in body:
    #     print(i.text)
