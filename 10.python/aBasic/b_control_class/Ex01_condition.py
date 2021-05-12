"""
 [ 제어문 ]
    - 파이썬은 들여쓰기를 하여 블록{}을 대신 표현한다
    - 들여쓰기는 탭과 공백을 섞어 쓰지 말자

    [ex]
    if a>b:
        print(a)
            print(b)  => 에러발생

    (1) if 문
        if 조건식A :
            문장들
        elif 조건식B :
            문장들
        else :
            문장들

        ` 조건식이나 else 뒤에는 콜론(:) 표시
        ` 조건식을 ( ) 괄호 필요없다
        ` 실행할 코드가 없으면 pass
        ` 파이썬은 switch 문 없음
"""

# 거짓(False)의 값
i = 0;
i2 = 0.0
i3 = ""
i4 = str()
i5 = list()
i6 = tuple()
i7 = set()
i8 = dict()
i9 = {}  # dict
i10 = None

a = -1
if not a:
    print("True")  # 0을 제외한 모든 수
else:
    print("False")  # 0

a = 10
b = -1

# 논리 연산자
print("a and b : ", a and b)  # 실질적 결정자가 후자

if a and b:
    print("True2")
else:
    print("False2")
print("a or b : ", a or b)  # 실질적 결정자가 전자

if a or b:
    print("True3")
else:
    print("False3")

# 블럭 정리

a = 10
if not a:
    c = 10
elif not b:
    c = 20
else:
    c = 30
print(c)  # c 선언을 블럭 안에서 했지만, 밖에서 호출 가능한 것으로 보아 지역변수가 아닌 듯

#
word = "korea"
print(word.find("k"))
if word.find("k") >= 0:  # 값이 존재하지만 찾은 인덱스 값이 0
    print("1 > " + word)
print(word.find("z"))
if word.find("z") >= 0:  # 값이 존재하지 않아 -1
    print("2 > " + word)


