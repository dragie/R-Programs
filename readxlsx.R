Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_60\\")
library(rJava)

library(gdata)
library(XLConnectJars)
library(XLConnect)
library(ggplot2)
library(caret)

data <- loadWorkbook("D:\\Business Intellingence Software and Techniques\\Data Sets\\BI Project Sample Data\\2014\\SD(2014-01).xls")
data.nissan <- readWorksheet(data, sheet = "NISSAN", header = TRUE)
nrow(data.nissan)
data.train <- createDataPartition(y = data.nissan$, p =0.5, list = FALSE)


data.nissan <- data.nissan[-103,]
data.nissan[is.na(data.nissan)] <- 0
summary(data.nissan)
qplot(Sunny, Terrano, Micra, Evalia, Teana,   data = data.nissan, geom=c("boxplot") )
qplot(QTY.,SBVH_DESC,  colour = TERY, data = data.nissan )

boxplot(paste(Sunny, Terrano, Micra, Evalia, Teana), data = data.nissan)

