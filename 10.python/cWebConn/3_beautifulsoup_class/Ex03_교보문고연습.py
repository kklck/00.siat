'''
 [과제] 교보문고에서 파이썬 책 검색하여
    - csv 파일로 저장
    - mysql 테이블에 저장
'''

from urllib.request import urlopen
from bs4 import BeautifulSoup
from urllib import request as req

# 교보문고 > '파이썬' 검색 > 국내도서
html = urlopen(
    "http://www.kyobobook.co.kr/search/SearchKorbookMain.jsp?vPstrCategory=KOR&vPstrKeyWord=python&vPplace=top").read()

soup = BeautifulSoup(html, "html.parser")

# 책 제목 추출 및 총 권수 출력

titles = soup.select(".title a strong")

for i in titles:
    print(i.text.strip())  # 앞 뒤 공백 제거

print("총 권수 :", len(titles))

# 이미지 다운 받아 파일 저장
imgUrl = soup.select(".cover img")  # 모든 이미지

for i in imgUrl:
    print("경로", i["src"], ", 제목 :", i["alt"])
    imgPath = i["src"]  # http://image.kyobobook.co.kr/images/book/large/882/l9791162241882.jpg
    imgName = i["alt"].replace(":", "-")  # 혼자 공부하는 파이썬
    req.urlretrieve(imgPath, "images/" + imgName + ".jpg")  # url 에서 받아온 내용을 filename 으로 생성?!
