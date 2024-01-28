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
file=pd.read_csv("Delivery.csv")
#print(file)


###### 데이터 업로드 ######
cur=conn.cursor()
cur.execute("DROP TABLE IF EXISTS Delivery")
cur.execute("CREATE TABLE Delivery (DELIVERY_ID int PRIMARY KEY, ORDR_ID int, DELIVERY_YMD VARCHAR(20), DELIVERY_BZENT_NM VARCHAR(10), DELIVERY_NUM int, DELIVERY_FLAG int)")
print("Delivery 테이블 생성 성공")

sql = "INSERT INTO Delivery VALUES (%s,%s,%s,%s,%s,%s)"
for idx, row in file.iterrows():
    cur.execute(sql, tuple(row))

conn.commit()
print("데이터 저장 완료")


###### 데이터 저장 확인용 ######
cur.execute("SELECT * FROM Delivery")

result=cur.fetchall()
result_df=pd.DataFrame(result)
result_df.columns=['DELIVERY_ID','ORDR_ID','DELIVERY_YMD','DELIVERY_BZENT_NM','DELIVERY_NUM','DELIVERY_FLAG']
print(result_df)


###### 데이터베이스 연결 종료 ######
conn.close()
