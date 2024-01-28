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
file=pd.read_csv("Inventory.csv")
#print(file)


###### 데이터 업로드 ######
cur=conn.cursor()
cur.execute("DROP TABLE IF EXISTS Inventory")
cur.execute("CREATE TABLE inventory (IVT_ID int PRIMARY KEY, IVT_CNT int, IVT_GRD_LEVEL int, IVT_GDS_AMT int, IVT_GDS_ORDR_CNT int, GDS_ID int, FRCS_ID VARCHAR(15))")
print("Inventory 테이블 생성 성공")

sql = "INSERT INTO Inventory VALUES (%s,%s,%s,%s,%s,%s,%s)"
for idx, row in file.iterrows():
    cur.execute(sql, tuple(row))

conn.commit()
print("데이터 저장 완료")


###### 데이터 저장 확인용 ######
cur.execute("SELECT * FROM Inventory")

result=cur.fetchall()
result_df=pd.DataFrame(result)
result_df.columns=['IVT_ID','IVT_CNT','IVT_GRD_LEVEL','IVT_GDS_AMT','IVT_GDS_ORDR_CNT',"GDS_ID",'FRCS_ID']
print(result_df)


###### 데이터베이스 연결 종료 ######
conn.close()
