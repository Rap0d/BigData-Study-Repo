# 실습 : 함수 도움말 보기
# R에서 제공되는 기본 함수의 도움말은 'help(함수명)' 또는 '?함수명' 형식으로 확인할 수 있다.
help(mean)

?sum

# ※ google 사이트에서는 '함수명() in r' 형식으로 검색할 수 있다.

# 실습 : 함수 파라미터(매개변수) 보기
# args()함수는 특정 함수를 대상으로 사용 가능한 함수 파라미터를 보여준다.

# 함수의 매개 변수(arguments) 보기
args(mean)

# 함수의 예제 보기
# example()함수는 R에서 제공되는 기본 함수들의 사용 예제를 제공해준다.
# 아래의 예시는 함수 sum()에 대한 예를 보여 주고 있다.

example(seq)

example(mean)

mean(10:20)

x <- c(0:10, 50)
mean(x)
# [1] 8.75

# 현재 작업 공간(working directory) 확인
getwd()

# 작업 공간을 c:\work로 변경하기
# 해당 폴더는 미리 만들어져 있어야 한다.
setwd('c:/work/')
# 또는 
setwd('c:\\work\\')
