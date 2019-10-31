dataset <- read.csv('dataset.csv', header=T)

# gender 컬럼은 성별을 명목 척도로 표현한 변수이다.
# 범주형 변수의 극단치 처리
gender = dataset$gender

gender # 0, 5의 극단치 값이 보인다.

table(gender) # 빈도수
# gender
#   0   1   2   5 
#   2 173 124   1 

# 파이 차트로 outliner 확인
pie(table(gender)) 

# 파일 이름 : before_극단치.png(그림 참고)
 
# subset() 함수를 이용하여 성별 변수를 정제한다.
dataset = subset(dataset, gender==1 | gender==2)
dataset # gender변수 데이터 정제
 
length(dataset$gender) # 297개 - 3개 정제됨
pie(table(dataset$gender))
 
# 파일 이름 : after_극단치.png(그림 참고)

dataset <- read.csv('dataset.csv', header=T)

# 연속형 변수의 극단치 처리
dataset$price # 세부 데이터 보기

length(dataset$price) # 300개(NA포함)

plot(dataset$price)   # 산점도 

summary(dataset$price) # 범위확인
#     Min.  1st Qu.   Median     Mean  3rd Qu.     Max.     NA's 
# -457.200    4.400    5.400    8.784    6.300  675.000       30 

# 연속형 변수는 산점도를 이용하여 전반적인 분포 형태를 보면서 극단치를 확인하는 것이 좋다.
# 또한 summary() 함수에서 제공하는 요약 통계량(최소, 최대, 평균 등등)을 통해서 극단치를 어떻게 처리할 것인가를 결정한다.
 
# price 변수의 데이터 정제와 시각화
dataset2 = subset(dataset, dataset$price >= 2 & dataset$price <= 8)
length(dataset2$price) 

stem(dataset2$price)  # 줄기와 잎 도표 보기
#   The decimal point is at the |
# 
#   2 | 133
#   2 | 
#   3 | 0000003344
#   3 | 55555888999
#   4 | 000000000000000111111111222333334444
#   4 | 566666777777889999
#   5 | 0000000000000000001111111111222222222333333344444
#   5 | 5555555566667777778888899
#   6 | 00000000000000111111112222222222222333333333333333344444444444
#   6 | 55557777777788889999
#   7 | 00011122
#   7 | 777799 

summary(dataset2$age) 

length(dataset2$age) 

dataset2 <- subset(dataset2, age >= 20 & age <= 69)

boxplot(dataset2$age) 