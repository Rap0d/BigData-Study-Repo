# apply() 함수 사용
somedata = cbind(x1 = 3, x2 = c(4:1, 2:8))
 
dimnames(somedata)[[1]] = letters[1:11]

mode(somedata) # numeric
class(somedata) # matrix 
somedata
#   x1 x2
# a  3  4
# b  3  3
# c  3  2
# d  3  1
# e  3  2
# f  3  3
# g  3  4
# h  3  5
# i  3  6
# j  3  7
# k  3  8
 
# 각 열(두 번째 매개 변수가 숫자 2이다.)에 대하여 평균 구하기
apply(somedata, 2, mean)
#      x1       x2 
# 3.000000 4.090909 
 
colMeans( somedata )
#      x1       x2 
# 3.000000 4.090909 
 
# 각 열(두 번째 매개 변수가 숫자 2이다.)에 대하여 총합 구하기
apply(somedata, 2, sum)
# x1 x2 
# 33 45 
 
colSums ( somedata )
# x1 x2 
# 33 45 
 
# 각 행에 대하여 총합 구하기
apply(somedata, 1, sum) # 숫자 1은 행
# a  b  c  d  e  f  g  h  i  j  k 
# 7  6  5  4  5  6  7  8  9 10 11 
 
rowSums( somedata )
# a  b  c  d  e  f  g  h  i  j  k 
# 7  6  5  4  5  6  7  8  9 10 11 