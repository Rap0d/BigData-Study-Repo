# ddply 함수를 이용하여 다음 물음에 답하시오.
# 각 성별로 국어 점수의 총점을 변수(컬럼) korsum에 저장하세요.
# 각 성별로 영어 점수의 평균을 변수(컬럼) engavg에 저장하세요.
# 각 성별로 수학 점수의 최고 점수를 변수(컬럼) mathmax에 저장하세요.

install.packages('plyr')
library(plyr)

jumsu <- read.csv('jumsudata.csv', header=T)

result <- ddply(jumsu, .(성별), summarise, 
	korsum = sum(국어), engavg = mean(영어), mathmax = max(수학))

result 
#    성별 korsum engavg mathmax
#  1 남자    180     50      60
#  2 여자    255     65      40