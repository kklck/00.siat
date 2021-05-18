"""
네이버 로그인 페이지를 실행하기
    크롬에서 네이버 로그인 페이지를 개발자모드에서 확인하여
    로그인 폼의 아이디와 비밀번호 입력 name 확인
    아이디 : id
    비밀번호 : pw
"""

from selenium import webdriver
import time

# 0. 네이버 로그인 정보
myID = 'asdf5574'
myPW = '@rhkddns22'

# 1. webdriver 객체생성
driver = webdriver.Chrome("./webdriver/chromedriver.exe")
driver.implicitly_wait(3)  # 3초 멈춰
driver.get("https://nid.naver.com/nidlogin.login")
# id = driver.find_element_by_name("id").send_keys(myID)
# pw = driver.find_element_by_name("pw").send_keys(myPW)
# login = driver.find_element_by_id("log.login").click()

id = driver.execute_script("document.getElementsByName('id')[0].value=\'"+myID+"\'")
pw = driver.execute_script("document.getElementsByName('pw')[0].value=\'"+myPW+"\'")
# login = driver.find_element_by_name("frmNIDLogin").submit()
login = driver.find_element_by_id("log.login").click()



