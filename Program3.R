ls()
class(data)
typeof(data)
mean(c(1:10))
help(mean)
getwd()
#setwd("")
dir()
mean(rnorm(10))
help(trim)
x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))
matrix(1:10, ncol = 2)
(mylist <- list(c(1:10), c(10:20)))
table(c(1:10, rep(4, 3), rep('NA', 5), useNA = 'ifany'))

# data types -  numeric, interger, charcter, factor, date and time, logical(boolean)
head(data, 2)
ins <- data("InsectSprays")
head(ins, 4)
?InsectSprays
colnames(data)
data$Col1
table(data$Col1)
str(data)
summary(cars)
str(cars)
a <- c(1:3)
b <- c(3:5)
c <- c(5:7)
d <- list(a,b,c)
d[[1]][1]

#pply base functions
# apply() - over rows and columns
# lapply(0 - over a list)
# sapply
# tapply
data("iris")
iris
help(read.csv)
ind <- list(c(2,2,2), c('a','b','b'))
tapply(1:3, ind, sum)

line <- lm(dist ~ speed, data = cars)
plot(line)
