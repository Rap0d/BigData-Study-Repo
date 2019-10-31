# 원소 1개를 갖는 리스트 객체 생성
mylist = list( 'lee', '이순신', 100 )
mylist
# [[1]]
# [1] "lee"
 
# [[2]]
# [1] "이순신"
 
# [[3]]
# [1] 100
 
# 벡터 구조로 변경하기
myunlist <- unlist( mylist )
myunlist 
# [1] "lee"   "이순신" "100"   

# 2개 이상의 원소를 갖는 리스트 구조 생성
num <- list(c(1:5), c(6:10))
num
# [[1]]
# [1] 1 2 3 4 5
# 
# [[2]]
# [1]  6  7  8  9 10
 
# 키와 값을 가지는 리스트 구조 생성
member <- list(name='이순신', age=10, address='공덕동', gender='남자')
member
# $name
# [1] "이순신"
 
# $age
# [1] 10
 
# $address
# [1] "공덕동"
 
# $gender
# [1] "남자"
 
# 각 키를 접근하고자 하는 경우 달러를 사용하면 된다.
member$name
# [1] "이순신"

member$id <- 'lee'
member$age
# [1] 10

# 값을 제거하는 경우에는 NULL을 사용한다.
member$age <- NULL
member$age
# NULL

member$id <- 'kang'
member

length( member )


mode( mylist ) 
# [1] "list"

a <- list(c(1:5))
b <- list(c(6:10))

# list apply
lapply( c(a, b), max)
# [[1]]
# [1] 5
# 
# [[2]]
# [1] 10

# simple apply
sapply( c(a, b), max)
# [1]  5 10