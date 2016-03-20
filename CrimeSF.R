#libraries
library(caret)
library(rpart)

#reading data
train <- read.csv("D:\\Kaggle\\San Francisco Crime Classification\\train.csv\\train.csv")
test <-  read.csv("D:\\Kaggle\\San Francisco Crime Classification\\test.csv\\test.csv")
train <- read.csv("D:\\Kaggle\\San Francisco Crime Classification\\SampleData.csv")
train.temp <- createDataPartition(y = train$Category, p = 0.1, list = FALSE)
#train.sub <- train[train.temp,]
train.sub <- sample(train, size = 10000, replace = TRUE )
train$Descript <- NULL
train$Resolution <- NULL
remove(train)
remove(test)

train <- sample(train, size = 10000, replace = TRUE)
summary(train)

fit <- train(Category~., data = trainData, method = 'rpart')

fit <- rpart(Category ~ Dates + DayOfWeek + PdDistrict + Address + X + Y,
             method="class", data=train)

train <- scan(file = "D:\\Kaggle\\San Francisco Crime Classification\\train.csv\\train.csv", 
             what = list("Dates", "character", "character", "character", "character", "character", "character", 'numeric', 'numeric'),
            nlines = 1,  sep = ",", comment.char = '')
trainData <- scan(file = "D:\\Kaggle\\San Francisco Crime Classification\\train.csv\\train.csv", 
                        what = list("Dates", "character", "character", "character", "character", "character", "character", 'numeric', 'numeric'),
                        nlines = 1000, skip = 1,   sep = ",", comment.char = '')
test <- scan(file = "D:\\Kaggle\\San Francisco Crime Classification\\test.csv\\test.csv", 
             what = list("numeric", "Dates", "character", "character", "character", "numeric", "numeric"),
             sep = ",", skip = 1, comment.char = '')
testHead <- scan(file = "D:\\Kaggle\\San Francisco Crime Classification\\train.csv\\train.csv", 
              what = list("Dates", "character", "character", "character", "character", "character", "character", 'numeric', 'numeric'),
              nlines = 1,  sep = ",", comment.char = '')


trainData2 <- scan(file = "D:\\Kaggle\\San Francisco Crime Classification\\train.csv\\train.csv", 
                  what = list("Dates", "character", "character", "character", "character", "character", "character", 'numeric', 'numeric'),
                  nlines = 1000, skip = 1001,   sep = ",", comment.char = '')

#--max-pp-size=100000
trainData <- as.data.frame(setNames(trainData[seq_along((train))], train))
trainData1 <- as.data.frame(setNames(trainData2[seq_along((train))], train))
testfit <- as.data.frame(setNames(test[seq_along((testHead))], testHead))
fit <- train(Category~., data = trainData, method = 'rf')
train.caret <- predict(fit, newdata = test)
