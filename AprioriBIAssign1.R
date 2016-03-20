#install.packages('arules')
library(arules)
itemSet <- read.csv("D:\\Business Intellingence Software and Techniques\\Assignment\\Data1.csv")
itemSet$ID <- as.factor(itemSet$ID)
str(itemSet)
rules <- apriori(as.factor(itemSet))

transactions <- itemSet <- read.csv("D:\\Business Intellingence Software and Techniques\\Assignment\\Transactions.csv")

txn <- read.transactions(file="D:\\Business Intellingence Software and Techniques\\Assignment\\Transactions.csv",
                         rm.duplicates= FALSE, format="single",sep=",",cols =c(1,2));

# Run the apriori algorithm
basket_rules <- apriori(txn,parameter = list(sup = 0.4, conf = 0.7,target="rules"));

# Check the generated rules using inspect
inspect(basket_rules)
View(inspect(basket_rules))

#If huge number of rules are generated specific rules can read using index
inspect(basket_rules[1])
itemFrequencyPlot(txn)
inspect(txn)

