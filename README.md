# Market Basket Analysis Using R
This repository contains a Market Basket Analysis project using R and transaction data from a bakery retail store. The project identifies customer buying patterns, frequently purchased products, and product combinations using Association Rule Mining.

## Project Objective
To analyze transaction data and discover:
- Frequently purchased items
- Products bought together
- Cross-selling opportunities
- Product placement strategies
- Customer purchase behavior

## Dataset Used
BreadBasket_DMS.csv
Contains:
- Transaction ID
- Purchased Items

## Tools Used
- R
- RStudio
- Excel / CSV
- arules Package
- arulesViz Package
- dplyr
- tidyr

## Techniques Used

### Data Cleaning
- Removed missing / invalid item values (`NONE`)
- Converted item column into categorical format

### Exploratory Analysis
- Summary of dataset
- Item frequency counts
- Top 10 most popular products

### Visualization
- Bar Plot of Top Items
- Association Rule Graph
- Parallel Coordinate Plot

### Association Rule Mining
Used **Apriori Algorithm** with:
- Minimum Support = 0.01
- Minimum Confidence = 0.50
Generated rules showing:
- Support
- Confidence
- Lift
- Coverage
- Count

## Key Business Insights
- Coffee is one of the most frequently purchased items.
- Customers buying Spanish Brunch are likely to also buy Coffee.
- Certain product combinations create strong upselling opportunities.
- Bundling and strategic placement can increase sales.

## Business Recommendations

### Product Placement
Place related products together (e.g., Coffee near Spanish Brunch).

### Cross Selling
Suggest complementary items during purchase.

### Upselling
Promote premium versions or combos.

### Customer Segmentation
Target customers who frequently buy certain combinations.

### Inventory Planning
Stock linked products together during peak demand periods.

## Files Included
- Project_Market Basket Analysis.R
- BreadBasket_DMS.csv

## Skills Demonstrated
- Retail Analytics
- Association Rule Mining
- Customer Behavior Analysis
- Business Strategy
- Data Visualization
- R Programming

## Packages Used
- arules
- arulesViz
- dplyr
- tidyr

## Author
Dipayan Saha
MBA in Business Analytics
