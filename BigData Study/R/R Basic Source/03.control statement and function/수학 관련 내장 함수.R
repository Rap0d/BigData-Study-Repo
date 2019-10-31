data <- read.csv('mathfunc.csv')
data

kor <- data$kor
kor

sqrt(kor) # 제곱근

ceiling(kor) # 올림

floor(kor) # 버림

round(kor) # 반올림

round(kor, 1) # 소수점 1자리까지 반올림 

# 벡터 값에 대한 누적 합
cumsum(kor) 

kor
# 몇 번째 인덱스가 제일 큰 값인가요?
which.max(kor) 

which.min(kor)

# pi(radian) = 180(degree)
sin(pi/2)

cos(pi/2)

tan(pi/4)

# 밑을 e로 하는 자연 로그 10의 값
# 무리수 e = 2.718281828이다.
log(10) 

# 밑을 10으로 하는 자연 로그 10의 값
log10(10)  

abs(-3)  # 절대값

vec <- c(1:3)
prod(vec) # 벡터의 곱


# 계승(1*2*3*4*5)=120
fact <- 5
factorial(fact)

kor <- data$kor
kor
eng <- data$eng
eng
math <- data$math
math

help(pmax)
# pmax : 1개 이상의 벡터에서 index 간의 비교를 통하여 최대값 추출하기
pmax( kor)
pmax( kor, eng)
pmax( kor, eng, math)
pmin( kor, eng, math)