data <- c(20, 25, 30, 15, 60)

length(data)

evenodd <- function( x ){
  odd <- 0 ; even <- 0
  cnt <- c(1:length( x ))
  for(idx in cnt){
    if (x[idx] %% 2 == 0){
      even <- even + 1  
    }else{
      odd <- odd + 1
    }
  }
  return (c(odd, even))
}
result <- evenodd( data )
cat('홀수 갯수 :', result[1])
cat('짝수 갯수 :', result[2])

