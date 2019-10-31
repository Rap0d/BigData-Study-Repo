x = c(1, 2, 3, 4, 5)
y = c(-1, -2, -3, -4, -5)

# x의 타입 확인하기
class( x )
# [1] "numeric"

# 더하기
result = x + y 
result 
# [1] 0 0 0 0 0

# 벡터의 곱 : 행렬이 된다.
# 1 * 1 + 2 * 2 + 3 * 3 + 4 * 4 + 5 * 5
result = x %*% x
result      

mode(result)

class(result) # "matrix"


# 벡터의 * 연산자는 각 요소간의 곱셉을 수행한다.
result = x * y 
result 
# [1]  -1  -4  -9 -16 -25

temp = c(x, y)
temp 
#  [1]  1  2  3  4  5 -1 -2 -3 -4 -5

class(temp)
# [1] "numeric"

# column binding : 행렬이 된다.
# x의 요소들을 1번째 수직으로 펼친다.
# y의 요소들을 2번째 수직으로 펼친다.
mat_c <- cbind(x, y) 
mat_c

# row binding : 행렬이 된다.
# x의 요소들을 1번째 수평으로 펼친다.
# y의 요소들을 2번째 수평으로 펼친다.
mat_r <- rbind(x, y) 
mat_r

# 행렬의 각 성분을 제곱하기

# 행렬의 * 연산자는 각 요소간의 곱셉을 수행한다.
# dim : 몇행 몇열인가?
dim(mat_r) # 2행 5열

# 전치 행렬 : 행렬의 행과 열을 서로 맞바꾼다.
mat_r_t = t(mat_r)
mat_r_t

dim(mat_r_t)

# 행렬의 곱 : 예시는 (2*5) %*% (5*2) --> (2*2)가 된다
result = mat_r %*% mat_r_t  
result

# 행렬의 차원 구하기
dim(result)