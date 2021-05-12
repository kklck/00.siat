
# -----------------------------------------
#  문자열 포맷
#       0- 문자열 포맷팅
#               print('내가 좋아하는 숫자는 ', 100 )
#       1- format() 이용
#               print('내가 좋아하는 숫자는 {0:d} 이다'.format(100) )
msg = '{}님, 오늘도 행복하시고 {}님은 알아하세요'
print(msg.format('또길동','김광운'))
msg = '{1}님, 오늘도 행복하시고 {0}님은 알아하세요'
print(msg.format('또길동','김광운'))
msg = '{name}님, 오늘도 행복하시고 {group}님은 알아하세요'
print(msg.format(name='또길동',group='김광운'))
#       2- % 사용
#               print('내가 좋아하는 숫자는 %d 이다' % 100 )
#       성능(속도)는 %이 더 빠르다고는 하지만 코드가 깔끔하게 하는 것이 더 중요하다고 하고는
#       어느 것으로 선택하라고는 안 나옴


# [참고] http://pyformat.info

# % 이용 - printf() 역할
name = '홍길동'
age = 22
height = 170.456

print('이름은 %s %d살 %.2fcm' % (name, age, height))
print("22 + 5 = {0:d}".format(age+5))

#--------------------------------------------------
# 실수인 경우

su = 99.9999
print("숫자 : ",su)
print("숫자 : {0:.2f}".format(su))
print("숫자 : %.4f" % su)
print("숫자 : " + str(su))

print("=========================")
class_name = '  introduction programming with python    '
print(class_name.capitalize())  # 첫 문자를 대문자로
print(class_name.title())       # 첫 단어를 대문자로
print(class_name.strip())       # 양쪽 공백을 제거
print(class_name.isdigit())     # 숫자인지 판별
print(class_name.upper())       # 모든 문자를 대문자로
print("=========================")

for i in class_name:
    if i == 'python':
        i = i.upper()

print(class_name)

a = "abcd e f g"
b = a.split()
c = (a[:3][0])
d = (b[:3][0][0])
print(c + d)


result = "CODE2018"
print("{0},{1}".format(result[-1], result[-2]))