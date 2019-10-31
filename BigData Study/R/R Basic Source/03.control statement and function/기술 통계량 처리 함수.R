jumsu <- read.csv('jumsunew.csv')
jumsu

min(jumsu$math) # 최솟값

max(jumsu$math) # 최댓값

range(jumsu$math) # 범위(20 99)

mean(jumsu$math) # 평균

# 중위수 확인하기 전에 정렬 해보기
sort(jumsu$math)

median(jumsu$math) # 중위수

sum(jumsu$math) #　합계

jumsu$math
order(jumsu$math)

# 동일 점수는 평균을 기본으로 순위 매긴다.
rank(jumsu$math)

# 데이터 샘플링
choice01 <- sample(1:nrow(jumsu), 2)
choice01
jumsu[choice01, ]

# 벡터 자료 대상 빈도수 구하기
mytable <- table(jumsu$math)  
mode(mytable) # "numeric"
class(mytable) # "table"
mytable

# 컬럼의 내용을 변수에 저장하기
mymath <- jumsu$math
mymath

# 각 값의 제곱 승 구하기
mymath**2

# 3의 배수인지 확인하기
mymath%%3

# as.logical : 논리형으로 변환
booltest <- as.logical(mymath%%3 == 0)
booltest

# 3의 배수의 갯수는?
sum(booltest)