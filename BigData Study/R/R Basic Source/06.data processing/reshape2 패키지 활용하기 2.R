# install.packages( 'reshape2' )
library( reshape2 )

fruits <- read.csv('fruits_10.csv')
# 연도별 과일별 판매 수량과 금액
fruits

# melt 함수를 이용하여, 데이터를 아래로 길게(long) 보여 주기
# id 속성에 기준이 되는 변수 이름을 넣어 준다.
fruitMelt <- melt(fruits, id='year')
fruitMelt

# 컬럼 여러 개를 이용하기
fruitMelt2 <- melt(fruits, id=c('year', 'name'))
fruitMelt2

# 컬럼의 이름을 asdf와 qwert로 변경하기
melt(fruits, id=c('year', 'name'), variable.name='asdf', value.name='qwert')

mtest <- melt(fruits, id=c('year', 'name'), variable.name='asdf', value.name='qwert')
mtest

# dcast 함수를 이용하여 원래 모양으로 되돌리기
dcast(mtest, year + name ~ asdf)

# melt 함수 사용시 사용했던 컬럼을 누락시키고 dcast를 적용하는 경우 경고 메시지가 나온다.
dcast(mtest, year~asdf)
# Using qwert as value column: use value.var to override.
# Aggregation function missing: defaulting to length

# name 별로 qty와 price의 합계 금액을 출력하는 예시
dcast(mtest, name~asdf, sum)

# subset 함수는 plyr 패키지가 필요하다.
library('plyr')
dcast(mtest, name~asdf, sum, subset=.(name == 'apple'))

# 논리 연산자 | 사용
dcast(mtest, name~asdf, sum, subset=.(name == 'apple' | name == 'berry'))
######################################################################################
# 참조용 파일 : pay_data_부분합.xlsx

# install.packages( 'reshape2' )
library( reshape2 )

pay_data <- read.csv('pay_data.csv', header = T)

head(pay_data)
# user_id product_type pay_method  price
# 고객 아이디 상품 타입 지불 방법   가격

# 고객별 상품 유형에 따른 구매 금액을 구하시오.
# 예를 들어서, 김철수의 사과 총 구매 금액은 21,000원이다.
# 행에는 고객 id를, 열에는 상품 타입을 명시한다.
result <- dcast(pay_data, user_id ~ product_type , sum, na.rm=T, value.var = 'price')
result 

result <- dcast(pay_data, user_id + product_type ~ pay_method , sum, na.rm=T, value.var = 'price')
result 

# 고객별 지불 유형에 따른 구매 금액을 구하시오.
# 예를 들어서, 김철수의 신용 카드 사용액은 14,000원이다.
# 행은 고객 id이고, 열은 지불의 유형이다.
pay_price = dcast(pay_data, user_id ~ pay_method, sum, na.rm=T, value.var = 'price')
pay_price

result <- dcast(pay_data, user_id ~ product_type + pay_method , sum, na.rm=T, value.var = 'price')
result 