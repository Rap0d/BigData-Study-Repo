member01 <- read.table(file='member01.txt', header=FALSE)
member01

member02 <- read.table(file='member02.txt', sep='\t', header=TRUE)
member02

somedata <- ('-------------------------')

# help(sink)
sink('result.txt')
member01
somedata
member02
sink()