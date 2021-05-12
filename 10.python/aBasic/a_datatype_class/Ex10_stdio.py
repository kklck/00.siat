"""
    [ 콘솔 입력 처리 함수 ]
    - input() : 기본적으로 문자열로 입력받음
    - eval() : 함수로 감싸면 숫자 처리됨
    - int() / float() / str() 자료형변환  ( eval() 사용보다는 형변환을 권장 )
"""
# name = input("이름을 입력하세요 : ")
# print("당신의 이름은 %s입니다."% name)

# -------------------------------------------
# 나이를 입력받아 +1을 하여 출력하고 키를 실수형으로 입력받아 출력
# age = input("나이를 입력하세요 : ")
# print("당신의 나이는 %.2f입니다." % (float(age)+1))

# ----------------------------------
# 단을 입력받아 구구단을 구하기
# mul = input("구구단 몇 단? : ")
# for i in range(1,10):
#     print("{} x {} = {}".format(mul, i, int(mul) * i))
# print(eval('1+2'))

# -----------------------------------------
# print() 함수
# print("안녕"+"친구")
# print("안녕","친구")    # 자동 들여쓰기
# print("안녕" "친구")
#
# for i in range(5):
#     print(i,end=' ') # 개행 방지, 기본 값은 '\n'
# print()
# for i in range(5):
#     print(i,end=',' if i<4 else '')       # 가운데 조건을 두고 True는 왼쪽 False는 오른쪽

# -------------------------------------------------------
# 명령행 매개변수 받기 - java의 main() 함수의 인자
# Java Test abc def xxxx
#            0   1   2
# [ 콘솔에서 실행 ] python Ex10_stdio.py ourserver scott tiger
#                                   0      1      2      3
# import sys
# args = sys.argv[1:]
# for i in args:
#     print(i)

print("====================")
# args = 0
# for i in range(5):
#     args += int(input("정수를 입력하세요 : "))
# print(eval('args/5'))
#
# args = str(input("문자열 입력 : "))
# print(args[::-1])
#
# def x(d):
#     d2 = 0
#     dt = {}
#     for i in d:
#         d2 += int(i)
#     return eval('d2/len(d)')
# d = input("정수 리스트 입력 : ").split()
# print(x(d))

s = input("문자열을 입력하시오 : ")
dt = {2:"ABC",3:"DEF",4:"GHI",5:"JKL",6:"MNO",7:"PQRS",8:"TUV",9:"WXYZ"}
# dt = {"ABC":2,"DEF":3,"GHI":4,"JKL":5,"MNO":6,"PQRS":7,"TUV":8,"WXYZ":9}
