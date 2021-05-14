"""
경로 이동(cd)은 Path 모듈로 안되어 os 모듈이 필요하다
"""
from pathlib import Path
import os

# print(Path.cwd())
# os.chdir("..")  # 작업 영역을 부모로 이동
# print(Path.cwd())

# shutill 라이브러리 이용
# import shutil

# shutil.rmtree("imsi")   # 자식 존재해도 디렉토리 삭제 가능

# shutil.copy("Ex00.txt", "babo.txt") # 파일 복사

# shutil.copytree("../f_path_class", "temp")

# shutil.rmtree("temp")
