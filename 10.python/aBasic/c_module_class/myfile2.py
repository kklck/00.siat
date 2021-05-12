# mypackage / mymodule / 함수들 호출

# 1. 전체 경로

"""
import mypackage.mymodule

print("오늘 날씨는", mypackage.mymodule.get_weather())
"""

# 2. from 설정

from mypackage import mymodule as my
print("오늘 날씨는", my.get_weather())
