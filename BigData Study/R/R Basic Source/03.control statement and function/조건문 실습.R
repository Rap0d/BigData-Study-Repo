x <- 6
y <- 5

z <- x * y

if( x * y >= 40){
	cat( 'x * y의 결과는 40 이상입니다.\n')
	cat( 'x * y = ', z )
}else{
	cat( 'x * y의 결과는 40 미만입니다.\n')
	cat( 'x * y = ', z )
}

# 키보드로 입력 받기
score <- scan()
print(score)

# 조건문으로 학점 처리
result <- '노력'
if( score >= 40){
	result <- '우수'
}
cat( '당신의 학점은 ', result)

# print() 함수는 변수와 수식에만 사용 가능하다
print( result ) 

# ifelse 함수
ifelse(score >= 80, '우수', '노력') # 우수

# ifelse() 함수와 scan() 함수로 정수 1개 입력 받아서, 홀짝 판단하기
cat('정수 1개를 입력하세요.')
su <- scan()
comment <- ifelse( su %% 2 == 0, '짝수', '홀수')
comment

# ifelse 구문을 이용하여 x가 y의 약수인지를 판별하는 코드 작성.
x <- 5
y <- 12
ifelse( y%%x == 0, 'yes', 'no')

# 다중 택일
score <- 75
if( score >= 90 ){
  grade <- 'A'
}else if( score >= 80 ){
  grade <- 'B'
}else if( score >= 70 ){
  grade <- 'C'
}else if( score >= 60 ){
  grade <- 'D'
}else{
  grade <- 'F'
}
cat( '학점 :', grade )

# 파일을 이용한 예시
excel <- read.csv( 'excel.csv', header = T )
dim(excel)
q1 <- excel$q1

result <- ifelse(q1 >= 2 & q1 <= 4, q1^2, q1)
head(excel$q1, 10)
head(result, 10)
 
# switch 함수
switch('name', id='hong', name='홍길동', password='1234', age=15)
 
# scan()으로 문자 입력 받기
empname <- scan(what='')
empname

# 조건에 맞지 않는 데이터가 들어오면 결과 값은 NULL이다.
switch(empname, hong=250, kim=500, choi=300, lee=100)