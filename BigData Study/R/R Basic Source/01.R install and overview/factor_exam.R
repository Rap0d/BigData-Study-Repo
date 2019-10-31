# 다음 변수와 plot() 함수를 이용하여 그래프 그리기.
human <- c('남자', '여자', '여자', '남자', '남자')

plot(human)

mode(human)
# [1] "character"

class(human)
# [1] "character"

Nhuman <- as.factor(human)
mode(Nhuman)
# [1] "numeric"

class(Nhuman)
# [1] "factor"

table(Nhuman)
# Nhuman
# 남자 여자 
#    3    2 

plot(Nhuman)

Ohuman <- factor(human, levels=c('여자', '남자'), ordered = T )
Ohuman
# [1] 남자 여자 여자 남자 남자
# Levels: 여자 < 남자

plot(Ohuman)
