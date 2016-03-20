#input files path
input <- "C:\\Users\\vijay\\Documents\\Kaggle\\Coupon Purchase System\\input\\"

#input files
user_list <- read.csv(paste(input, "user_list.csv", sep = ""), sep = ",",  header = TRUE)
coupon_area_test <- read.csv(paste(input, "coupon_area_test.csv", sep = ""), sep = ",",  header = TRUE)
coupon_area_train <- read.csv(paste(input, "coupon_area_train.csv", sep = ""), sep = ",",  header = TRUE)
coupon_detail_train <- read.csv(paste(input, "coupon_detail_train.csv", sep = ""), sep = ",",  header = TRUE)
coupon_list_test <- read.csv(paste(input, "coupon_list_test.csv", sep = ""), sep = ",",  header = TRUE)
coupon_list_train <- read.csv(paste(input, "coupon_list_train.csv", sep = ""), sep = ",",  header = TRUE)
coupon_visit_train <- read.csv(paste(input, "coupon_visit_train.csv", sep = ""), sep = ",",  header = TRUE)

#preparing training data set
tolower(colnames(coupon_area_train))
coupon_visit_train <- sample(coupon_visit_train, nrow(coupon_visit_train) * .5, replace = TRUE, prob = NULL)
tempCouponTrainDataset <- merge(coupon_area_train, coupon_list_train, by = c('COUPON_ID_hash') )
tempPurchaseTrainDataset <- merge(coupon_detail_train, coupon_visit_train, by = 'USER_ID_hash')
tempOtherDataSet <- merge(tempCouponTrainDataset, tempPurchaseTrainDataset, by = 'USER_ID_hash')
tempUserCouponTrainDataset <- merge(tempOtherDataSet, user_list, by = 'USER_ID_hash')
training_set <- c()