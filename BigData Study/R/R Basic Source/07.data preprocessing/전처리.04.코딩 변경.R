dataset = read.csv("mydata.csv", header=TRUE)   # 헤더가 있는 경우
newdata = subset(dataset, dataset$price >= 2 & dataset$price <= 8) 

str(newdata)
unique(newdata$resident)

# 가독성을 위한 코딩 변경하기
# dataset$새칼럼[조건식] = "값"
newdata$resident2[newdata$resident == 1] = '서울시'
newdata$resident2[newdata$resident == 2] = '인천시'
newdata$resident2[newdata$resident == 3] = '대전시'
newdata$resident2[newdata$resident == 4] = '대구시'
newdata$resident2[newdata$resident == 5] = '부산시'

head( newdata[c("resident","resident2")] ) # 2개행만 확인

unique(newdata$job)

newdata$job2[newdata$job == 1] = '공무원'
newdata$job2[newdata$job == 2] = '회사원'
newdata$job2[newdata$job == 3] = '개인사업'

head(newdata[c('job', 'job2')])
 
# 척도 변경을 위한 코딩 변경하기
sort(unique(newdata$age))

newdata$age2[newdata$age <= 30] ="청년층"
newdata$age2[newdata$age > 30 & newdata$age <=55] ="중년층"
newdata$age2[newdata$age > 55] ="장년층"

unique(newdata$age2)

head(newdata)
 
survey = newdata$survey # 만족도 변수 추출
maxval <- max(survey)
csurvey = maxval + 1 - survey # 역코딩

newdata$survey2 <- csurvey # survery 수정

head(newdata[c('survey', 'survey2')])

head(newdata) # survey 결과 확인