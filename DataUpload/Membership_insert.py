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
file=pd.read_csv("Membership.csv")


###### 데이터 업로드 ######
cur=conn.cursor()
cur.execute("DROP TABLE IF EXISTS membership")
cur.execute("CREATE TABLE Membership (MS_ID int PRIMARY KEY, MS_NM VARCHAR(10), MS_DSCNT_AMT int)")
print("Membership 테이블 생성 성공")

fileToList=[[file.loc[idx][col] for col in range(file.shape[1])] for idx in range(file.shape[0])]
#print(fileToList)

for ele in fileToList:
    sql=f"INSERT INTO Membership VALUES({int(ele[0])}, '{str(ele[1])}', {int(ele[2])})"
    #print(sql)
    cur.execute(sql)

conn.commit()
print("데이터 저장 완료")


###### 데이터 저장 확인용 ######
cur.execute("SELECT * FROM Membership")

result=cur.fetchall()
print(result)


###### 데이터베이스 연결 종료 ######
conn.close()