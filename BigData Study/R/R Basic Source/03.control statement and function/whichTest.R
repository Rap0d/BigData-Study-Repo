name <- c('강감찬', '김유신', '이순신', '신사임당', '최영')

# 키보드에서 입력 받기
findname <- scan(what=character()) 
findname

result <- which( name == findname )
result

result2 <- which( name == '이성계' )
result2

# 데이터 프레임에서 which() 함수 사용
no <- c(1:5)
name <- c('강감찬', '김유신', '이순신', '신사임당', '최영')
score <- c(75, 80, 85, 90, 95)

exam <- data.frame( 학번=no, 이름=name, 성적=score)
exam

# 신사임당 입력
findname = scan(what=character()) 
findname

myindex <- which(exam$이름 == findname )
myindex

exam[myindex,]

# 성적 >= 88인 학생들
jumsu = scan( ) # 88 입력
jumsu

myindex2 <- which(exam$성적 >= jumsu)
myindex2 # [1] 4 5

exam[myindex2,]

# 80 <= 성적 <= 90인 학생들
print('범위 입력')
jumsu = scan( ) # 80과 90 입력
jumsu
jumsu[1]

myindex3 <- which(exam$성적 >= jumsu[1] & exam$성적 <= jumsu[2])
myindex3
exam[myindex3,]