# urlretrieve(): 파일로 바로 저장
# urlopen(): 파일로 바로 저장하기 않고 메모리에 로딩을 한다.

""" [참고] 파일저장 기본방식
    f = open('a.txt','w')
    f.write("테스트 내용")
    f.close()

    위의 과정을 with 문으로 간략하게 close 필요없음
    with open("a.txt","w") as f:
        f.write("테스트 내용")
"""
from urllib import request as req

url = "https://t1.daumcdn.net/daumtop_chanel/op/20200723055344399.png"
filename = "data/daum2.png"
site = req.urlopen(url)
down = site.read()

with open(filename, "wb") as f:  # 없으면 생성, 있으면 덮어쓰기 + 바이너리 타입(이미지)링크
    f.write(down)  # 자동 close
"""
- fileObj = open ( filename, mode )
    mode 첫번째 글자 - 작업 표시
    r(read)  : 파일 읽기
    w(write) : 파일 쓰기 ( 파일이 없으면 생성하고 파일이 있으면 덮어쓴다 )
    x(write) : 파일 쓰기 ( 파일이 없을 때만 생성하고 쓴다 )
    a(append) : 파일 추가 ( 파일이 있으면 파일의 끝에서부터 추가하여 쓴다 )

    mode 두번째 글자 - 파일 타입
    t : 텍스트(text) 타입 ( 기본값 )
    b : 이진(binary) 타입
    두번째 글자가 없으면 텍스트 타입이다.

    encoding='utf-8' : 한글
"""
