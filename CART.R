library(rattle)
library(ggplot2)
library(rpart)
library(caret)

data("iris")
summary(iris)
qplot(Petal.Length, Petal.Width, colour = Species, data = iris)
train.flag <- createDataPartition(y= iris$Species, p =0.5, list = FALSE)
train <- iris[train.flag,]
test <- iris[-train.flag,]
fit <- train(Species~., method = "rpart", data = train)
fancyRpartPlot(fit$finalModel)
train.caret <- predict(fit, newdata = train)
table(train.caret, train$Species)
pred.caret <- predict(fit, newdata = test)
table(pred.caret, test$Species)
correct <- pred.caret == test$Species
qplot(Petal.Length, Petal.Width, colour = correct, data = test)
