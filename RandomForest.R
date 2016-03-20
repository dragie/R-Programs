library(rattle)
library(ggplot2)
library(rpart)
library(caret)
library(randomForest)
library(randomForestSRC)

data(iris)
summary(iris)
qplot(Petal.Length, Petal.Width, data = iris, colour = Species)
train.flag <- createDataPartition(y = iris$Species, p = 0.5, list = FALSE)
train <- iris[train.flag,]
test <- iris[-train.flag,]
fit <- train(Species~., data = train, method = 'rpart')
fancyRpartPlot(fit$finalModel)
train.caret <- predict(fit, newdata = train)
table(train.caret, train$Species)

test.caret <- predict(fit, newdata = test)
table(test.caret, test$Species)

modfit <- train(Species~., method = "rf", data = train)
pred <- predict(modfit, newdata = train)
table(pred, train$Species)
predtest <- predict(modfit, newdata = test)
table(predtest, test$Species)
