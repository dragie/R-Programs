download.file(url = "http://bit.ly/dasi_project_template", destfile = "dasi_project_template.Rmd")

year <- function(x) if(max(abs(present$boys - present$girls))) present$year

year(max(abs(present$boys - present$girls)))
dim(present)
plot(x = present$year, y = present$girls)

plot(x = present$year, y = present$girls, type = "l")

plot(present$year, present$boys + present$girls, type = 'l')

plot(present$year,present$boys / (present$boys + present$girls), type = 'l')

present$boys > present$girls

plot(present$year,present$boys / present$girls, type = 'l')

plot(present$year,abs(present$boys - present$girls), type = 'l')


source("http://www.openintro.org/stat/data/cdc.R")
names(cdc)
summary(cdc)
View(head(cdc))
4657/ 20000

table(cdc$smoke100)
barplot(table(cdc$smoke100))

smoke = table(cdc$smoke100)
barplot(smoke)
mosaicplot(table(cdc$smoke100, cdc$gender))

x = table(cdc$age<23, cdc$smoke100 == 1)
x
y = subset(cdc, cdc$age<23 & cdc$smoke100 == 1)
y

bmi = (cdc$weight / cdc$height^2) * 703
boxplot(bmi ~ cdc$genhlth)

hist(cdc$weight)
par(new = TRUE)
par(mfrow=c(2,2))
hist(cdc$wtdesire)
plot(cdc$weight, cdc$wtdesire)


#Lab 2:

load(url("http://www.openintro.org/stat/data/kobe.RData"))
head(kobe)
kobe_streak <- calc_streak(kobe$basket)
barplot(table(kobe_streak))
