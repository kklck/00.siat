"""
 - import pathlib 만 선언하면
        Path클래스 사용시 pathlib.Path라고 명시해야 한다. 
"""
from pathlib import Path

# (1) 해당 경로와 하위 목록들 확인

# p = Path("C:\windows")
p = Path("..")
print(p)
print(p.resolve())  # 절대경로 출력

# test = []
# for d in p.iterdir():  # 하위 파일과 디렉토리의 요소들
#     if d.is_dir():  # 디렉토리만
#         test.append(d)

test = [d for d in p.iterdir() if d.is_dir()]

# print(test)

p = Path("c:/00.siat/10.python")  # f_path_class
i = list(p.glob("**/a_datatype_class/*.py"))  # 최상위 path에서 탐색할 때 중간 디렉터리 무시
print(i)
