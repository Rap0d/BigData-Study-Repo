# x   y
# 1   3
# 2   5
# 3   7

myfunc01 <- function( x ){
  result = 2 * x + 1
  return ( result )
}

x <- 1
result <- myfunc01( x ) 
result

x <- 2
result <- myfunc01( x ) 
result

vec <- c(1:3)
result <- myfunc01( vec )
result

# -1 <= x < 3 까지 직선을 그려 보세요.
x <- seq(-1, 3, by=0.1)
y <- myfunc01( x )
plot(x, y)

# y = ax1 + bx2 + c
# x1  x2  y
# 1   1   0
# 1   2   2
# 2   1   1

# a, b, c 부터 구하자
# a = 1, b = 2, c = -3 
myfunc02 <- function( x1, x2 ){
  result =  x1 + 2 * x2 - 3
  return ( result )
}

result <- myfunc02( 1, 1 )
result

result <- myfunc02( 1, 2 )
result

result <- myfunc02( 2, 1 )
result

# 다음과 같은 기능을 수행하는 사용자 정의 함수 myfunc04를 구현하시오.
# y = 2x1 + 3x2 + 5

# 이차 함수
# 다음과 같은 기능을 수행하는 사용자 정의 함수 myfunc03를 구현하시오.
# x    y
# 1    2-3+1=0
# 2    8-6+1=3
# 3    18-9+1=10 

myfunc03 <- function( x ){
  result =  2 * x**2 - 3 * x + 1
  return ( result )
}
x <- seq(0, 1.5, by=0.05)
y <- myfunc03( x )
plot(x, y)