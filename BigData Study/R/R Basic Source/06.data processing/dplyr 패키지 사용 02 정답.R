# install.packages( 'dplyr' )
library( dplyr )

data <- read.csv('2013년_프로야구선수_성적.csv')

# 파일을 읽어와서 data에 저장하세요.
data

# 경기 수가 120 이상인 선수만 필터링하세요. 
data2 <- filter( data, 경기 >= 120 )
data2

# 경기 수가 120 이상이고, 득점이 80이상인 선수만 필터링하세요. 
data3 <- filter( data, 경기 >= 120 & 득점 >= 80 )
data3

# 포지션이 1루수와 3루수인 선수들만 필터링하세요.
# %in% : in 연산자
data4 <- filter( data, 포지션 %in% c('1루수', '3루수') )
data4

data4 <- filter(data, 포지션 == '1루수' | 포지션 == '3루수')
data4

# 선수명, 포지션, 팀 컬럼만 조회하세요.
data5 <- select(data, c(선수명, 포지션, 팀))
data5

# 순위 컬럼 부터 타수 컬럼까지 조회하세요.
colnames(data)
data6 <- select(data, 순위:타수)
data6

# 포지션이 1루수 또는 3루수인 선수들의 선수명, 포지션, 득점을 출력
myfilter <- filter(data, 포지션 %in% c('1루수', '3루수'))
myfilter

data7 <- select(myfilter, c(선수명, 포지션, 득점))
data7

# %>% : 여러 개의 문장을 조합할 때 사용하는 문법
# %>% : pipe operator(연결 연산자)
result <- data %>% filter(포지션 %in% c('1루수', '3루수')) 
		%>% select(c(선수명, 포지션, 득점))
result

# 홈런, 타점, 도루를 제외한 나머지 컬럼들만 조회하세요.
data8 <- select(data, -c(홈런, 타점))
data8
colnames(data)
colnames(data8)

# 선수 이름, 팀, 경기, 타수를 조회하되, 타수가 400이상인 선수들만 출력하기
data9 <- data %>% select( 선수명, 팀, 경기, 타수 ) 
		%>% filter( 타수 >= 400 )
data9

# 홈런 컬럼으로 오름차순 정렬
data10 <- data %>% arrange(홈런) 
data10

# 홈런 컬럼으로 내림차순 정렬
data11 <- data %>% arrange(desc(홈런))
data11

# 선수명, 팀, 경기, 타수를 조회하되, 타수가 400이상인 항목 조회하기
# 단, 홈런 컬럼으로 내림차 정렬 하시오.

# 홈런 컬럼이 없어지므로 오류 발생
data12 <- data %>% select( 선수명, 팀, 경기, 타수 ) 
			%>% filter( 타수 >= 400 ) 
			%>% arrange(desc(홈런))
data12

# %>% : pipe operator(연결 연산자)
data13 <- data %>% arrange(desc(홈런)) 
			%>% select( 선수명, 팀, 경기, 타수 ) 
			%>% filter( 타수 >= 400 ) 
data13

data14 <- data %>% select( 선수명, 팀, 경기, 타수) 
		%>% mutate(결과=경기 * 타수) 
data14

colnames(data)
# 루타의합 = 안타+2루타+3루타
data15 <- data %>% mutate(루타의합=안타+X2루타+X3루타) 
		%>% select( 선수명, 팀, 경기, 타수, 루타의합)  
		%>% arrange(루타의합)
data15

# 팀별 평균 경기 수
data16 <- data %>% group_by( 팀 ) 
		%>% summarise(average=mean(경기, na.rm=TRUE))
data16

# 포지션별로 득점의 총합
data17 <- data %>% group_by( 포지션 ) %>% 
	summarise(sumtotal=sum(득점, na.rm=TRUE))
data17

data18 <- data %>% group_by( 팀 ) %>% 
	summarise(average=mean(경기, na.rm=TRUE), 
	sumtotal=sum(득점, na.rm=TRUE))
data18

# 경기와 타수의 평균을 각각 구해준다.
data %>% group_by( 팀 ) 
		%>% summarize_each( list(mean), 경기, 타수 ) 

# 몇 개인지 개수까지 표시해준다.
data %>% group_by( 팀 ) 
		%>% summarize_each( funs(mean, n()), 경기, 타수 ) 