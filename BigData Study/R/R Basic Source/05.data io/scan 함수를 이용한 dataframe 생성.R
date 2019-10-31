# 풀어 봅시다
# scan() 함수를 사용하여 다음과 같은 데이터 프레임을 만드세요
# 이름 국어
# 이순신 50
# 김유신 80

print('이름을 입력하세요.')
name <- scan(what=character())
name

print('국어 점수를 입력하세요.')
kor <- scan( )
kor

df1 <- data.frame(name, kor)
colnames(df1) <- c('이름', '국어')
df1

df2 <- data.frame(이름=name, 국어=kor)
df2