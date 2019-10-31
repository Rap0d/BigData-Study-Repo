# 주석은 샵으로 시작해요.
# <-은 대입 연산자
# 문자열은 외따옴표나 쌍따옴표

# NA : 파이썬의 None, db의 null과 유사한 개념(결측치)

# 변수 사용 예시
var1 <- 0
var1
var2 <- 100
var2
var3 <- 'aaa'
var3

# 변수.멤버 형태
goods.code <- 'a001'
goods.name <- '냉장고'
goods.price <- 85000
goods.des <- '최고 사양, 동급 최고 품질'

# 스칼라 변수 : 정적인 원소 1개를 담고 있는 변수 
name <- '홍길동'
age <- 35

# 변수 이름을 입력하면 출력이 된다
name
age

age <- 20
name <- "김철수"
hasCar <- TRUE # 자동차 유무

# T는 True을 의미한다.
# NA : Not Available
sum(10, 20, 30, NA)

# na.rm=T은 NA는 빼고 연산하세요.
sum(10, 20, 30, NA, na.rm=T)

ls() # 현재 사용중인 변수 목록 보기

x <- 100

is.character( name )

is.numeric( age ) 

is.logical( hasCar )

is.na( x  )

somedata <- c(10, 15, "20")
somedata
# [1] "10" "15" "20"
result <- somedata  * 3 
# Error in somedata * 3 : non-numeric argument to binary operator

# 숫자형으로 변환
result <- as.numeric(somedata) * 3 
result
# [1] 30 45 60


# mode와 class 함수
# 기본 자료형은 mode와 class의 결과 값이 동일하다.
data <- c(1, 2)

mode( data ) # 자료형 확인
# [1] "numeric"

class( data ) # 자료 구조 확인
# [1] "numeric"

df <- as.data.frame(data)
mode( df ) # 자료형 확인
# [1] "list"

class( df ) # 자료 구조 확인
# [1] "data.frame"