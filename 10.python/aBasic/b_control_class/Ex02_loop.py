# ------------------------------------------------------
"""
   (2) for문
        for <타켓변수> in 집합객체 :
            문장들
        else:
            문장들

        ` 반복문 뒤에 else는 반복하는 조건에 만족하지않으면 실행

   (3) while 문
        while 조건문 :
            문장들
        else :
            문장들

"""
a = 112  # 숫자형, 반복 불가
b = ['1', '2', '3']  # 리스트
c = '987'  # 문자열
d = tuple(b)  # 튜플
e = dict(k=5, j=6)  # 딕셔너리

# for entry in a: # a는 반복이 안되지만 b부터 e까지는 반복된다.
#    print(entry)

for entry in e:
    print(entry)
    print(e[entry])  # e[k] = 5

for entry in e.items():  # 딕셔너리의 k,v 를 튜플로 받아 인덱스 지정 가능
    print(entry)
    print("key : ", entry[0], ", value : ", entry[1])

for k, val in e.items():  # 딕셔너리는 요소 분해 가능
    print("key : ", k, ", value : ", val)

sum = 0
for i in range(1, 11, 2):
    sum += i
print(sum)

# =========================================================
# while  ( 안해도 될듯 )

# a = 1
# while True:  # 무한루프
#    if a == 1:
#        print(a)
#        break

k = ['a', 'b', 'c']
while k:
    data = k.pop()
    print(data)
    if data == 'b':
        break
else:  # while문을 나오면.?
    print("end")

    # c b

"""
[과제] 2단부터 9단까지 이중 반복문으로 출력
"""

for i in range(2, 10):
    for j in range(1, 10):
        print("{} x {} = {}".format(i, j, i * j))


print("=========================")


