# 데이터 로딩 및 기본 데이터 내용 조회
abccsv <- read.csv(file='abc.csv', header=TRUE)
abccsv

unique(abccsv$check)

# subset 함수는 Database의 where 절과 유사한 개념
check5 <- subset(abccsv, abccsv$check == 5)
check5

# check가 3이 아닌 행 추출
# 결측치는 포함 대상에서 제외됨
check_not_3 <- subset(abccsv, abccsv$check != 3)
check_not_3

# check가 결측치인 행 추출
check_na <- subset(abccsv, is.na(abccsv$check))
check_na

unique(abccsv$survey)

# |는 or 논리 연산자 
# survey 컬럼이 3 또는 1 또는 결측치인 행 추출
filter01 <- subset(abccsv, is.na(abccsv$survey) | abccsv$survey == 3 | abccsv$survey == 1)
filter01

# 정렬하기 
asc <- order(+abccsv$age) # 오름차순
asc
abccsv[asc,]

# 내림차순
desc <- order(-abccsv$age) 
desc
abccsv[desc,]

# job은 내림차순, gender는 오름차순으로 정렬
abccsv[order(-abccsv$job, +abccsv$gender), ]

# 별도의 변수를 만드는 경
condition1 <- order(-abccsv$job, +abccsv$gender)
abccsv[condition1, ]

# check의 디폴트 : 3
abccsv$check <- ifelse(is.na(abccsv$check), 3, abccsv$check)

# 결측치 price는 나머지 price의 평균 값으로 대체
mean_price <- mean(abccsv$price, na.rm=T)
abccsv$price <- ifelse(is.na(abccsv$price), mean_price, abccsv$price)

# survey의 디폴트 : 3
abccsv$survey <- ifelse(is.na(abccsv$survey), 3, abccsv$survey)

abccsv

write.csv(abccsv, 'abcClenaData.csv')