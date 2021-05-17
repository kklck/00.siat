# 내장모듈 urllib
from urllib import request  # 내장은 s 안붙음

url = "http://www.google.com"
site = request.urlopen(url)  # String return
print(site)
page = site.read()
print(page)
