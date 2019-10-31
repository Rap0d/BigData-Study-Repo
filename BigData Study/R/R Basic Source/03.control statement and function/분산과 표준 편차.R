x <- c(7, 5, 12, 9, 15, 6)

var_sd <- function( x ){
  myvar <- var( x )
  mysd <- sd( x )
  return (c(myvar, mysd))
}

result <- var_sd(x)
result
# [1] 14.800000  3.847077

cat('분산 :', result[1], '\n' )
cat('표준 편차 :', result[2], '\n' )
