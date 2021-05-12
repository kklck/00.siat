"""
    @ 컴프리핸션 (comprehension)
    ` 하나 이상의 이터레이터(iterator)로부터 파이썬 자료구조를 만드는 컴팩트한 방법
    ` 비교적 간단한 구문으로 반복문과 조건 테스트를 결합

    * 리스트 컨프리핸션
        [ 표현식 for 항목 in 순회가능객체 ]
        [ 표현식 for 항목 in 순회가능객체 if 조건 ]

    * 딕셔러리 컨프리핸션
        { 키_표현식: 값_표현식 for 표현식 in 순회가능객체 }

    * 셋 컨프리핸션, 리스트와 차이는 역시나 중복제거 뿐
        { 표현식 for 표현식 in 순회가능객체 }

"""

# 컨프리핸션 사용하지 않은 리스트 생성
alist = []
alist.append(1)
alist.append(2)
alist.append(3)
alist.append(4)
alist.append(5)
alist.append(6)
print(alist)

alist = []
for n in range(1, 7):
    alist.append(n)
print(alist)

alist = list(range(1, 7))
print(alist)

clist = []
for r in range(1, 4):
    for c in range(1, 3):
        clist.append(((r, c)))
print(clist)

print("===========================")
clist = [(r, c) for r in range(1, 4) for c in range(1, 3)]  # 컨프리헨션 이중 포문, 1~4를 하나씩 뽑을 때 마다 1~3을 뽑아 r,c에 저장
print(clist)

# ------------------------------------------------
# 리스트 컨프리핸션
blist = [n * 2 for n in range(1, 7)]  # 1~6을 뽑아 n에 두고 그것을 연산 n*2을 하여 blist에 저장
print(blist)

blist = [n + 1 for n in range(1, 7) if n % 2 == 1]  # 1~6을 뽑아 홀수인 수만 n에 두고 그것을 연산 n+1을 하여 blist에 저장
print(blist)
print("======================")
# -------------------------------------------
# 딕셔러니 컨프리핸션
data = (2, 3, 4)  # 리스트, 튜플 모두 가능
adic = {n: n ** 2 for n in data}
print(adic)
print("======================")

# 파이써닉해

word = "LOVE LOL"
wcnt = {i: word.count(i) for i in word}  # word 글자마다 해당 글자 갯수 출력
print(wcnt)

# ------------------------------------------------
# 셋 컨프리핸션
data = [1, 2, 3, 1, 1, 2]  # 리스트
alist = [n for n in data]
print(alist)

aset = {n for n in data}  # 셋
print(aset)
print("======================")
# -------------------------------------------------
# [참고] 제너레이터 컨프리핸션 (잘 몰라도 됨),
# ( ) 를 사용하면 튜플이라 생각하지만 튜플은 컨프리핸션이 없다.
# 단 한번만 Read 가능


data = [1, 2, 1, 2, 3, 2, 1]
glist = [n for n in data]   # 리스트 컨프리핸션
print(glist)
glist = {n for n in data}   # 셋 컨프리핸션
print(glist)
glist = (n for n in data)   # 튜플이 아닌 제너레이터 컨프리핸션
print(glist)
print(list(glist))
print("======================")

우리의결의 = """취하고싶으면달려라
맡은업무는반드시마치자
노력없는성과는없다
구글신과함께공부하자
"""
result = [j[i * 2] for i, j in enumerate(우리의결의.splitlines())]
# 취하고싶으면달려라[0], 맡은업무를반드시마치자[2], 노력없는성과는없다[4], 구글신과함께공부하자[6]
print(result)

rrr = [(j, i * 2) for i, j in enumerate(우리의결의.split('\n'))]  ## i : 인덱스, j : 값 인덱스가 증가 할 때마다 +2 인덱스를 불러 읽음
print(rrr)

# splitlines == sp


print("==========================")

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h"]

nums = [i for i in range(20)]

answer = [alpha + str(num) for alpha in alphabet for num in nums if num % 2 == 0]

print(len(answer))
