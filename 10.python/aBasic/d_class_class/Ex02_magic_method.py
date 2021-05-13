# class Sample:
#
#     # 생성자
#     def __init__(self, name, age):  # self는 자바의 this, 매개변수 아님
#         print("Sample 생성자 호출")
#         self.name = name  # self.변수 => 멤버변수화
#         self.age = age
#
#     def __str__(self):
#         return "이름 : {}\n나이 : {}".format(self.name, self.age)
#
#     def __add__(self, other):
#         self.age += other
#         return self.age
#
#     def __ge__(self, other):  # 내부에 연산자 >= 만 있어야 하는 매직 메소드
#         if self.age >= other:
#             return "성인"
#         else:
#             return "미성년"
#
#     def __bool__(self):
#         if self.name == "또길자":
#             return True
#         else:
#             return False
#
#     # 소멸자
#     def __del__(self):
#         self.name = ""
#         self.age = 0
#         print("Sample 소멸자 호출")
#
#
# s = Sample("또길자", 25)
#
# print(s)        # str
# print(s + 10)   # add
# print(dir(s))   # 해당 클래스에 들어갈 수 있는 메소드
#
# print(s >= 20)  # ge
#
# if s:           # bool
#     print("또길자 본인입니다.")
# else:
#     print("또길자가 아닙니다.")

"""
    매직 메소드

(1) Binary Operators
        Operator	Method
        +	    object.__add__(self, other)
        -	    object.__sub__(self, other)
        *	    object.__mul__(self, other)
        //	    object.__floordiv__(self, other)
        /	    object.__div__(self, other)
        %	    object.__mod__(self, other)
        **	    object.__pow__(self, other[, modulo])
        >>	    object.__lshift__(self, other)
        <<	    object.__rshift__(self, other)
        &	    object.__and__(self, other)
        ^	    object.__xor__(self, other)
        |	    object.__or__(self, other)  
        
(2) Comparison Operators
        Operator	Method
        <	    object.__lt__(self, other)
        <=	    object.__le__(self, other)
        ==	    object.__eq__(self, other)
        !=	    object.__ne__(self, other)
        >=	    object.__ge__(self, other)
        >	    object.__gt__(self, other)
                
(3) Extended Assignments
        Operator	Method
        +=	    object.__iadd__(self, other)
        -=	    object.__isub__(self, other)
        *=	    object.__imul__(self, other)
        /=	    object.__idiv__(self, other)
        //=	    object.__ifloordiv__(self, other)
        %=	    object.__imod__(self, other)
        **=	    object.__ipow__(self, other[, modulo])
        <<=	    object.__ilshift__(self, other)
        >>=	    object.__irshift__(self, other)
        &=	    object.__iand__(self, other)
        ^=	    object.__ixor__(self, other)
        |=	    object.__ior__(self, other)
          
(4) Unary Operators
        Operator	Method
        -	        object.__neg__(self)
        +	        object.__pos__(self)
        abs()	    object.__abs__(self)
        ~	        object.__invert__(self)
        complex()	object.__complex__(self)
        int()	    object.__int__(self)
        long()	    object.__long__(self)
        float()	    object.__float__(self)
        oct()	    object.__oct__(self)        
        hex()	    object.__hex__(self)
"""

print("=================================")

