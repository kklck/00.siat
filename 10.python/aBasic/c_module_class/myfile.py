# 1. 모듈 전체 참조
"""
import mymodule

today = mymodule.get_weather()
print("오늘의 날씨는", today)

date = mymodule.get_date()
print("오늘의 날씨는", date)
"""

# 2. 모듈 별칭
"""
import mymodule as my

today = my.get_weather()
print("오늘의 날씨는", today)

date = my.get_date()
print("오늘의 날씨는", date)
"""

# 3. 전체 모듈 중 필요한 것만 참조

"""
from mymodule import get_weather, get_date

today = get_weather()
print("오늘의 날씨는", today)

date = get_date()
print("오늘의 날씨는", date)
"""

# [참조]

from mymodule import get_weather as gw

today = gw()
print("오늘의 날씨는", today)
