# 재고 테이블 데이터 생성 및 csv 배포

import pandas as pd
import random, os

range_IVT_CNT=[i for i in range(301)] # 0 1 2 3 ...
price=[i for i in range(300,1500)]
GDS_price={
    0: [i for i in range(400,500,10)], # 감자
    1: [i for i in range(500,780,10)], # 밤고구마
    2: [i for i in range(500,1800,10)], # 호박고구마
    3: [i for i in range(2500,4246,10)], # 깻잎
    4: [i for i in range(100,200,10)], # 단무지
    5: [i for i in range(459,783,10)], # 당근
    6: [i for i in range(3930,6425,10)], # 대파
    7: [i for i in range(1048,2193,10)], # 마늘
    8: [i for i in range(1315,2573,10)], # 무
    9: [i for i in range(3110,4990,10)], # 배추
    10: [i for i in range(1960,4250,10)], # 양송이버섯
    11: [i for i in range(726,1980,10)],# 느타리버섯
    12: [i for i in range(2413,4400,10)],#시금치
    13: [i for i in range(1133,2500,10)],#적상추
    14: [i for i in range(1000,2000,10)],#상추
    15: [i for i in range(3000,4000,10)],#양배추
    16: [i for i in range(3693,5722,10)],#양파
    17: [i for i in range(1121,1823,10)],#오이
    18: [i for i in range(944,1200,10)],#쪽파
    19: [i for i in range(1700,2160,10)],#콩나물
    20:[i for i in range(1555,4067,10)],#풋고추
    21:[i for i in range(1300,2400,10)],#늙은호박
    22:[i for i in range(1480,2370,10)],#애호박
    23:[i for i in range(1500,3800,10)],#오이고추
    24:[i for i in range(1675,2809,10)],#적사과
    25:[i for i in range(2000,3000,10)],#복숭아
    26:[i for i in range(3000,4000,10)],#포도
    27:[i for i in range(249,353,10)],#감귤
    28:[i for i in range(1122,2598,10)],#단감
    29:[i for i in range(268,330)],#바나나
    30:[i for i in range(268,330)],#참다래
    31:[i for i in range(5480,8573,10)],#파인애플
    32:[i for i in range(1000,2000,10)],#오렌지
    33:[i for i in range(1000,2000,10)],#자몽
    34:[i for i in range(766,1037,10)],#레몬
    35:[i for i in range(766,1037,10)],#체리
    36:[i for i in range(500,900)],#건포도
    37:[i for i in range(500,700)],#블루베리
    38:[i for i in range(399,530)],#망고
    39:[i for i in range(1210,2027,10)],#아보카도
    40:[i for i in range(5000,6000,10)],#메론
    41:[i for i in range(1500,2800,10)],#청사과
    42:[i for i in range(14000,20661,1000)],#샤인머스켓
}
l=[i for i in range(0,43)]
IVT_GDS_shf=[random.randrange(0,43) for _ in range(201)] # 상품 리스트 셔플
#print(store) # 데이터프레임 개수와 같은지 확인용

content={
    'IVT_ID' : [i for i in range(201)],
    'IVT_CNT' : [range_IVT_CNT[random.randrange(0,301)] for _ in range(201)],
    'IVT_GRD_LEVEL' : [0,1,2]*67,
    'IVT_GDS_AMT' : [GDS_price[i][random.randrange(len(GDS_price[i]))] for i in IVT_GDS_shf],
    'IVT_GDS_ORDR_CNT' : [random.randrange(101) for _ in range(201)],
    'GDS_ID' : IVT_GDS_shf,
    'FRCS_ID' : [f"store{random.randrange(1,200):03d}" for _ in range(201)]
}

df=pd.DataFrame(content)
for _ in range(20):
    row=random.randrange(0,201)
    df.loc[row,['IVT_CNT']]=0
#print(df.loc[df['IVT_CNT']==0])
print(df)

file_path='D:/학교/23_2학기(4-1_보충)/데이터베이스설계/프로젝트데이터업로드/Inventory.csv'
if os.path.isfile(file_path):
    os.remove(file_path) # Inventory.csv 실행 중이라면, 닫고 실행.

df.to_csv(file_path,index=None)
print()
print("csv 파일 저장 완료")
