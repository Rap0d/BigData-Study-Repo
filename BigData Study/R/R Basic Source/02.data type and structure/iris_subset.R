iris

str(iris)

unique(iris$Species)

# setosa 품종만 조회
subset(iris, Species == 'setosa')

# setosa 품종 중에서 꽃받침의 길이가  5.3이상인 항목
filter01 <- subset(iris, Species == 'setosa' & Sepal.Length >= 5.3)

filter01
nrow(filter01)

# iris에서 일부 컬럼만 추출하기
filter02 <- subset(iris, select = c('Species', 'Sepal.Length', 'Sepal.Width'))

filter02

# 꽃잎의 너비가 0.5이하인 데이터 셋 추출
filter03 <- subset(iris, Petal.Width <= 0.5)
filter03

# 꽃잎의 너비가 0.5이하인 iris 데이터 셋에서 Species, Sepal.Length, Petal.Length 컬럼만 추출
filter04 <- subset(iris, Petal.Width <= 0.5, c(Species, Sepal.Length, Petal.Length))
filter04

# 꽃 받침의 길이가 7.4이상인 데이터 셋 중에서 품종 컬럼만 제외하고 추출하기 
filter05 <- subset(iris, Sepal.Length >= 7.4, select=-c(Species))
filter05