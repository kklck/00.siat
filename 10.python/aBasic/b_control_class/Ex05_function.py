"""
    [ 함수 ]

     반복적인 구문을 만들어 함수로 선언하여 간단하게 호출만 하고자 한다

     def 함수명(매개변수):
        수행할 문장들
"""


# 1. 매개변수, 리턴 없는 함수
def func():
    print("inside func")


# func()
print(func())  # 1.func() 함수 실행, 2. 해당 함수의 return이 없기 때문에 None 출력

print("=================================")


# 2. return 있는 함수
def func(arg1, arg2):  # 함수를 객체 취급하여 오버로딩이 불가
    return arg1 * 100, arg2 + 10  # 다른 언어와 달리 다수의 값을 튜플로서 하나의 객체로 return 가능


res1, res2 = func(1, 2)
print(res1, res2)

print("=================================")


# 3. 위치인자 (positional argument)
def func(greeting, name):
    print(greeting, "!!!!", name, "님")


func("안녕", "홍길동")
func("김길동", "잘가")
print("=================================")

# 4. 키워드 인자 (keyword argument)

func(greeting="안녕", name="홍길동")
func(name="김길동", greeting="잘가")

print("=================================")


# 5. 함수 인자의 기본 값

def func(greeting, name="홍길동"):  # None 값 들어올 때 디폴트
    print(greeting, "!!!!", name, "님")


func("헬로우", "존")
func("올라")

print("=================================")


# [확인]

def func(a, b, c=100):
    return a * 2 + b * 3 + c * 4


print(func(c=1, b=2, a=3))  # 16
print(func(1, 2, 3))
print(func(1, 2))

print("=================================")


# [참고] 알쓸신잡

def doggy(arg, result=[]):  # 매개변수는 처음 읽을 때 한 번 생성.
    result.append(arg)
    print(result)


doggy("가")
doggy("나")
doggy("다", [1, 2, 3, 4])
doggy("라")
print("=================================")

'''
#----------------------------------------------------------------
# (6) 위치 인자 모으기 (***********************************************************************************************************************************************************************************)

첫번째와 두번째는 인자가 반드시 들어가고 세번째는 인자가 들어갈 수도 있고 없으면 0으로 초기화한다
그러나 네번째 인자부터는 정확히 모른다면?

print(func(4, 5))
print(func(4, 5, 6))
print(func(4, 5, 6, 7))
print(func(4, 5, 6, 7, 8, 9))       # args에 7,8,9가 튜플로 들어간다
'''


def func(a, b, c=0, *args):  # 나머지 들어올 매개변수는 튜플로서 위치 인자 처리, 보통 args로 선언
    print(args)
    sum = a + b + c
    for i in args:
        sum += i
    return sum


print(func(4, 5))
print(func(4, 5, 6))
print(func(4, 5, 6, 7))
print(func(4, 5, 6, 7, 8, 9))  # args에 7,8,9가 튜플로 들어간다

print("=================================")


# 7. 키워드 인자 모으기 ********
#       - 보통 kwargs로 선언

def func(a, b, c=0, *args, **kwargs):  # **는 딕셔너리로서 들어옴
    sum = a + b + c
    for i in args:
        sum += i
    for k in kwargs:
        sum += kwargs[k]
    # for k in kwargs.items():
    #     sum += k[1]
    return sum


print(func(4, 5))
print(func(4, 5, 6))
print(func(4, 5, 6, 7))
print(func(4, 5, 6, 7, 8, 9))
print(func(4, 5, 6, 7, kor=5, eng=10))
print(func(4, 5, 6, 7, 8, 9, java=5, python=10))
print("=================================")
