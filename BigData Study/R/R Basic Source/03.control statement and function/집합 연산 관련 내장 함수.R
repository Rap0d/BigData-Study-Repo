x <- c(1, 2, 3, 4)
y <- c(4, 1, 3, 2)

setequal( x, y )

y <- c(1, 2, 3, 5)

setequal( x, y )

x <- c(1, 2, 3, 4)
y <- c(3, 4, 5, 6)

myunion <- union(x, y)
myunion

myintersect <- intersect(x, y)
myintersect

x_minus_y <- setdiff(x, y)
x_minus_y

y_minus_x <- setdiff(y, x)
y_minus_x

myfind = 7 
# 집합 x에 myfind가 들어 있나요?
result <- myfind %in% x 
result

myfind <- c(4, 5) 
result <- myfind %in% x 
result

# x 또는 y에 숫자 6이 들어 있으면 'yes'를 아니면 'no'를 출력해보세요.
myfind <- 6

condition <- (myfind %in% x | myfind %in% y)

if( condition ){
  print('yes')
}else{
  print('no')
}

ifelse( condition, 'yes', 'no')

data <- c(1:5)
myfind <- c(2, 6, 3, 1)

# %in% 키워드와 sum 함수를 적절히 사용하여 data안에 myfind의 요소가 몇 개 있는지 구해 보세요.
result <- sum( myfind %in% data )
result






