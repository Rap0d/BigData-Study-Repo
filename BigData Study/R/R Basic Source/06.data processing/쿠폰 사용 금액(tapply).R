data <- read.csv('mydata.csv', header=TRUE)
data

# 리코딩
# coupon ==> 1 : 할인쿠폰, 2 : 적립쿠폰
unique(data$coupon)

data$coupon2 <- factor(data$coupon, levels=c(1, 2), 
                       labels=c('할인쿠폰', '적립쿠폰'))

data$amount; data$coupon2

data

# tapply(a, b, func )
# b별로 그룹핑하여 a에 대하여 func 함수를 적용해주세요.
ta <- tapply(data$amount, data$coupon2, mean )
ta

barplot(ta, col=rainbow(2), main='쿠폰 유형별 사용 금액', 
        xlab='쿠폰 유형', ylab='평균 사용 금액')
# 파일 이름 : 쿠폰 유형별 평균 사용 금액.png