mytxt <- read.csv('factor_test.txt')

mytxt

# 혈액형을 Factor 형식으로 만들기
factor1 <- factor( mytxt$blood )

factor1

summary( factor1 )

# 성별을 Factor 형식으로 만들기
sex1 <- factor( mytxt$sex )

summary( sex1 )

mytxt$blood2 <- factor(mytxt$blood,
    levels=c('A', 'B', 'O', 'AB'),
    labels=c('에이형', '비형', '오형', '에이비형'))

mytxt

# level을 확인하려면 levels 함수를 사용하면 된다.
levels(mytxt$blood2)

# factor 함수를 이용하여 sex 컬럼에 대하여 '남'는 male, 
# '여'는 female라고 하는 파생 컬럼 sex2를 만들어 보세요.