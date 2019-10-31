# 데이터 프레임 만들기
korean = c(50, 60, 70, 80, 90)
english = c(10, 20, 30, 40, 50)
name <- c('김유신', '강감찬', '이순신', '신사임당', '홍길동' )
df <- data.frame(name=name, korean=korean, english=english)

mode(df)
class(df)

# 자료 구조, 행열수, 컬럼명 보기
str(df) # Structure

ncol(df) # 몇 열인가
nrow(df) # 몇 행인가
names(df) # 컬럼 이름
df[c(2:3),] # 2행부터 3열까지, 모든 열을 가져오기

# 요약 통계량 보기
summary( df )

apply(df[,c(2, 3)], 2, sum)

korean1 <- subset(df, korean >= 60)
korean1

english1 <- subset(df, english <= 30)
english1

andtest <- subset(df, korean >= 70 & english <= 40)
andtest

ortest <- subset(df, korean <= 50 | english >= 40)
ortest

# 1열과 3열만 추출
condition1 <- subset(df, korean >= 70, c(1, 3))
condition1

condition2 <- subset(df, korean >= 70, c('name', 'english'))
condition2

# student 데이터 프레임 만들기
sid = c('a', 'b', 'c', 'd')
score = c(90, 80, 70, 60)
subject = c('컴퓨터', '국어국문', '소프트웨어', '유아교육')

# 데이터 프레임 생성
sid = c('a', 'b', 'c', 'd')
score = c(90, 80, 70, 60)
subject = c('컴퓨터', '전자 공학', '수학', '심리학')

student <- data.frame(sid, score, subject)
student 

mode(student)
class(student)

str(sid) ; str(score) ; str(subject) 
summary( student )

# 키(신장) dataframe
height <- data.frame(name=c('김유신', '이순신', '강감찬'), height=c(180, 165, 175))

height 

# 몸무게 dataframe
weight <- data.frame(name=c('김유신', '이순신'), weight=c(80, 75))

weight


result <- merge(height, weight, by.x='name', by.y='name')
result

result <- merge(height, weight, all=T)
result

help(merge)
