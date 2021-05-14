from pathlib import Path

# ------------------------------------------------
# 1. 경로의 상태보기
print(Path.cwd())  # pwd : 리눅스에서 현재 디렉토리 경로 보여주는 명령어
print(Path.home())

p = Path("Ex03_createPath.py")
print(p.stat())  # stat : 리눅스에서 해당 파일의 상세 정보 표시

# ----------------------------------------------------
# 2. 경로(파일) 생성시간 알아보기
from _datetime import datetime

tm = p.stat().st_atime  # stat으로 st_atime=1620952839 인지
print(tm)
print(datetime.fromtimestamp(tm))  # 해당 파일이 만들어진 시간을 포맷팅
# ------------------------------------------------
# 3. 디렉토리 생성
# p1 = Path("imsi")
# p1.mkdir()  # 디렉토리 생성

p2 = Path("imsi")
p2.mkdir(exist_ok=True)  # 해당 경로가 존재해도 만들어줘

p3 = Path("imsi2/temp2/test")
p3.mkdir(parents=True, exist_ok=True)  # 부모도 있던데 같이 만들거지?
# ------------------------------------------------
# 4. 파일 생성
# with open("imsi/1.txt", "w", encoding="utf-8") as f:
#     f.write("오늘도 화이팅")

# p = Path("imsi/2.txt")
# with open(p, "w", encoding="utf-8") as f:
#     f.write("오늘도 진짜 화이팅")

# p = Path("imsi/3.txt")
# p.write_text("주말 많이 행복하렴~", encoding="utf-8")

# ------------------------------------------------
#  5. 경로 제거

f = Path("imsi/3.txt")
f.unlink()  # 파일 삭제

p = Path("imsi")
p.rmdir()  # 디렉토리 삭제, 자식 존재 시 삭제 불가

# 라이브러리를 이용하여 자식 삭제
