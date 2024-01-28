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
file=pd.read_csv("Memberlog.csv", encoding="CP949")


###### 데이터 업로드 ######
cur=conn.cursor()
cur.execute("DROP TABLE IF EXISTS memberlog")
cur.execute("CREATE TABLE Memberlog (MBR_ID VARCHAR(15) PRIMARY KEY, JOIN_YMD VARCHAR(15), PSWD_CHG_YMD VARCHAR(15), MS_CHG_YMD VARCHAR(15), LGN_NUM int, PRCHS_NUM int)")
print("Memberlog 테이블 생성 성공")

sql = "INSERT INTO memberlog VALUES (%s,%s,%s,%s,%s,%s)"
for idx, row in file.iterrows():
    cur.execute(sql, tuple(row))

conn.commit()
print("데이터 저장 완료")


###### 데이터 저장 확인용 ######
cur.execute("SELECT * FROM Memberlog")

result=cur.fetchall()
result_df=pd.DataFrame(result)
result_df.columns=['MBR_ID','JOIN_YMD','PSWD_CHG_YMD','MS_CHG_YMD','LGN_NUM','PRCHS_NUM']
print(result_df.head())


###### 데이터베이스 연결 종료 ######
conn.close()