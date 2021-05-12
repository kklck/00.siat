"""
import datetime
today = datetime.date.today();
print('today is ', today)
"""
import datetime
today = datetime.date.today()
print(today)
print("=========================")

# data 안에 datetime 만 쓰고자
from datetime import date, timedelta
today = date.today()
print("today is ", today)
print(today.year,"년",today.month,"월",today.day,"일")

print("=========================")

print("어제 : ",today + timedelta(days=-1))
print("일주일 전 ", today+timedelta(days=-7))
print("열흘 후 ", today+timedelta(days=10))

print("=========================")
# 날짜 변환
# 1. 날짜 -> 문자열, strftime()
from datetime import datetime
today = datetime.today()
print(today.strftime("%m/%d/%Y"))
print(today.strftime("%Y %m %d %H:%M:%S"))

print("=========================")
# 2. 문자열 -> 날짜, strptime()
today = "2021-08-30 12:20:33"
print(datetime.strptime(today,"%Y-%m-%d %H:%M:%S"))
print(type(datetime.strptime(today,"%Y-%m-%d %H:%M:%S")))
