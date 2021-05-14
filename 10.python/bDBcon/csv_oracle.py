import cx_Oracle as oci
import csv


def createDBTable():
    conn = oci.connect("SCOTT/TIGER@127.0.0.1:1521/xe")
    cursor = conn.cursor()
    sql = """
    CREATE TABLE supply(
        id integer not null primary key,
        Supplier_Name varchar2(30),
        Invoice_Number varchar2(30),
        Part_Number varchar2(30),
        Cost number,
        Purchase_Date date
    )
    """
    cursor.execute(sql)
    # 기본키를 위한 시퀀스
    sql2 = """
    CREATE SEQUENCE seq_supply_id
    """
    cursor.execute(sql2)
    cursor.close()
    conn.close()


def saveDB(data):
    conn = oci.connect("SCOTT/TIGER@127.0.0.1:1521/xe")
    cursor = conn.cursor()
    sql = """
        INSERT INTO supply(id, Supplier_Name, Invoice_Number, Part_Number, Cost, Purchase_Date)
        VALUES(seq_supply_id.nextval, :0, :1, :2, :3, :4)
        """
    cursor.execute(sql, data)  # 각 인덱스에 data 값 삽입
    cursor.close()
    conn.commit()  # 파이썬은 오토커밋 X
    conn.close()


def viewDB(tablename):
    conn = oci.connect("SCOTT/TIGER@127.0.0.1:1521/xe")
    cursor = conn.cursor()
    sql = "SELECT * FROM "+tablename
    cursor.execute(sql)
    datas = cursor.fetchall()
    for rows in datas:
        print(rows)
    cursor.close()
    conn.commit()  # 파이썬은 오토커밋 X
    conn.close()


if __name__ == "__main__":  # 모듈 참조가 아닌 자신을 실행하면
    # 1. 테이블 생성
    # createDBTable()

    # 2. 파일 데이터 읽어 저장
    # file_name = "supply.csv"
    # f = open(file_name, "r")  # 한글 없으니 인코딩 안할게
    # datas = csv.reader(f, delimiter=",")  # 구분자 지정
    #
    # header = next(datas, None)  # 읽으면서 아무일도(None) 하지 않음
    # print(header)
    # print("=" * 50)
    # for row in datas:
    #     print(row)
    #     saveDB(row)

    # 3. 테이블 레코드 검색
    viewDB("supply")
