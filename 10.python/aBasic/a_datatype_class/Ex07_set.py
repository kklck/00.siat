# -----------------------------------------------
#  집합
#       - 집합에 관련된 자료형
#       - 순서를 지정하지 않는다
#       - 중복을 허용하지 않는다


s = set()               # 빈 집합을 생성
s = set([1,2,3,1,1])
print(s)
# print(s[0]) # 순서나 인덱스 개념이 없기 때문에

s3 = {3,4,5,6}
print(s.intersection(s3)) #교집합
print(s.union(s3)) #합집합

print(s & s3) # 3
print(s | s3) # 1 2 3 4 5 6
print(s - s3) # 1 2
print(s3 - s) # 4 5 6

