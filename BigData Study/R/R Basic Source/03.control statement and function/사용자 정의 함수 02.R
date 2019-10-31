x <- 3
y <- 6

mymax <- function(x, y){
  result <- max(x, y)
  return (result)
}
result1 <- mymax(x, y)
result1

jegob <- function(x, y){
  result <- x**2 + y**2
  return (result)
}

result2 <- jegob(x, y)
result2

mysub <- function(x, y){
  result <- x - y
  return (result)
}

result <- mysub(result2, result1)
result

# 함수를 직접 호출
newresult <- mysub(jegob(x, y), mymax(x, y))
newresult