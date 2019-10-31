mat_a <- matrix(c(1, 2), nrow=1)
mat_a

mat_b <- matrix(c(-2, 3), nrow=2)
mat_b

mat_c <- matrix(c(3, 2, -1, 0), nrow=2, byrow=T)
mat_c

ab <- mat_a %*% mat_b
ab

ac <- mat_a %*% mat_c
ac

ba <- mat_b %*% mat_a
ba

cb <- mat_c %*% mat_b
cb
