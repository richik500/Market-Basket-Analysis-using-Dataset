#Dipayan Saha   Roll:71   Sec:2
# Objective: To analyze transaction data and discover:
#Frequently purchased items; Products bought together; Cross-selling opportunities; Product placement strategies; Customer purchase behavior

# Install necessary packages if not installed
install.packages(c("arules", "arulesViz", "dplyr", "tidyr"))

# Load required libraries
library(arules)
library(arulesViz)
library(dplyr)
library(tidyr)
attach(Bread_Basket)
# Load and check the dataset (assuming BreadBasket_DMS is already loaded)
data <- as.data.frame(BreadBasket_DMS)  # Convert data to a dataframe
summary(data)  # Get a summary of the data
head(data)     # View the first few rows
Item=as.factor(Item)

# Clean the 'Item' column: Replace "NONE" with NA and remove rows with NA
data$Item[data$Item == "NONE"] <- NA
data <- na.omit(data)  # Remove rows with any NA values

# Step 1: Get item counts
item_counts <- table(data$Item)  # Count occurrences of each item

# Step 2: Get the top 10 most frequent items
top_items <- sort(item_counts, decreasing = TRUE)[1:10]  # Sort and pick top 10

# Step 3: Plot the top 10 most frequent items (Base R plot)
barplot(top_items, 
        las = 2,  # Rotate item names for better readability
        col = "lightblue", 
        main = "Top 10 Most Popular Items", 
        xlab = "Items", 
        ylab = "Frequency",
        ylim = c(0,7000))

# Step 4: Prepare data for transaction format (without pipe operator)
transactions <- aggregate(Item ~ Transaction, data, FUN = list)  # Group items by transaction

# Step 5: Convert to transaction format
trans <- as(transactions$Item, "transactions")  # Create transactions object

# Step 6: View the first few transactions
inspect(trans[1:10])

# Step 7: Generate association rules (min support = 0.01, min confidence = 0.5)
rules <- apriori(trans, parameter = list(supp = 0.01, conf = 0.5))

# Step 8: Inspect top 5 rules
inspect(rules[1:5])
#1. lhs (Left-Hand Side):
#This represents the antecedent or the items on the left-hand side of 
#the association rule.
#In the example, {Spanish Brunch} is the item on the left side, indicating 
#that the rule is about the purchase of Spanish Brunch.
#2. rhs (Right-Hand Side):
#This represents the consequent or the items on the right-hand side of 
#the association rule.
#In the example, {Coffee} is the item on the right side, meaning that the
#rule is about predicting that Coffee will be bought when Spanish Brunch is bought.
#3. Support
#In this case, the support is 0.01088, meaning that 1.088% of all transactions
#in the dataset contain both Spanish Brunch and Coffee together.
#4.Confidence
#For the rule {Spanish Brunch} => {Coffee}, the confidence is 0.5988, meaning that
#if someone buys Spanish Brunch, there is a 59.88% chance that they will also buy 
#Coffee.
#5.Coverage 
# This tells us how frequently the item on the left-hand side (in this case,
# Spanish Brunch) appears in the dataset.
#In this case, the coverage is 0.01817, which means that 1.82% of all transactions 
#contain Spanish Brunch, regardless of whether Coffee is purchased.
#6. Lift
#A lift value greater than 1 indicates that the lhs and rhs are positively correlated, meaning that the items are more likely to be bought together than if they were purchased independently.
#In this case, a lift of 1.2517 means that Spanish Brunch and Coffee are bought 
#together 25% more often than we would expect if the two items were independent
#(i.e., there is a moderate positive association between them).
#7.Count
#In this case, the rule {Spanish Brunch} => {Coffee} occurred 103 times in the dataset.


# Step 9: Plot rules using a graph (Base R plot, no advanced graph plotting here)
plot(rules, method = "graph", control = list(type = "items"))

plot(rules, method = "paracoord", 
     control = list(main = "Parallel Coordinate Plot"))


#Product Placement:Final Decision:  
#Place Coffee near Spanish Brunch or in the same section. 
#This encourages customers to purchase both products together, leveraging 
#the positive association. It creates a more seamless shopping experience 
#for customers who are likely to buy both items together.

#Cross-Selling: Final Decision:
#Cross-sell Coffee to customers buying 
#Spanish Brunch. For example, when a customer selects Spanish Brunch,
#you could highlight or suggest Coffee as a complementary item 
#(perhaps through promotional displays or pop-up suggestions).

#Upselling: Final Decision: 
#If a customer buys regular Coffee with Spanish Brunch, you can upsell 
#by suggesting a premium coffee or special Coffee accessories. 
#Use product bundles or promotional pricing to increase average
#transaction value.

#Customer Segmentation: Final Decision:
#Create a targeted segment of customers who are interested in brunch
#and coffee. Design specific promotions or offers that appeal to this 
#group, such as special brunch and coffee combos or loyalty points for 
#buying both.

#Inventory Management: Final Decision:  
#Monitor the sales patterns of both products and ensure that Coffee
#is well-stocked when there’s a higher demand for Spanish Brunch 
#(like during weekends or brunch hours). Additionally, consider bundling 
#both products together in your inventory to optimize stock levels for 
#cross-promotion.


#Summary of Decisions: 
#1. Product Placement: Position Coffee near Spanish Brunch.
#2. Cross-Selling: Suggest Coffee to customers buying Spanish Brunch.
#3. Upselling: Offer premium or specialty Coffee products.
#4. Customer Segmentation: Identify customers who buy both Spanish Brunch and Coffee, and target them with specific promotions.
#5. Inventory Management: Ensure Coffee availability aligns with Spanish Brunch sales and trends.


