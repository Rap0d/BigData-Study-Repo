###########################################################################
mf2 <- function( x ){
  if( x > 0 ){
    x <- 2 * x
  }else if( x == 0 ){
    x <- 0
  }else{
    x <- -3 * x
  }
  return ( x )
}

mf2(3)

data <- c(2, -4, 0, -3)

for( one in data ){
  result = mf2(one)
  print( result )
}
###########################################################################
print('정수 1개를 입력하세요')
no <- scan()
ifelse( no %% 2 == 0, '짝수', '홀수' )
###########################################################################
myf1 <- function( x ){
  if( x > 5 ){
    return (1)
  }else(
    return (0)
  )
}
myf1( 4 )
data <- c(8, 2, 3, 9)
for( one in data ){
  print( myf1(one))
}
###########################################################################
myf2 <- function( x ){
  if( x >= 0 ){
    return (1)
  }else(
    return (0)
  )
}
myf2( 4 )
data <- c(8, -2, 3, -9)
for( one in data ){
  print( myf2(one))
}
###########################################################################
myf3 <- function( x, y ){
  return (abs(x - y))
}
myf3( 4, 6 )
myf3( 8, -2 )
myf3( -20, 7 )

print('정수 입력하세요.')
su <- scan()
mode(su)
class(su)
for (item in su ){
  print(item)
}
###########################################################################
myf4 <- function( x ){
  if( x < 0 ){
    return (0)
  }else if( x >= 1 & x <= 5 ){
    return (1)
  }else(
    return (10)
  )
}
myf4( 7 )
data <- c(8, -2, 3)
for( one in data ){
  print( myf4(one))
}
###########################################################################
myf5 <- function(  ){
  print('문자 입력하세요.')
  munja <- scan(what=character())
  if( munja == 'Y' | munja == 'y' ){
    print('Yes')
  }else{
    print('Not Yes')
  }
}
myf5()
###########################################################################
for2 <- function( x ){
  i <- 0
  for ( j in 1:x){
    i <- i + j
  }
  return ( i )
}
result <- for2(10)
result

result <- for2(100)
result

result <- for2(100) - for2(50)
result
###########################################################################
# help(read.table)

#> var1 <- read.csv('채소.txt', header=F, col.names = 'name', encoding='utf-8')
#Error in type.convert.default(data[[i]], as.is = as.is[i], dec = dec,  :
#                                invalid multibyte string at '<eb><8b><b9>洹<bc>'

var1 <- read.table('채소.txt', col.names = 'name')
var1
mode(var1$name)
class(var1$name)
vec <- as.vector(var1$name)
vec
for (item in vec){
  if (item == '버섯'){
    next
  }else{
    print( item )
  }
}
###########################################################################