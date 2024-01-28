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
file=pd.read_csv("BookMark.csv")
#print(file)


###### 데이터 업로드 ######
cur=conn.cursor()
cur.execute("DROP TABLE IF EXISTS BookMark")
cur.execute("CREATE TABLE BookMark (BKMK_ID int PRIMARY KEY, MBR_ID VARCHAR(15), FRCS_ID VARCHAR(20))")
print("BookMark 테이블 생성 성공")

sql = "INSERT INTO BookMark VALUES (%s,%s,%s)"
for idx, row in file.iterrows():
    cur.execute(sql, tuple(row))

conn.commit()
print("데이터 저장 완료")


###### 데이터 저장 확인용 ######
cur.execute("SELECT * FROM BookMark")

result=cur.fetchall()
result_df=pd.DataFrame(result)
result_df.columns=['BKMK_ID','MBR_ID','FRCS_ID']
print(result_df)


###### 데이터베이스 연결 종료 ######
conn.close()
