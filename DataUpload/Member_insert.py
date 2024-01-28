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
file=pd.read_csv("Member.csv", encoding="CP949")
"""
print(file.head())
print()
print(str(file.loc[0]['MBR_TELNO']))
"""


###### 데이터 업로드 ######
cur=conn.cursor()
cur.execute("DROP TABLE IF EXISTS member")
cur.execute("CREATE TABLE Member (MBR_ID VARCHAR(15) PRIMARY KEY, MS_ID int, MBR_PW VARCHAR(50), MBR_NM VARCHAR(10), MBR_BD VARCHAR(15), MBR_GD int, MBR_EML_ADDR VARCHAR(30), MBR_TELLNO VARCHAR(20), MBR_ADDR VARCHAR(50))")
print("Member 테이블 생성 성공")

sql = "INSERT INTO member VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
for idx, row in file.iterrows():
    cur.execute(sql, tuple(row))

conn.commit()
print("데이터 저장 완료")


###### 데이터 저장 확인용 ######
cur.execute("SELECT * FROM Member")

result=cur.fetchall()
result_df=pd.DataFrame(result)
result_df.columns=['MBR_ID','MS_ID','MBR_PW','MBR_NM','MBR_BD','MBR_GD','MBR_EML_ADDR','MBR_TELLNO','MBR_ADDR']
print(result_df.head())


###### 데이터베이스 연결 종료 ######
conn.close()