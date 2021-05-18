
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome("./webdriver/chromedriver.exe")
driver.implicitly_wait(3)  # 3초 멈춰
# driver.get("https://www.facebook.com/")
# id = driver.find_element_by_name("id").send_keys(myID)
# pw = driver.find_element_by_name("pw").send_keys(myPW)
# login = driver.find_element_by_id("log.login").click()
driver.get("http://15.164.94.228/BestDesign/chat/login.do")
id = driver.find_element_by_id("userId").send_keys("customer1")
pw = driver.find_element_by_id("userPwd").send_keys("1234")
login = driver.find_element_by_name("login").click()