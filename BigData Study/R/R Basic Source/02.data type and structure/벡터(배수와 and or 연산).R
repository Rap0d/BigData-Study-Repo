data <- seq(from=1, to=100, by=1)
data 

data2 <- data[ data %% 3 == 0 | data %% 5 == 0  ]
data2

data3 <- data[ data %% 2 == 0 & data %% 3 == 0  ]
data3

data2_mean = mean( data2 )
data2_mean

data3_sum = sum( data3 )
data3_sum

result <- c(data2_mean, data3_sum)
result
