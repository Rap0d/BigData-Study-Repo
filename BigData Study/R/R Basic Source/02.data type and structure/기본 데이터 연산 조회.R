# 데이터 로딩 및 기본 데이터 내용 조회
abcCsv <- read.csv("abc.csv", header=TRUE)
 
# 다음과 같은 방식으로 데이터를 조회할 수 있다.
abcCsv
 
(abcCsv)
 
print(abcCsv)
 
# 표 형식으로 출력한다.
View(abcCsv) # 기본 값은 6줄
 
# 간단히 앞또는 뒤의 몇개만 조회
head(abcCsv) 
 
tail(abcCsv)
 
head(abcCsv, 2) # 2줄만 조회

# header의 이름 정보를 구해준다.
names(abcCsv)
# [1] "gender"   "job"      "age"      "position" "address"  "total"    "check"    "price"   
# [9] "survey"  
 
attributes(abcCsv) # 객체들의 속성 정보를 확인할 수 있다.
# $names
# [1] "gender"   "job"      "age"      "position" "address"  "total"    "check"    "price"   
# [9] "survey"  
# 
# $class
# [1] "data.frame"
# 
# $row.names
# [1] 1 2 3 4 5 6
 
# 해당 컬럼에 대한 내용(값)을 조회한다.
abcCsv$job
abcCsv$total
 
abcCsv$job
 
abcCsv$total 
 
# 대괄호를 이용하여 접근할 수 있다.
# 위치 인덱스를 이용하여 접근할 수 있다.
abcCsv[2] # 2번째 컬럼을 의미한다.
 
abcCsv[6]
 
abcCsvJob <- abcCsv$job
abcCsvJob
# [1] 1 2 2 3 3 2

abcCsvTotal <- abcCsv$total
abcCsvTota
# [1] 50 80 60 70 50 40
 
# 데이터 로딩 및 기본 데이터 내용 조회(계속)
# 변수 2개 이상을 조회하는 경우
abcCsv[c("job", "total")]
 
# gender age position가 조회된다.
abcCsv[c(1, 3:4)] # 1base이다.
 
# 특정 행열만을 지정하여 조회하기
# 사용 형식 : abcCsv[ 행정보, 열정보 ]
# 행정보가 명시되어 있지 않으면, 모든 행을 의미한다.

# 3행만 보여 주세요
abcCsv[3,]
 
# 2행만 보여 주세요
abcCsv[2,]
 
# 2열만 보여 주세요
abcCsv[,2]
 
# 1, 3열을 보여 주세요
abcCsv[(c(1, 3))]
 
# 1, 3행을 보여 주세요
abcCsv[(c(1, 3)),]
 
# 2부터 3행까지 보여 주세요
abcCsv[(c(2:3)),]
 
# 2열과 5~6열까지 보여 주세요
abcCsv[,(c(2, 5:6))]
 
# 마이너스가 붙으면 제외하는 항목을 의미한다.
# 2열과 5 ~ 6열을 제외한 모든 열을 보여 주세요
abcCsv[,(-c(2, 5:6))]