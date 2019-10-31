# install.packages( 'reshape2' )
library(reshape2)

mytest <- read.csv("examtest.csv", header =T )
# mytest$gender <- as.factor(mytest$gender)
str(mytest)
mytest

# melt 함수를 이용하여 데이터를 길게 보여 주세요.
# names, gender 컬럼만 남기고 모든 항목들을 길게 늘어 뜨려 보여 주세요.
# variable와 value 컬럼은 자동으로 생성된다.
meltdata <- melt(mytest, id=c("names", "gender"))
head(meltdata)

mytest # 원본 데이터 다시 확인하기

# names 컬럼만 남기고 모든 항목들을 길게 늘어 뜨려 보여 주되
# "english"와 "math"에 해당하는 데이터만 보여 주세요
newmelt <- melt(mytest, id=c("names"), measure=c("english","math"))
newmelt

data <- read.csv('data.csv')
head(data, 3)

# 1월 1일의 고객 '강감찬'의 총합은 5이다.
widedata <- dcast(data, 이름 ~ 날짜, sum, value.var='구매수량')
widedata

# 파일 저장 및 읽기
write.csv( widedata, 'wide.csv', row.names=FALSE)
newwide <- read.csv('wide.csv')

# 컬럼 이름이 숫자로 시작되는 경우 앞에 X를 붙여준다.
colnames(newwide) # 컬럼 정보 읽어 오기
# [1] "이름"   "X01.01" "X01.02" "X01.03"

# 컬럼 이름을 다시 변경하기
colnames(newwide) <- c('이름', '1월1일', '1월2일', '1월3일')

newwide

# 넓은 형식을 긴 형식으로 변경 : melt() 함수
# id 속성에 지정되어 있는 항목을 기준으로 '긴 형식'으로 변경하는 함수이다.
long <- melt(newwide, id='이름')

head(long, 3)

# 컬럼 이름을 변경한다.
colnames(long) <- c('이름', '날짜', '구매수량')

head(long, 3)

students <- read.csv('students.csv')
students

# 첫번째 컬럼과 두번째 컬럼을 기준으로 긴 형식의 데이터프레임으로 변경
long <- melt(id=c(1:2), students)
head(long, 3)