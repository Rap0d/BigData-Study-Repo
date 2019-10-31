myvector <- c(1, 2, 3, 4, 5, 6)
mat_a <- matrix(myvector, nrow=3)
mat_a

mat_b <- matrix(myvector, nrow=2)
mat_b

# 위의 예에서 보다시피 행렬 값을 나열한뒤 ncol을 사용해 열의수를 지정하거나 nrow를 사용
# 해 행의 수를 지정하면 된다. 위 경우에는 행렬 값이 좌측 열부터 채워져오는데, 대신 행렬 값을
# 위쪽 행부터 채우고 싶다면 byrow를 사용한다.
mat_c <- matrix(myvector, nrow=2, byrow=T)
mat_c

# 위 코드에서 byrow=T의 T는 TRUE를 뜻한다. 
# 따라서 byrow=TRUE로 지정해도 효과는 같다.
# 행렬의 행과 열에 명칭을 부여하고 싶다면 dimnames()를 사용한다.

mydimnames <- list(c('kim', 'park'), c('kor', 'eng', 'math'))

mat_d <- matrix(myvector, nrow=2, byrow=T, dimnames = mydimnames )
mat_d