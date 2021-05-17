"""
    파일을 다운받고 저장하는 함수

     [참고] 파이썬 정규식 표현 : https://wikidocs.net/4308

     [참고] 파싱 방법
        - BeautifulSoup
        - urllib.parse
"""
from bs4 import BeautifulSoup
from urllib import parse
from urllib import request
import os, time, re  # re : 정규식


def download_file(url):
    p = parse.urlparse(url)  # 6가지 요소로 자르기
    print("1 >", p)
    savepath = "./" + p.netloc + p.path  # netloc : 루트, path : 루트 아래 경로
    print("2 >", savepath)
    # 끝이 "/" 면 뒤에 "index.html" 붙여라
    if re.search("/$", savepath):  # savepath 맨 끝이 / 로 끝나면
        savepath += "index.html"
        print("3 >", savepath)
    # 해당 위치가 내 프로젝트에 존재하는지
    if os.path.exists(savepath):
        return savepath

    # 다운로드 할 폴더 생성
    savedir = os.path.dirname(savepath)

    # 해당 폴더가 존재하지 않으면
    if not os.path.exists(savedir):
        os.makedirs(savedir)  # 그냥 만들어~

    # 해당 url 다운받기
    try:
        print("success download =", url)
        request.urlretrieve(url, savepath)  # 해당 savepath 위치에 url 삽입
        time.sleep(2)   # 웹 상에서 충분히 요청을 받을 수 있게 시간을 둠.
        return savepath
    except:
        print("fail download :", url)
        return None


if __name__ == '__main__':
    url = 'https://docs.python.org/3.6/library/'
    result = download_file(url)
    print(result)
