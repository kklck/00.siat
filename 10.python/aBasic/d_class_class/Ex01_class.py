"""
     1) 클래스 기초

     ` __init__ 함수 : 객체 초기화 함수( 생성자 역할 )
     ` self : 객체 자신을 가리킨다.
"""
""" 자바 클래스
class Sample{
    String greeting;
    
    Sample(String greeting){    # 외부로부터 값을 받아 초기화 시키기 위한 생성자
        this.greeting = greeting;
    }
    
    Sample s = new Sample("올라");
}   
    #별도의 소멸자 없이 Garvage Collecter가 사용하지 않는 쓰레기 값 자동 삭제, 시점 조절 X
"""

# class Sample:
#     data = "헬로우"  # 생성자로서 사용할 멤버변수는 생성자에 선언해도 됌.
#
#     # 생성자
#     def __init__(self, name, age):  # self는 자바의 this, 매개변수 아님
#         print("Sample 생성자 호출")
#         self.name = name  # self.변수 = 멤버변수
#         self.age = age
#
#     # 소멸자
#     def __del__(self):
#         self.name = ""
#         self.age = 0
#         print("Sample 소멸자 호출")
#
#
# s = Sample("홍길동", 24)
#
# print(s.data)
# print("이름 : ", s.name)
# print("나이 : ", s.age)
#
# del s

"""
    2) 
    인스턴스 함수 :  'self'인 인스턴스를 인자로 받고 인스턴스 변수와 같이 하나의 인스턴스에만 한정된 데이터를 생성, 변경, 참조
    클래스   함수 :  'cls'인 클래스를 인자로 받고 모든 인스턴스가 공유하는 클래스 변수와 같은 데이터를 생성, 변경 또는 참조
     
    - 클래스 함수는 클래스명 접근
 
"""


class Book:
    cnt = 0

    def __init__(self, title):
        self.title = title

    # def output(cls):
    #     print("제목은 : ", cls.title)
    #     cls.cnt += 1
    #     print("총 갯수 : ", cls.cnt)

    @classmethod  # 정적화, 클래스를 공유하는 객체가 하나의 함수만 이용
    def output(self):
        # print("제목은 : ", self.title)   # 생성자로 동적 선언된 변수는 정적으로 사용 불가
        self.cnt += 1  # self = Book(클래스명) 같은 동작
        print("총 갯수 : ", Book.cnt)

    def __del__(self):
        self.cnt = 0
        self.title = ""


b1 = Book("개발왕")
b2 = Book("DevKing")

b1.output()
b2.output()

Book.output()
print("================================")
'''
     3) 클래스 상속
        - 파이션은 method overriding은 있지만 method overloading 개념은 없다
        - 파이션은 다중상속이 가능, 부모가 여럿
        - 부모 클래스가 2개 이상인 경우 먼저 기술한 부모클래스에서 먼저 우선 해당 멤버를 찾음
'''


class Animal:

    def move(self):
        print("동물은 움직인다.")


class Wolf(Animal):  # Animal을 상속 받음
    foot = [2,4]

    def move(self):
        print("늑대는 네 발로 달린다.")


class Human(Animal):  # Animal을 상속 받음

    def move(self):
        print("인간은 두 발로 걷는다.")


class WolfHuman(Wolf, Human):  # Animal을 상속 받는 Wolf, Human 상속 받음.

    def move(self):
        super().move()  # c는 순서를 정하지 못해 에러, 파이썬은 매개변수 위치에서 가장 먼저 상속해준 부모를 상속


w = Wolf()
h = Human()
wh = WolfHuman()

w.move()
h.move()
wh.move()   # 111줄의 순서에 따라