#install.packages("stringr")
library(stringr)

help("str_extract")

mystring <- 'hello1234world5678'
str_extract(mystring, '[0-9]{2}')
str_extract_all(mystring, '[0-9]{2}')

str_extract_all(mystring, '[0-9]{3,}')

# Error in stri_extract_all_regex(string, pattern, simplify = simplify,  : 
#       Error in {min,max} interval. (U_REGEX_BAD_INTERVAL)

mystring2 <- 'abc이순신cd1235이다도시world5678'
str_extract_all(mystring2, '[가-힣]{3,4}')

mystring3 <- 'abc123홍길동 def'
str_extract_all(mystring3, '\\w{4,}')

# 이메일
email = 'abcd@naver.com;def@daum.net'
regEx <- '\\w{4,}@\\w{3,}.\\w{2,}'
str_extract_all(email, regEx)

  
# 주민 번호
# 13자리를 만족해야하고, 하이폰은 옵션 사항이다.
# 뒷 7자리의 처음에는 1,2,3,4 중 하나가 올 수 있다.
juminno <- '700828-1234567 881225-345678 900815-9876543 7511112345678'
regEx <- '\\d{6}-?[1234]\\d{6}'
str_extract_all(juminno, regEx)


beverage <- c('cola', 'fanta', 'Cola', 'sevenup', 'orange')
beverage

# 대문자 C가 있는 항목 찾기
test01 <- str_detect( beverage, 'C') 
test01
beverage[test01] # boolean indexing

# 소문자 c로 시작하는 항목 찾기
str_detect( beverage, '^c')

# c 또는 C로 시작하는 항목 찾기 
str_detect( beverage, '^[cC]')

# 소문자 a로 끝나는 항목 찾기
str_detect( beverage, 'a$')

# 소문자 p나 e로 끝나는 항목 찾기
str_detect( beverage, '[pe]$')

# 문자 n을 포함하는 항목 찾기
str_detect( beverage, '[n]')

# 문자 r 또는 n을 포함하는 항목 찾기
str_detect( beverage, '[rn]')

# 각 요소들의 글자 수
mycount <- str_count(beverage)
mycount

# 각 요소마다 'a' 문자가 몇개 들어 있나?
mycount <- str_count(beverage, 'a')
mycount

dup01 <- str_dup( beverage, 2)
dup01

longchar <- str_dup('abcd', 1000)
longchar

# 공백만 트림해준다.
# side 옵션의 기본 값은 both이다.
# side = c("both", "left", "right")
string8 <- '  cola  fanta   '
trim01 <- str_trim(string8, side='left')
trim01