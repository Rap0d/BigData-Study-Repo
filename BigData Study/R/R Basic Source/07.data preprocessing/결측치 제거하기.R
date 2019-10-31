# 실습 : 결측치 찾기
df <- data.frame(name=c('김철수','홍길순','강감찬','박철수','김영희'), 
         gender=c('남자','여자', NA, '남자','여자'), score=c(10, 15, 20, 25, NA))
 
df
 
# 결측치에 대한 확인은 is.na() 함수를 사용하면 된다.
is.na(df) # 결측치 확인

sum(is.na(df)) # NA의 개수 확인
 
# 참거짓을 빈도 표로 보여 준다.
table(is.na(df)) # 결측치 빈도 출력
# 전체 10개의 데이터 중에서 결측치가 2개 이다.
 
# 점수 컬럼의 평균을 산출하는 경우 1개의 요소가 NA이므로 전체 결과는 NA이다.
# 결측치와의 연산 결과는 역시 결측치이다.
# 집계 함수는 기본 값으로 na를 포함한다.
mean(df$score)  
 
sum(df$score)   # 합계 산출
 
# 실습 : 결측치 제거하기
# is.na()를 dplyr 패키지의 filter() 함수에 적용하면 결측치가 있는 행을 제거시킬 수 있다.
library(dplyr)  # dplyr 패키지 로드
 
# score 컬럼 중 값이 NA인 데이터만 출력한다.
df %>% filter(is.na(score)) 
df %>% filter( is.na(gender) )

# gender와 score를 모두 가지고 있는 학생은?
df %>% filter( !is.na(score) & !is.na(gender) )
 
# score 컬럼에서 결측치를 제외한 항목들을 출력한다.
df_nomiss <- df %>% filter(!is.na(score)) 
df_nomiss
 
# 결측치가 제거되었으므로 수치 연산 함수를 적용하게 되면 결과들이 정상적으로 출력이 된다.
mean(df_nomiss$score) # score 평균 산출
 
sum(df_nomiss$score) # score 합계 산출
 
# 여러 컬럼(score, gender) 동시에 결측치가 아닌 데이터만 추출하기
# & 연산자는 and 연산자이고, ! 연산자는 부정(negative)을 의미하는 연산자이다.
df_nomiss <- df %>% filter(!is.na(score) & !is.na(gender))  
df_nomiss # 출력
 
# na.omit() 함수를 사용하면 컬럼을 지정하지 않고 결측치가 있는 행을 한꺼번에 제거할 수 있다.
# 모든 컬럼에 결측치 없는 데이터 추출
df_nomiss2 <- na.omit(df)  
df_nomiss2 # 출력
 
# 실습 : 함수의 결측치 제외 기능 이용하기
# mean()과 같은 수치 연산 함수들은 결측치를 제외시키고 연산을 하도록 설정해주는 na.rm 파라미터를 지원한다.
mean(df$score, na.rm = T) # 결측치 제외하고 평균 산출  
sum(df$score, na.rm = T) # 결측치 제외하고 합계 산출
 
students <- read.csv("jumsu2.csv")  # 데이터 불러오기
# 3, 8, 15행의 kor에 NA 값을 할당한다.
students[c(3, 8, 15), "kor"] <- NA 
students
 
# kor에 대한 평균을 다음과 같이 구해보도록 한다.
# 하지만, 일부 데이터가 NA를 포함하고 있으므로 결과는 NA가 된다.
students %>% summarise(mean_kor = mean(kor))
 
students %>% summarise(mean_kor = mean(kor, na.rm = T))  
 
# 몇 가지 요약 통계량 산출해보기
students %>% summarise(mean_kor = mean(kor, na.rm = T),    # 평균 산출
                       sum_kor = sum(kor, na.rm = T),      # 합계 산출
                       median_kor = median(kor, na.rm = T))  # 중앙값 산출
 
# 실습 : 평균 값으로 결측치 대체하기
# "결측치 대체법"은 결측치 데이터에 대하여 어떤 정해진 값을 치환하는 방법을 말한다.
# 결측치에 대하여 다른 값으로 대체하여 데이터가 손실되어 
# 왜곡 현상이 생기는 것을 방지하기 위함이다.
# 일반적으로 평균 값이나 최빈 값 같은 대표 값을 구해서 
# 모든 결측치를 하나의 값으로 일괄 대체 하는 방식을 많이 사용한다.
# 예시에서는 평균 값을 이용하여 대체하여 보도록 한다.
 
# 결측치 제외하고 kor 평균 산출
mean(students$kor, na.rm = T) 
 
# kor 컬럼 중에서 NA 항목들은 평균 값인 58.23529로 대체한다.
students$kor <- ifelse(is.na(students$kor), 58.23529, students$kor)  
 
# 결측치 빈도표를 생성해본다. TRUE가 없다는 얘기는 결측치가 없다는 의미이다.
table(is.na(students$kor))

sum(is.na(students$kor))

students # 값을 출력한다. 결측치가 없어야 한다.
 
mean(students$kor) # kor 평균 산출