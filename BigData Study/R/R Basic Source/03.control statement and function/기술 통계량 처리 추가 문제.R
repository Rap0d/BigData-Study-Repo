# 과목별 최소 점수들을 벡터 변수 vec01에서 저장하세요.
vec01 <- c(min(jumsu$kor), min(jumsu$eng), min(jumsu$math))
vec01

# 과목별 (최대-최소)의 차이 값을 벡터 변수 vec02에서 저장하세요.
diff_kor <- max(jumsu$kor) - min(jumsu$kor)
diff_eng <- max(jumsu$eng) - min(jumsu$eng)
diff_math <- max(jumsu$math) - min(jumsu$math)
vec02 <- c(diff_kor, diff_eng, diff_math)
vec02 # [1] 23 63 22

# as.logical 함수를 이용하여 국어(kor) 점수 중에서 짝수의 개수를 반환하는 함수 myfunctin을 만들어 보세요.
myfunction <- function( x ){
  booltest <- as.logical( x %% 2 == 1)
  return (sum(booltest))
}

jumsu <- read.csv('jumsunew.csv')
jumsu
mykor <- jumsu$kor
result <- myfunction( mykor )
cat('count :', result)

