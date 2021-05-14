import cx_Oracle as oci

# 1. 연결 얻어오기
conn = oci.connect("SCOTT/TIGER@127.0.0.1:1521/xe")
print("연결 성공 : ", conn.version)

# 2. 커서 얻어오기
cursor = conn.cursor()

# 3. SQL 문장
sql = "SELECT * FROM emp"

# 4. SQL 실행
cursor.execute(sql)

# (1). 커서에서 값 가져오기
# for rows in cursor:
#     print(rows)
#     print(rows[0], rows[1], rows[2])

# (2). 리스트형식 가져오기
datas = cursor.fetchall()
print(datas)
print(type(datas))
for rows in datas:
    print(rows)
    print(rows[0], rows[1], rows[2])

# 5. 커서 닫기
cursor.close()
# 6. 연결 닫기
conn.close()
