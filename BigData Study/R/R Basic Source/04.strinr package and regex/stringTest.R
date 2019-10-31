# 문자열 추출하기 예시
#install.packages( 'stringr' )
library( stringr )

str <- '홍길동15강감찬25을지문덕35'

# 숫자 2개가 연속으로 시작되는 첫 번째 항목
# extract : extraction(추출)
test01 <- str_extract(str, '[0-9]{2}')
mode(test01)
class(test01)
test01

test02 <- str_extract_all(str, '[0-9]{2}')
mode(test02)
class(test02)
unlist(test02)

# 문자열의 길이와 위치
string <- 'hong1234김유신5678'
string

length(string)

len <- str_length(string)
len

string2 <- c('hello', 'math')
len2 <- str_length(string2)
len2 # [1] 5 4


string <- 'hong1234김유신5678'
findword <- '김유신'
loc <- str_locate(string, findword)
loc

# 부분 문자열 만들기
string_sub <- str_sub(string, 1, 9-1)
string_sub

# '김유신'이라는 글자 추출해보기
kim <- str_sub(string, loc[1], loc[2])
kim

# 대소문자 변경
string3 <- 'hong1234'

upper <- str_to_upper( string3 )
upper

lower <- str_to_lower( string3 )
lower

# 문자열 교체, 결합, 분리
string3 <- 'hong1234'
string_rep <- str_replace(string3, 'hong', 'kang')
string_rep

# 1234를 5678로 변경해보세요.
string_rep2 <- str_replace(string3, '1234', '5678')
string_rep2

string4 <- 'hong1234hong5678'
replace3 <- str_replace(string4, 'hong', 'kim')
replace3

replace4 <- str_replace_all(string4, 'hong', 'kim')
replace4

# 문자열 결합하기
# str_c : string concatenation
string5 <- 'aaa123'
string6 <- 'bbb456'
concat1 <- str_c(string5, string6)
concat1

# 문자열 잘라내기(콤마를 기준으로 분리)
string7 <- 'aaa,bbb,ccc'
split1 <- str_split(string7, ',')
split1 # list 타입
vec <- unlist(split1)
vec

# 문자열 합치기
members <- c('홍길동10', '김유신20', '이순신30')
members

# 콤마를 이용하여 문자열 벡터 합치기
# collapse : 문자열 결합시 구분자
string_join <- paste(members, collapse = ',')
string_join