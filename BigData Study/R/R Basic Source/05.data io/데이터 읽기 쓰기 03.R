텍스트 파일 읽기
read.table() 함수를 이용하여 테이블 형태로 저장되어 있는 텍스트 파일을 읽어 들인다.
header=T 옵션은 파일 내부에 행 머리글이 있다는 것을 알려 주는 옵션이다.
파일 이름 : 데이터 읽기 쓰기 03.R

setwd('E:\\00.R Programming\\01.강의용 자료\\RSource05')
 
vegetable <- read.table('vegetable.txt', header=T)
vegetable
#   no   name price qty
# 1  1   감자   300   5
# 2  2 고구마  1100   2
# 3  3   오이  1100   7
# 4  4   가지   100   9


주석이 있는 경우
read.table() 함수를 이용하여 데이터를 읽어 들일 때 주석으로 자동으로 제외된다.
skip 옵션은 몇 칸을 건너 띄고자 하는 경우에 사용된다.
이 경우 주석도 skip 옵션에 포함이 되므로 유의하도록 한다.
nrows 옵션을 사용하면 출력할 행 수를 지정할 수 있다.

vegetable2 <- read.table('vegetable2.txt')
vegetable2
#   V1     V2   V3 V4
# 1  1   감자  300  6
# 2  2 고구마 1100  2
# 3  3   오이 1100  7
# 4  4   가지  100  9
 
vegetable2 <- read.table('vegetable2.txt', skip=2)
vegetable2
#   V1     V2   V3 V4
# 1  2 고구마 1100  2
# 2  3   오이 1100  7
# 3  4   가지  100  9
 
vegetable2 <- read.table('vegetable2.txt', nrows=2)
vegetable2
#   V1     V2   V3 V4
# 1  1   감자  300  6
# 2  2 고구마 1100  2


