"""
 urllib.parse.urljoin() : 상대경로를 절대경로로 변화하는 함수
"""
from urllib.parse import urljoin

baseUrl = "http://www.example.com/html/a.html"

print(urljoin(baseUrl, "b.html"))  # base 에 이름만 b.html 로?
print(urljoin(baseUrl, "sub/c.html"))  # http://www.example.com/html/sub/c.html
print(urljoin(baseUrl, "/sub/d.html"))  # http://www.example.com/sub/d.html
print(urljoin(baseUrl, "../sub/e.html"))  # http://www.example.com/sub/e.html
print(urljoin(baseUrl, "../temp/f.html"))  # http://www.example.com/temp/f.html

print(urljoin(baseUrl, "http://www.other.com/mypage"))

# 상대 경로는 최하위 경로를 덮어씀
# 절대 경로는 루트 경로부터 덮어씀
# 온전한 url 은 base 전부를 덮어씀,
