# install.packages('plyr')
library(plyr)

# utf-8로 저장시 다음과 같은 오류 내용 낭옴
# Error in make.names(col.names, unique = TRUE) : 
#   invalid multibyte string 1
data <- read.csv('취득현황.txt', header=T, encoding='utf-8')
data 

# ddply(data, 기준컬럼, 적용할함수)
result01 <- ddply(data, .(성별), summarise, meandata=mean(취득점수), sumdata=sum(취득점수))
result01

result02 <- ddply(data, .(지역), summarise, meandata=mean(취득점수), sumdata=sum(취득점수))
result02

result03 <- ddply(data, .(지역, 성별), summarise, meandata=mean(취득점수), sumdata=sum(취득점수))
result03

result04 <- ddply(data, .(지역, 성별), transform, meandata=mean(취득점수), sumdata=sum(취득점수), aa=취득점수/sum(취득점수) )
result04

mode(result03)
class(result03)