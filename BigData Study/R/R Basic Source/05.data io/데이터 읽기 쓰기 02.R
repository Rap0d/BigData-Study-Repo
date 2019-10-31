# header는 기본 값이 FALSE이지만 습관적으로 적어 주도록 하자
# 파일에 header이 없는 경우
member01 <- read.table(file='member01.txt', header=FALSE)
member01

# getter
colnames(member01)
rownames(member01)

# setter
colnames(member01) <- c('번호', '이름', '키', '몸무게')  
rownames(member01) <- c('hong', 'lee', 'kim', 'park')

member01


# 구분자 Tab으로 되어 있는 경우 sep 옵션을 이용하여 처리
member02 <- read.table(file='member02.txt', sep='\t', header=TRUE)
member02

# 파일 선택 대화 상자 사용하기
mydata <- read.table(file.choose(), header=TRUE)
mydata


# 세미콜론으로 구분자인 경우
member03 <- read.table(file='member03.txt', sep=';', header=TRUE)
member03


member04 <- read.table(file='member04.txt', sep='\t', header=TRUE)
member04

# - 문자는 NA로 표시해 주세요.
# NA : 결측치, 결측값
member04 <- read.table(file='member04.txt', sep='\t', header=TRUE, na.strings = '-')
member04
