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
file=pd.read_csv("Franchise.csv")
#print(file.head())

###### 데이터 업로드 ######
cur=conn.cursor()
cur.execute("DROP TABLE IF EXISTS franchise")
cur.execute("CREATE TABLE franchise (FRCS_ID VARCHAR(15) PRIMARY KEY, FRCS_NM VARCHAR(30), FRCS_CO_ADDR VARCHAR(50), FRCS_TYPE int, FRCS_PW VARCHAR(50))")
print("Franchise 테이블 생성 성공")

sql = "INSERT INTO franchise VALUES (%s,%s,%s,%s,%s)"
for idx, row in file.iterrows():
    cur.execute(sql, tuple(row))

conn.commit()
print("데이터 저장 완료")


###### 데이터 저장 확인용 ######
cur.execute("SELECT * FROM Franchise")

result=cur.fetchall()
result_df=pd.DataFrame(result)
result_df.columns=['FRCS_ID', 'FRCS_NM', 'FRCS_CO_ADDR', 'FRCS_TYPE', 'FRCS_PW']
print(result_df)


###### 데이터베이스 연결 종료 ######
conn.close()