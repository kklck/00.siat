"""
http://www.pythonscraping.com/pages/warandpeace.html

녹색 글자만 추출하여 출력

-------------------------------------------

http://www.pythonscraping.com/pages/page3.html

아이템과 가격을 추출


-------------------------------------------
https://wikidocs.net/

 1) 책 제목과 설명만 추출
 2) 이미지 다운
"""

from urllib import request as req
from bs4 import BeautifulSoup

res = req.urlopen("http://www.pythonscraping.com/pages/warandpeace.html").read()

soup = BeautifulSoup(res, "html.parser")

cgreen = soup.select(".green")

for i in cgreen:
    print(i.text)

print("=" * 100)

res = req.urlopen("http://www.pythonscraping.com/pages/page3.html").read()

soup = BeautifulSoup(res, "html.parser")

item = soup.select(".gift td:nth-child(1)")
price = soup.select(".gift td:nth-child(3)")

for i, p in zip(item, price):
    print("아이템 :", i.text.strip(), "가격 :", p.text.strip())

print("=" * 100)

