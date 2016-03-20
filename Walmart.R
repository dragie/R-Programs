#install.packages('arules')
library(arules)


itemSet <- read.csv("D:\\Kaggle\\Walmart Recruiting Trip Type Classification\\train.csv")
str(itemSet)
itemSet <- itemSet[c(-3:-6)]
itemSet <- itemSet[-1]
summary(itemSet)


#itemSet$TripType <- as.factor(itemSet$TripType)
itemSet$VisitNumber <- as.factor(itemSet$VisitNumber)
itemSet$FinelineNumber <- as.factor(itemSet$FinelineNumber)
nrow(itemSet)
flag <- (itemSet[2] != 0)
itemSet <- itemSet[flag,]
itemSet <- na.omit(itemSet)
summary(itemSet)
str(itemSet)
min(as.numeric(itemSet$VisitNumber))
plot(as.numeric(itemSet$VisitNumber), as.numeric(itemSet$FinelineNumber))
hist(as.numeric(itemSet$VisitNumber))
trans <- as(itemSet, "transactions")
trans
summary(trans)
dim(itemSet)
dim(trans)
itemLabels(trans)
#d <- dissimilarity(sample(trans, 50000), method = "phi", which = "items")
#d[is.na(d)] <- 1 # get rid of missing values
basket_rules <- apriori(trans, parameter = list(target = "frequent",
                                supp=0.000001, minlen = 1, maxlen=4))
inspect(head(sort(basket_rules), n=10))
quality(basket_rules)$lift <- interestMeasure(basket_rules, method="lift", trans = trans)
inspect(head(sort(basket_rules, by = "lift"), n = 10))
#plot(head(sort(basket_rules, by = "lift"), n=50), control=list(cex=.8))

write(basket_rules, file = "sample_submission.csv")

testSet <- read.csv("D:\\Kaggle\\Walmart Recruiting Trip Type Classification\\test.csv")
str(testSet)
testSet <- testSet[,c(-2:-5)]
testSet$VisitNumber <- as.factor(testSet$VisitNumber)
testSet$FinelineNumber <- as.factor(testSet$FinelineNumber)
nrow(testSet)
flag <- (testSet[2] != 0)
testSet <- testSet[flag,]
testSet <- na.omit(testSet)
summary(testSet)
str(testSet)
min(as.numeric(testSet$VisitNumber))
#plot(as.numeric(testSet$VisitNumber), as.numeric(testSet$FinelineNumber))
hist(as.numeric(testSet$VisitNumber))
transTest <- as(testSet, "transactions")
transTest
summary(transTest)
dim(testSet)
dim(transTest)
itemLabels(transTest)
