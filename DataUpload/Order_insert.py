import pymysql
import pandas as pd

# mysql 경로: C:\Program Files\MySQL\MySQL Server 8.0\bin

####### 데이터베이스 연동 #########
conn=""
try:
    conn=pymysql.connect(host="", user="", password="", db="", charset="utf8")
    print("데이터베이스 연결 성공")
except:
    print("데이터베이스 연결 실패")
    exit(0)


######## 데이터 엑셀 파일 가져오기 #########
file=pd.read_csv("Order.csv")
#print(file)


###### 데이터 업로드 ######
cur=conn.cursor()
cur.execute("DROP TABLE IF EXISTS OrderInfo")
cur.execute("CREATE TABLE OrderInfo (ORDR_ID int PRIMARY KEY, MBR_ID VARCHAR(15), ORDR_YMD VARCHAR(20), ORDR_SUM_AMT int, ORDR_PAY int, ORDR_ADDR VARCHAR(50), ORDR_RCPN VARCHAR(10), ORDR_TELNO VARCHAR(20))")
print("OrderInfo 테이블 생성 성공")

sql = "INSERT INTO OrderInfo VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
for idx, row in file.iterrows():
    cur.execute(sql, tuple(row))

conn.commit()
print("데이터 저장 완료")


###### 데이터 저장 확인용 ######
cur.execute("SELECT * FROM OrderInfo")

result=cur.fetchall()
result_df=pd.DataFrame(result)
result_df.columns=['ORDR_ID', 'MBR_ID', 'ORDR_YMD', 'ORDR_SUM_AMT', 'ORDR_PAY', 'ORDR_ADDR', 'ORDR_RCPN', 'ORDR_TELNO']
print(result_df)


###### 데이터베이스 연결 종료 ######
conn.close()
