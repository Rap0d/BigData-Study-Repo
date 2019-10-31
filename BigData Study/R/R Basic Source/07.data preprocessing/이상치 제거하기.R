# 실습 : 이상치 제거하기 - 존재할 수 없는 값
# 성별을 의미하는 gender는 1또는 2의 값만 가질 수 있고, 
# 시험 점수를 의미하는 jumsu는 1점부터 5점까지 값을 가질 수 있다고 가정하자.
outlier <- data.frame(gender = c(1, 2, 3, 1, 2, 1),
            jumsu = c(2, 5, 3, 4, 1, 6))
outlier
unique(outlier$gender)
unique(outlier$jumsu)
 
# 데이터에 이상치가 있는 지 확인하려면 table() 함수를 이용하여 빈도 표를 만들어 보면 된다.
# 실행해 보면 gender에는 존재할 수 없는 값 3이 보이고 있다.
# 또한 jumsu에는 존재할 수 없는 값 6이 보이고 있다.
table(outlier$gender)
 
table(outlier$jumsu)
 
# gender가 3이면 NA 할당
outlier$gender <- ifelse(outlier$gender == 3, NA, outlier$gender)

# 1, 2를 제외한 나머지 모두 결측치로 처리
condition1 <- outlier$gender == 1 | outlier$gender == 2
outlier$gender <- ifelse(condition1, outlier$gender, NA)

table(outlier$gender, useNA = 'ifany')
 
# jumsu가 5보다 크면 NA 할당
outlier$jumsu <- ifelse(outlier$jumsu > 5, NA, outlier$jumsu)
 
condition2 <- outlier$jumsu >= 1 & outlier$jumsu <= 5
outlier$jumsu <- ifelse(condition2, outlier$jumsu, NA)

table(outlier$jumsu, useNA = 'ifany')

outlier
 
library(dplyr)

# 결측치를 제외하고 그룹 연산
outlier %>% filter(!is.na(gender) & !is.na(jumsu)) %>% 
	group_by(gender) %>% summarise(mean_jumsu = mean(jumsu))
 
# 실습 : 이상치 제거하기 - 극단적인 값
# 실제 존재하는 값이긴 하지만, 극단적으로 크거나 작은 값을 "극단치"라고 한다.
# 몸무게가 600kg이라고 한다. 
# 사실 존재할 수 없는 값이라고 보면 된다.

install.packages('ggplot2')
library(ggplot2)

help(mpg) # ggplot2에서 제공하는 데이터 셋
# drv(구동 방식 : 사륜(4), 전륜(f), 후륜(r))
# hwy(gallon 당 고속도로 주행 마일수)

par('mar')
par(mar=c(1, 1, 1, 1))

# 극단치 데이터가 들어 있는 mpg 데이터 셋을 가지고 실습해 보기로 한다.
# mybox : 그래프의 결과 정보를 가지고 있는 객체
mybox <- boxplot(mpg$hwy)

attributes(mybox) # 속성 확인하기

# 실습 : 다섯 가지 통계치를 출력하기
# 상자 그림 통계치 출력
mybox$stats # 상태 속성 정보 보기
#      [,1]
# [1,]   12
# [2,]   18
# [3,]   24
# [4,]   27
# [5,]   37
# attr(,"class")
# 1
# "integer"
 
# 값의 범위가 12보다 작거나, 37을 넘어 가면 극단치로 볼 수 있다.
sort(mpg$hwy) #  데이터 확인
 
# 실습 : 결측 처리하기
# 상자 그림을 이용하여 정상적인 데이터의 범위를 확인했으니, 
# 이 범위를 벗어난 값에 대하여 결측 처리를 수행하면 된다.
# 12~37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
 
# 결측치 확인
table(is.na(mpg$hwy))
 
# 실습 : 결측치를 제외한 간단한 분석
# 극단치에 대하여 결측 처리를 수행했으므로, 
# 결측치를 제외한 간단한 분석 작업을 수행하면 다음과 같다.
result <- mpg %>% group_by(drv) %>% 
	summarise(mean_hwy = mean(hwy, na.rm=T))
result