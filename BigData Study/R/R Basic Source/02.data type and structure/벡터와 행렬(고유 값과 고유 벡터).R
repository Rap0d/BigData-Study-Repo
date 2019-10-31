a1 = c(34.74, 15.66)
a2 = c(15.66, 378.6)

result = rbind(a1, a2)
result
# [,1]   [,2]
# a1 34.74  15.66
# a2 15.66 378.60

# eigen 함수를 이용하면 행렬의 고유 값과 고유 벡터를 구해준다.
eigen( result )
# $values
# [1] 379.31171  34.02829
# 
# $vectors
# [,1]        [,2]
# [1,] -0.04540086 -0.99896885
# [2,] -0.99896885  0.04540086

# abcd : 행렬 result의 고유 값과 고유 벡터를 저장하기 위한 변수
abcd = eigen( result )

attributes( abcd ) 
# $names
# [1] "values"  "vectors"

abcd$values[1]
# [1] 379.3117

abcd$values[2]
# [1] 34.02829

abcd$vectors[1,]
# [1] -0.04540086 -0.99896885