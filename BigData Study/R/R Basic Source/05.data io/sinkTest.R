name <- c('김유신', '이순신', '강감찬', '이황')
kor <- c(10, 20, 30, 40)
eng <- c(50, 60, 70, 80)
math <- c(70, 80, 10, 20)
sungjuk <- data.frame(name, kor, eng, math)
sungjuk

data <- c(10, 20)

getwd()

# 파일 abcd.txt는 미리 만들 필요 없다.
# 파일을 메모리에 만들고 쓰기 시작한다.
sink('abcd.txt')

sungjuk

data 

sink() # 파일 닫으면서 디스크에 기록한다.