msg = '행복해'  # 문자열
li = ['a', 'b', 'c']  # 리스트
tpl = ('ㄱ', 'ㄴ', 'ㄷ')  # 튜플
di = {'k': 5, 'j': 6, 'l': 7}  # 딕셔너리

# unpacking : 요소 분할

c1, c2, c3 = di  # msg를 3등분할 하여 할당
print(c1, di[c1])
print(c2, di[c2])
print(c3, di[c3])

aList = [(1, 2), (3, 4), (5, 6)]
"""
    [출력 결과]
    1 + 2 = 3
    3 + 4 = 7
    5 + 6 = 11
"""

for a, b in aList:
    print("{} + {} = {}".format(a, b, a + b))

# enumerate(), 이터레이터, 인덱싱

user_list = ['개발자', '코더', '노가다', '프로그래머']
for val in user_list:
    print(val)

for idx, val in enumerate(user_list):  # 인덱스 까지 같이 나오게
    print(idx, ">", val)

# zip()**************
days = ["월", "화", "수"]
doit = ["잠자기", "밥먹기", "공부", "놀기"]

print(list(zip(days, doit)))  # 두 리스트를 같은 인덱스끼리 묶어 리스트화
print(dict(zip(days, doit)))  # 두 리스트를 같은 인덱스끼리 묶어 딕셔너리화

for day, do in zip(days, doit):
    print(day, do)
