data <- c(20, 10, 30, 50, 40)
data

# base 패키지
sort( data ) # 오름차순

sort( data, decreasing = TRUE ) # 내림차순

help( sort )

# sort() 함수는 원본 데이터를 변형하지 않는다.
data

# help( order )
# order() 함수 : 가장 값이 작은 데이터의 인덱스부터  출력해준다.
ordering <- order(data)

ordering # 2 1 3 5 4

data[ordering] # 10 20 30 40 50

reverse_order <- order(data, decreasing = TRUE)

reverse_order

data[reverse_order]