data <- read.csv("D:\\Business Intellingence Software and Techniques\\Class Exercises\\kmeans.csv")
kmeans(data[,-1], 2)

View(data)

data <- read.csv("D:\\Business Intellingence Software and Techniques\\Assignment\\Assignment2\\Data.csv")

data <- dist(data, method = "euclidean")
hc <- hclust(data, method = "single", )                
plot(hc)

data <- dist(as.matrix(data))

data <- read.csv("D:\\Business Intellingence Software and Techniques\\Class Exercises\\kmeans2.csv")
kmeans(data[,-1], 2)
library(rpart)
rpart()

n <- 10
x <- runif(n, 0, 100)
args(read.csv)
example(read.csv)
args(sd)
x <- c(0:10, 50)
mean(x, trim = 0.1)
??mean
help.search(rpart)
help(package = 'rpart')
vignette(package = 'rpart')
RSiteSearch('mean')
cat(x,'a','b')
args(cat)
x <- 4
x = 4
4 -> x
f <- function(n,x) n^x
f(2,3)
v <- rnorm(100)
v[v > median(v)]
v[(v < quantile(v, 0.05)) | (v > quantile(v, 0.95))]
v[abs(v-mean(v)) > 2*sd(v)]
v[ !is.na(v) & !is.null(v)]
4%in%5
4/5
lapply(v, f)
f <- function(x){
  return (x*x)
}
search()
detach()
Sys.getenv()
help("Startup")
scores <- data.frame()
scores <- edit(score)
rm(scores)
rm(score)
args(data.frame)
points <- data.frame( label=c("Low", "Mid", "High"), lbound=c( 0, 0.67, 1.64),
   ubound=c(0.674, 1.64, 2.33))
print(pi, digits = 4)
cat(format(pi, digits = 4), '\n')
q <- seq(0,10,0.555)
tbl <- data.frame(q, pnorm(-q), pnorm(q))
?pnorm
cat(tbl, file = 'test.csv')
sink("test.txt")
sink()
#to store all the outputs from a script
sink("script_output.txt") # Redirect output to file
source("script.R") # Run the script, capturing its output
sink()
list.files()
args(read.csv)
?read.csv
args(read.csv2)
read.csv
read.csv2
readLines("test.txt")
scan("test.txt", what = character(0))
world.series <- scan("http://lib.stat.cmu.edu/datasets/wseries",
                     skip = 35,
                     nlines = 23,
                     what = list(year = integer(0),
                                 pattern = character(0))
)
perm <- order(world.series$year)
world.series <- list(year = world.series$year[perm],
                      pattern = world.series$pattern[perm])

fresh <- abs(rnorm(5, 0, 1))
args(rnorm)
sop <- abs(rnorm(5, 0, 1))
sen <- abs(rnorm(5, 0, 1))
com <- stack(list(f = fresh, s = sop, se = sen))
aov(values ~ ind, data = com)

mat <- matrix(c(1.1, 1.2, 1.3,
                 2.1, 2.2, 2.3),
               2, 3)
?do.call
?Map
temp <- edit(data)
fix(data)
