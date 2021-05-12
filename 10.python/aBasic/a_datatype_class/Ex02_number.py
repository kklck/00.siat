"""
        숫자형 종류
            - 정수형
            - 실수형
            - 복소수형 1 + 2j, 3i  ( 많이 사용안함 )
            - 8진수   0o25
            - 16진수  0x25
"""

# 파이션의 모든 자료형은 객체로 취급한다
# 실행 : alt + shift + F10

""" [ 기초 연산자 ]
        + : 더하기
        - : 빼기
        * : 곱하기
        / : 나누기(실수값 결과) <-> Java는 기준 숫자의 자료형 따라
        // : 나누기(정수값 결과)
        % : 나머지
        ** : n제곱
    
    2. 관계연산자
        <   >   <=  >=  ==  !=
    
    3. 논리연산자
        not     or      and
        
    4. 이진(비트) 연산자
        ~   :  이진 not   
        |   :  이진 or
        &   :  이진 and
        ^   :  이진 xor
        <<  :  shift
        >>  :  shift
        
    5. 대입연산자
        =
        +=  -=  *=  /=  //= %=
        &=  |=  ^=
        >>= <<=
    
    6. 기타연산자 : 딕셔너리, 문자열, 리스트, 튜플 등의 자료형에서 사용
        is      : 비교하는 객체의 주소가 같으면 true, 다르면 false
        is not  : 비교하는 객체의 주소가 다르면 true, 같으면 false 
        in      : 요소에 포함되면 true, 없으면 false
        not in  : 요소에 포함되지 않으면 false, 없으면 true
      

    [참고] 증가(++), 감소(--) 연산자 없음         
"""
#기타연산자
print('Hello' is 'hello')       #False, 같은 게        아니다
print("Hello" is not 'Hello')   #True, 같지 않은 게     아니다
print("H" in 'Hello')           #True, 속한 게         맞다
print("H" not in 'Hello')       #False 속하지 않은 게   아니다

#참고
y = 8.3/2.7
print(y)
print("실수 : {0}, 정수 : {1}".format(y, 100)) #중괄호 인덱스에 포맷한 값 설정. 인덱스 없으면 전체 값 받음
print("실수 : {0:.3f}, 정수 : {1}".format(y, 100)) #소수점 셋째 자리 float형


a = 5
b = 2

""" [ 출력결과 ] 
        a + b = 7
        a - b = 3
        a * b = 10
        a / b = 2.5
        a // b = 2
        a % b = 1
        a ** b = 25
"""
add = a+b
print('a + b =', add)           # 출력 메소드에서 + 못 씀, 자동 들여쓰기
# print('a + b = ' + add)       # 한 줄 씩 동작하는 인터프리터 언어이기 때문에 66줄만 에러
print('a + b = ' + str(add))    # 문자열로 형변환 하여 온전한 문자열을 출력할 수 있음

print("------------------------------")

a = 3.5
b = int(3.5)

print(a**((a // b) * 2))
print(((a - b) * a) // b)
b = (((a - b) * a) % b)
print(b)
print((a * 4) % (b * 4))


a = 10.6
b = 10.5
print(a * b)
print(type(a+b))

a,b="3.5","1.5"
print(a+b)

안녕 = 1

print(안녕)