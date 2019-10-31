c1 <- c(1, 2)
c2 <- c(4, 1)
matrixA <- cbind(c1, c2)
matrixA

nrow(matrixA) # 행수

ncol(matrixA) # 열수

apply(matrixA, 1, sum) # 행단위로 합산

matrixAT = t(matrixA) # 전치 행렬
matrixAT

solveMat <- solve(matrixA) # 역행렬
solveMat

# 역행렬이 잘 만들어졌는지 확인
diagMat <- matrixA %*% solveMat
diagMat

# 3*3의 단위 행렬 생성하기
diag(3) 