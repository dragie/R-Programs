# Assign the training set
train <- read.csv(url("http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/train.csv"))

# Assign the testing set
test <- read.csv(url("http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/test.csv"))

# Make sure to have a look at your training and testing set
print(train)
print(test)

table(train$Sex)
prop.table(table(train$Sex))
female <- sort(train[train$Sex == 'female', ]$Sex)
male <- sort(train[train$Sex == 'male', ]$Sex
prop.table(table(female, male),1)


str(train)
