# 텍스트 파일을 읽어 와서, 연산을 수행한 다음 csv 파일로 저장하기
jumsu <- read.table( file='jumsu.txt', sep=' ', header=FALSE )
# 헤더 컬럼이 없는 경우 V숫자 형식으로 보여준다.
jumsu

# 컬럼 헤더 이름 변경하기
colnames(jumsu) <- c('이름', '국어', '영어', '수학')
jumsu

# 파생 컬럼 만들기
jumsu$총점 <- jumsu$국어 + jumsu$영어 + jumsu$수학
jumsu

# 평균 컬럼을 추가하세요.(소수점 2자리 형식으로)
jumsu$평균 <- round(jumsu$총점 / 3, 2)
jumsu

# ifelse 함수를 이용하여 합격 여부 컬럼을 추가하세요.(합격 기준 >= 평균 60)
jumsu$'합격 여부' <- ifelse(jumsu$평균 >= 60, '합격', '불합격')

jumsu

# 행 이름을 작성 : 파이썬의 색인과 같은 개념
# help(rownames)
rownames(jumsu) <- c('kang', 'hong', 'soo', 'shin', 'lee')

jumsu

# row.names=F 옵션 : 행이름은 표시 안하겠다
# quote=F : 모든 데이터는 따옴표는 넣지 않겠다.
# quote=T : 문자열형 데이터는 따옴표를 붙이겠다.
write.csv(jumsu, 'result1.csv', row.names = T, quote = T)