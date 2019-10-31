member <- read.csv('member.csv', header=T)
member

board <- read.csv('board.csv', header=T)
board

# 컬럼 정보 확인
colnames(member)
colnames(board)

# help(merge)
result <- merge(member, board, by='아이디')
result

result <- merge(member, board, by='아이디', all=TRUE)
result

library(plyr)

# type의 기본 값이 'left'이므로 왼쪽 기준으로 보여 준다.
result <- join(member, board, by='아이디')
result

result <- join(member, board, by='아이디', type='inner')
result

result <- join(member, board, by='아이디', type='full')
result

result <- tapply(member$급여, member$성별, mean)
result

result <- tapply(member$적립포인트, member$성별, sum)
result

# ddply(data, 기준컬럼, 적용할함수)
result <- ddply(member, .(성별), summarise, meandata=mean(급여), sumdata=sum(급여))
result

# transform : 기본 함수외에 파생 컬럼 추가시 사용
# result <- ddply(member, .(성별), transform, meandata=mean(급여), sumdata=sum(급여), percent=mean(급여)/sum(급여))
# result






