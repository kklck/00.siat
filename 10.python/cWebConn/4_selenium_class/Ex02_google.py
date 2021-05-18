'''
1. 크롬웹드라이버로 구글 사이트 열기

2. 실제 크롬창에서 '파이썬'라고 검색버튼을 누른다.
    개발자모드(F12)에서 이 부분을 보면
    <input name='q' value='파이썬'~~ >
    그리고 'google검색' 버튼이 type='submit' 인거 확인
'''

# [1]
from selenium import webdriver

# webDriver 객체생성
driver = webdriver.Chrome("./webdriver/chromedriver.exe")
driver.implicitly_wait(3)  # 3초 멈춰

# 페이지 접근
driver.get("http://www.google.com")
# ----------------------------------------------
# [2]
search = driver.find_element_by_name("q")  # 구글 메인 input type="text" 의 name 은 q
search.send_keys("코로나 극복")
search.submit()  # form 안에 input이 하나라 그냥 submit 해도 괜찮음

driver.close()
