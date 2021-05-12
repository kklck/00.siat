# [추가] 함수도 객체이다
def case1():
    print('case-1')


def case2():
    print('case-2')


def case3():
    print('case-3')


f = {'a1': case1, 'a2': case2, 'a3': case3}  # 함수도 객체라 () 없이 할당 가능
print(f['a1']())  # case1()
print("=======================")
# ---------------------------------------
# 글로벌 변수와 지역변수

temp = "글로벌"


def func():
    global temp
    print("0 >", temp)  # global 없이 지역변수를 선언 시 오류
    temp = "지역"  # global 선언 후 지역변수는 글로벌 변수 처리
    print("1 >", temp)


func()
print("2 >", temp)

print("=======================")

'''
#----------------------------------------------
# 람다함수 - 한번 사용하고 버리는 함수
# 파이션에서는 람다함수를 한 줄로 작성???

    파이썬 3.x부터는 람다를 권장하지 않는다고.
    몇몇 개발자들이 람다함수 사용시 직관적이지 않다는 이유라는데
    
    종종 사용됨
'''


def f(a, b):
    return a + b


print(f(3, 2))

f = lambda a, b: a + b
print(f(2, 3))

print("=======================")

# -----------------------------------------------------------
"""  맵리듀스
    (1) map()
         ` 연속 데이터를 저장하는 시퀀스 자료형에서 요소마다 같은 기능을 적용할 때 사용
         ` 형식 : map(함수명, 리스트형식의 입력값)
         ` 파이썬 3.x에서는 list(map(calc, ex)) 반드시 list를 붙여야 리스트 형식으로 반환된다
           파이썬 2.x에서는 list 없이도 리스트 형식으로 반환
    (2) reduce()
         ` 리스트 같은 시퀀스 자료형에 차례대로 함수를 적용하여 모든 값을 통합하는 함수    
    
    파이썬 2.x에서는 많이 사용하던 함수이지만, 최근 문법의 복잡성으로 권장하지 않는 추세란다.
"""


def cals(x):
    return x * 2


data = [1, 2, 3, 4, 5]
# 모든 리스트 요소를 함수 호출하고 싶어

print(list(map(cals, data)))  # cals 함수에 리스트 요소를 하나씩 입력, 눈에 보이지 않는 반복문 존재

# 리듀스
from functools import reduce


def f(a, b):
    print(a, b, a + b)
    return a + b


print(reduce(f, data))  #

print("===============================")


def even_filter(list):
    return [i for i in list if i % 2 == 0]


print(even_filter([1, 2, 4, 5, 8, 9, 10]))


def is_prime_number(num):
    return "소수가 아닙니다." if {0 for i in range(2, int(num / 2) + 1) if num % i == 0} else "소수입니다."
    #     return "소수가 아닙니다."
    # else:
    #     return "소수입니다."
    # if num % 2 == 0:
    #     return "소수가 아닙니다."
    # for i in range(3, int(num / 2) + 1, 2):
    #     if num % i == 0:
    #         return "소수가 아닙니다."
    # return "소수입니다."


print(is_prime_number(60))
print(is_prime_number(1))
print(is_prime_number(2))
print(is_prime_number(3))
print(is_prime_number(4))
print(is_prime_number(5))
print(is_prime_number(6))
print(is_prime_number(7))
print(is_prime_number(8))
print(is_prime_number(9))
print(is_prime_number(10))
print(is_prime_number(11))


def count_vowel(s):
    return len(list(i for i in s if i in ["a", "e", "i", "o", "u"]))


print(count_vowel("pythonian"))
