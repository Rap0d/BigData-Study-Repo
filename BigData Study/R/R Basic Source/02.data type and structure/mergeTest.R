x1 <- data.frame( name=c("a", "b", "c"), math=c(1, 2, 3) )
 
y1 <- data.frame( name=c("c", "b", "a"), english=c(4, 5, 6) )

merge(x1, y1, by.x='name', by.y='name') 

merge(x1, y1)
# 양쪽의 공통된 컬럼을 이용하여 머지해준다.
#   name math english
# 1    a    1       6
# 2    b    2       5
# 3    c    3       4
 
x2 <- data.frame( name=c("a", "b", "c"), math=c(1, 2, 3) )
 
y2 <- data.frame( name=c("a", "b", "d"), english=c(4, 5, 6) )
 
# 기본 값(all=FALSE 인자) : 공통된 항목만 보여 준다.
merge(x2, y2)
#   name math english
# 1    a    1       4
# 2    b    2       5
 
# all=TRUE 인자 : 비어 있는 데이터는 NA가 추가된다.
merge(x2, y2, all=TRUE)
#   name math english
# 1    a    1       4
# 2    b    2       5
# 3    c    3      NA
# 4    d   NA       6