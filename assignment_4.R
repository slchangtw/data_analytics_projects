
origin <- read.csv("data/house_prices_train.csv", stringsAsFactors = FALSE)
house_price <- origin[, c("LotFrontage", "LotArea", "OverallQual", "YearBuilt", 
                          "GarageArea", "SalePrice")]
