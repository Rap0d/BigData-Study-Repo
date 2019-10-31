# install.packages( 'reshape' )
library( reshape )

result <- read.csv('mysample.csv', header=F)
result
#       V1   V2 V3
# 1 김철수 국어 40
# 2 김철수 영어 50
# 3 박영희 국어 60
# 4 박영희 영어 70

# rename 함수 이름 컬럼 명 변경
result <- rename(result, c(V1='name', V2='subject', V3='jumsu'))

# 긴 형식 보기
head(result)
#     name subject jumsu
# 1 김철수    국어    40
# 2 김철수    영어    50
# 3 박영희    국어    60
# 4 박영희    영어    70

# 가로로 긴 형식을 세로로 넓은 형식으로 변경하기
wide <- reshape(result, idvar='name', timevar='subject',
			v.names='jumsu', direction='wide')

# 열 이름이 jumsu.subject
wide
#     name jumsu.국어 jumsu.영어
# 1 김철수         40         50
# 3 박영희         60         70

# 행변수와 열변수의 값이 조합이 되어 '넓은 형식'을 '긴 형식'로 지원한다.
reshape(wide, direction='long')
#               name subject jumsu
# 김철수.국어 김철수    국어    40
# 박영희.국어 박영희    국어    60
# 김철수.영어 김철수    영어    50
# 박영희.영어 박영희    영어    70

wide
#    name jumsu.국어 jumsu.영어
#  1 김철수         40         50
#  3 박영희         60         70


# varying 속성으로 색인 지정
# 컬럼 순서 번호 조합에 의해 '긴 형식'으로 변경한다.
# 2:3 --> 시작열번호:끝열번호
long <- reshape(wide, idvar='name', varying= 2:3, v.names='jumsu', direction='long')
long
#            name time jumsu
# 김철수.1 김철수    1    40
# 박영희.1 박영희    1    60
# 김철수.2 김철수    2    50
# 박영희.2 박영희    2    70

long <- reshape(wide, idvar='name', varying= 3:3, v.names='jumsu', direction='long')
long
#           name jumsu.국어 time jumsu
# 김철수.1 김철수         40    1    50
# 박영희.1 박영희         60    1    70