abcCsv <- read.csv('abc.csv', header=T)
abcCsv
dim(abcCsv) # dimension
nrow(abcCsv) # 몇행인가요?
ncol(abcCsv) # 몇열인가요?

# 샘플링 방법
# nrow 함수는 전체 행의 갯수를 구해주는 함수이다.
# 1행 ~전체 행수에서 임의의 4개의 데이터를 무작위로 추출한다.
choice1 <- sample(1:nrow(abcCsv), 4)
choice1
# [1] 4 5 6 1

abcCsv[choice1,]
#   gender job age position address total check price survey
# 4      1   3  40        4   busan    70     3  1200      5
# 5      2   3  50        5   seoul    50     3  1400      6
# 6      2   2  60        7   daegu    40     3  3000      1
# 1      1   1  10        2   seoul    50     5  1200      3

# 3행 ~전체 행수에서 임의의 2개의 데이터를 무작위로 추출한다.
choice2 <- sample(3:nrow(abcCsv), 2)
choice2
# [1] 5 4

# 2행 ~ 6행 중에서 임의의 2개의 데이터를 무작위로 추출한다.
choice3 <- sample(c(2:6), 2)
choice3
# [1] 3 6

choice3 <- sample(c(2:6), 2)
choice3
# [1] 5 3

choice3 <- sample(c(2:6), 2)
choice3
# [1] 5 4

choice3 <- sample(c(2:6), 2)
choice3
# [1] 2 6