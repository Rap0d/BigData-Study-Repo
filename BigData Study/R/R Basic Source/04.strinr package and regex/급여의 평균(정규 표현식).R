다음 제시하는 벡터 somedata는 '입사년도이름급여'순으로 사원의 정보가 기록된 데이터이다. 
이 벡터 데이터를 이용하여 다음과 같은 출력 결과가 나타나도록 함수를 정의하시오.

somedata <- c("2002홍길동220", "1970이순신300", "1980유관순260")

<출력 결과>
전체 급여 평균 : 260
평균 이상 급여 수령자

이순신 => 300
유관순 => 260

힌트) 사용 함수
stringr 패키지 : str_extract(), str_replace() 함수
숫자 변환 함수 : as.numeric() 함수

library(stringr) 

member_func <- function(x) {
  salary <- numeric() # 급여 저장 vector
  name <- character() # 이름 저장 vector
  idx <- 1 # index 변수
  for(n in x){ # EMP vector 원소 처리
    name[idx] <- str_extract(n, '[가-히]{3}') # 이름 추출/ 저장
    spay <- str_extract(n, '[가-히]{3}[0-9]{3}') # 이름+숫자 추출
    spay <- str_replace(spay, '[가-히]{3}', '') # 이름 제거
    npay <- as.numeric(spay) # 숫자형 변환
    salary[idx] <- npay # 급여 저장
    idx <- idx + 1 # index 카운터
  }
  avg <- mean(salary)
  cat('전체 급여 평균 :', avg, '\n')
  cat('평균 이상 급여 수령자\n')
  
  # 평균 급여 이상자 출력
  n <- 1: length(x)
  for(idx in n){
    if(salary[idx] >= avg){ # 평균 비교
      cat(name[idx], '=>', salary[idx],'\n')
    }
  }
}
somedata <- c("2002홍길동220", "1970이순신300", "1980유관순260")

member_func(somedata)