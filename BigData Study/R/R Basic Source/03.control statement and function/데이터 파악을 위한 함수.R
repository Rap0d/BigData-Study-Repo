jumsu <- read.csv("jumsu.csv")

# 앞 6행만 출력하세요.
head(jumsu) 

# 앞 10행만 출력하세요.
head(jumsu, n=10)

# 뒷 6행만 출력하세요.
tail(jumsu) 

# 뒷 10행만 출력하세요.
tail(jumsu, 10)

# 데이터 뷰어 창에서 jumsu 데이터 확인하기
View(jumsu) 

# 데이터의 차원 확인하기
# 행, 열의 차원 출력하기
dim(jumsu)  

# 데이터 속성 확인
str(jumsu)  

# 요약 통계량 출력
summary(jumsu)