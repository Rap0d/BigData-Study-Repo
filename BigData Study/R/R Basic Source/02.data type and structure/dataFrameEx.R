# 여러 개의 벡터를 이용하여 생성이 가능하다.
no <- c(1, 2, 3)
name <- c('hong', 'lee', 'kim')
pay <- c(100, 200, 300)
emp01 <- data.frame(No=no, Name=name, Pay=pay)
emp01
#   No Name Pay
# 1  1 hong 100
# 2  2  lee 200
# 3  3  kim 300

mode(emp01) # "list"
class(emp01) # "data.frame"

# 행렬을 이용한 생성
# 행렬을 이용하여 DataFrame를 생성할 수 있다.
m <- matrix(c(1, 'hong', 100, 2, 'kim', 200, 3, 'kang', 300), 3, byrow=T)

mode(m) # "character"
class(m) # "matrix"

emp02 <- data.frame( m )

colnames(emp02) <- c('번호', '아이디', '급여') # setter 개념

colnames(emp02) # getter 개념

emp02

# txt 파일을 이용한 생성
# txt 파일을  이용하여 DataFrame를 생성할 수 있다.
emp03 <- read.table('emp.txt', header=T, sep='')
emp03
#   사번 이름 급여
# 1    1 hong  100
# 2    2  kim  200
# 3    3 kang  300

# csv 파일을 이용한 생성
# csv 파일을  이용하여 DataFrame를 생성할 수 있다.
emp04 <- read.csv('emp.csv', header=T)
emp04
#   사번 이름 급여
# 1    1 hong  100
# 2    2  kim  200
# 3    3 kang  300

# 컬럼명이 없는 경우, col.names 속성을 사용하면 된다.
name <- c('사번', '이름', '급여')
emp04 <- read.csv('emp2.csv', header=F, col.names=name)
emp04
#   사번 이름 급여
# 1    1 hong  100
# 2    2  kim  200
# 3    3 kang  300
