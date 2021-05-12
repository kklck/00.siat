s = ["안녕하세요.", "감사합니다.", "행복하세요."]
if s:
    print("요소가 존재합니다")
    if s[2][0] == "행":
        print("ok")
    else:
        print("no")
else:
    print("요소가 없습니다.")

print("==============================")

for i in s:
    print(i)
else:
    print("안녕히 가세요")
print("==============================")

c = 0
while len(s) - c:
    # data = s.pop()
    # print(data)
    print(s[c])
    c += 1
else:
    print("안녕히 가세요")
print("==============================")

a, b, c = s
print(a, b, c)
print("==============================")

result = [[i, j] for i, j in enumerate(s)]
print(result)

for i, j in enumerate(s):
    print(i, j)

print("==============================")

names = ["홍길동", "박길동", "김길동"]
for i, j in zip(s, names):
    print(i, j)

result = list(zip(s, names))
print(result)

print("==============================")
