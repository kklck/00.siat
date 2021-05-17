"""
    HTML 내부에 있는 링크를 추출하는 함수
        - CSS 파일과 a 링크 연결된 모든 파일을 가져오기
"""

from bs4 import BeautifulSoup
from urllib import parse
from urllib import request


def enum_links(html, base):  # a 태그의 href 경로를 모아 들고옴
    soup = BeautifulSoup(html, "html.parser")
    links = soup.select("a")
    # -------------------------------------

    result = []
    for a in links:
        href = a.attrs["href"]  # 상대 경로
        print("상대 경로 :", href)
        # result.append(href)
        url = parse.urljoin(base, href)  # 절대 경로
        print("절대 경로 :", url)
        result.append(url)
    return result


if __name__ == '__main__':
    url = 'https://docs.python.org/3.7/library/'
    response = request.urlopen(url)  # urllib.request.urlopen() : BeautifulSoup 을 통해 html 파서할(데이타를 가져올) 대상
    result = enum_links(response, url)
    print(result)
