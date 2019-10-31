dataset <- read.csv('dataset.csv')
dim(dataset)
str(dataset)

summary(dataset$price)
#     Min.  1st Qu.   Median     Mean  3rd Qu.     Max.     NA's 
# -457.200    4.425    5.400    8.752    6.300  675.000       30 

# 결측치가 포함된 데이터를 대상으로 sum() 함수를 적용하면 NA가 출력이 된다.
sum(dataset$price)
# [1] NA
 
# 결측치 제거 방법1
# na.rm=T 속성을 설정하면 해당 컬럼의 결측치를 제거해준다
sum(dataset$price, na.rm=T)
# [1] 2362.9
 
# 결측치 제거 방법2
# price 컬럼에 있는 모든 NA 제거
price2 = na.omit(dataset$price) 

sum(price2)    # 2362.9
# [1] 2362.9

length(price2) # 결측치 30개가 제거되었으므로 300 - 30 = 270개
 
#  결측치 대체하기
# 새로운 컬럼 price2 : 결측치는 0으로 대체하자
dataset$price2 <- ifelse(!is.na(dataset$price), dataset$price, 0)

# 새로운 컬럼 price3 : 결측치를 비결측치의 평균으로 대체
dataset$price3 <- ifelse(!is.na(dataset$price), dataset$price, 
		round(mean(dataset$price, na.rm=T), 2))

eval <- dataset[c('price', 'price2', 'price3')]

eval
# 결측치, 결측치 0으로 대체, 결측시 평균으로 대체한 컬럼들을 동시에 보기
dataset[c('price', 'price2', 'price3')]