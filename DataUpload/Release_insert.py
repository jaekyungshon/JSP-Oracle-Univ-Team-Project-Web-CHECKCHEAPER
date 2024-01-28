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
    
cur=conn.cursor()
cur.execute("DROP TABLE IF EXISTS ReleaseHistory")
cur.execute("CREATE TABLE ReleaseHistory (RL_ID int PRIMARY KEY, FRCS_ID VARCHAR(15), GDS_ID int, GDS_NM VARCHAR(30), GDS_MKR_NM VARCHAR(30), CTGRY_ID int, IVT_ID int, IVT_CNT int, IVT_GRD_LEVEL int, IVT_GDS_AMT int, IVT_GDS_ORDR_CNT int)")
print("ReleaseHistory 테이블 생성 성공")

###### 데이터베이스 연결 종료 ######
conn.close()
