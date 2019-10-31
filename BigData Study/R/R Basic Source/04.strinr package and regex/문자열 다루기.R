###############################################################################
library(stringr)

mystr <- '홍길동&10&역삼동&hong@naver.com=박영희&20&공덕동&park@daum.net'
delimiter <- '='

# simplify = TRUE 옵션은 벡터로 만들어 준다.
mysplit <- str_split( mystr, delimiter, simplify = TRUE)

mysplit
vec <- c()
for ( one in mysplit ){
  delimiter <- '&'
  mydata <- str_split( one, delimiter, simplify = TRUE)

  delimiter <- '@'
  idemail <- str_split( mydata[4], delimiter, simplify = TRUE)
  #print(idemail)
  vec <- c(vec, c( mydata[1], mydata[2], mydata[3], idemail[1], idemail[2]))
}
vec

mat <- matrix(vec, nrow=2, byrow = T)
mat

df <- as.data.frame( mat )
colnames(df) <- c('이름','나이','주소','아이디','메일주소')

df
###############################################################################
mystr <- '사과10=배20=감15=사과30'
mydata <- str_split( mystr, '=', simplify = TRUE)
mydata
vec <- c()
setfruits <- c() # 집합
for (one in mydata){
  name <- str_extract(one, '[가-히]{1,}')
  qty <- str_extract(one, '[0-9]{2}')
  print(name)
  print(qty)
  setfruits <- c(setfruits, name)
  vec <- c(vec, name, qty)
}
setfruits
setfruits <- unique(setfruits)
setfruits
vec
mat <- matrix(vec, ncol=2, byrow = T)
mat
dffruit <- as.data.frame(mat)
colnames(dffruit) <- c('과일', '수량')
dffruit
###############################################################################
