"""
    파이션  - 무료이지만 강력하다
        ` 만들고자 하는 대부분의 프로그램 가능
        ` 물론, 하드웨어 제어같은 복잡하고 반복 연산이 많은 프로그램은 부적절
        ` 그러나, 다른언어 프로그램을 파이썬에 포함 가능 
        
    [주의] 줄을 맞추지 않으면 실행 안됨

    [실행] Run 메뉴를 클릭하거나 단축키로 shift + alt + F10

    [도움말] ctrl + q

"""

""" 여러줄 주석 """
# 한줄 주석

# 문자열표시
# print("헬로우")
# print('hello')
# print("""안녕""") #개행과 들여쓰기 까지 포함
# print('''올라''')
# 실행 : shift + ctrl + F10

'''
변수란
    파이션의 모든 자료형은 객체로 취급한다
    a = 7
            7 객체을 가리키는 변수 a이다. ( 저장한다는 표현 안함 )
            변수 a는 7이라는 정수형 객체를 가리키는 레퍼런스이다.
            여기서 7은 기존 프로그램언어에 말하는 상수가 아닌 하나의 객체이다.
            
            a=7
            b=7
            print(id(7)) 같은 주소 값
            print(id(a)) 같은 주소 값
            print(id(b)) 같은 주소 값
            
            * 파이썬 콘솔과 다른 점
                - 오리지널 콘솔 : 미리 메모리에 -5~256 객체 상주
                - 파이썬 에디터 : 객체 선언 시 메모리에 값 적재
    
    [변수명 규칙]
    - 영문자 + 숫자 + _ 조합
    - 첫글자에 숫자는 안됨
    - 대소문자 구별
    - 길이 제한 없음
    - 예약어 사용 안됨       
'''
# import keyword
# print(keyword.kwlist) #키워드 리스트
# print(len(keyword.kwlist))
b = 7777
a = 7777
print(id(7))
print(id(a))
print(id(b))
print(a is b)

#변수 여러개 지정
a,b=5,10
print('a + b =',a+b)

#변수 스와핑
a=10
b=20
c=a # 기존에는 스와핑 위해 임시 변수 필요
a=b
b=c
print(a,b)
a,b=b,a # 파이썬 스와핑
print(a,b)

#변수 삭제
del b
print("b=",b)