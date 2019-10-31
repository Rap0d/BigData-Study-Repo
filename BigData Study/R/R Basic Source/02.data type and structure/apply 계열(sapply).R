# jumsu.txt 파일을 읽어서 jumsu이라는 변수에 저장한다.
jumsu <- read.table("jumsu.txt", header=TRUE)
jumsu

# jumsu데이터에서 학번열을 제거한다.
jumsu <- jumsu[-1] 
jumsu

# 각각의 열의 합계를 구한다.  help(sapply)
sapply(jumsu, sum) # sapply(data, function)
# 국어 수학 영어 
#   32   29   34 

# simplify = F이면 lapply와 동일하게 리스트 형태로 결과를 출력한다.
sapply(jumsu, sum, simplify = F)

sapply(jumsu, sum, USE.NAMES = TRUE )
sapply(jumsu, sum, USE.NAMES = FALSE ) 

# 각각의 열의 평균을 구한다.
sapply(jumsu, mean)
# 국어 수학 영어 
#  6.4  5.8  6.8 

# 참고로 unlist() 함수를 적용해서 lapply()에 적용하면 sapply()와 동일한 결과가 된다.
# lapply() 함수의 반환 타입은 list이다.
# unlist() 함수는 list를 vector으로 변형해주는 함수이다.
unlist(lapply(jumsu, sum))
# 국어 수학 영어 
#   32   29   34 