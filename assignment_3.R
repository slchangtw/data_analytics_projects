library(ggplot2)
library(corrplot)

origin <- read.csv("data/house_prices_train.csv", stringsAsFactors = FALSE)
house_price <- origin[, c("MSZoning", "LotFrontage", "LotArea", "Alley",
                                 "OverallQual", "YearBuilt", "RoofStyle", "Exterior1st",
                                 "ExterCond", "CentralAir", "HalfBath")]

ggplot(aes(x = MSZoning), data = house_price) + 
    geom_bar(fill = 'red') + 
    theme_bw()

ggplot(aes(x = LotFrontage), data = house_price) + 
    geom_histogram(bins = 80, fill = 'red') + 
    theme_bw()

ggplot(aes(x = LotArea), data = house_price) + 
    geom_histogram(bins = 80, , fill = 'red') + 
    theme_bw()

ggplot(aes(x = as.factor(OverallQual)), data = house_price) + 
    geom_bar(fill = 'red') + 
    theme_bw() + 
    labs(x = "OverallQual", y = 'count')

ggplot(aes(x = as.factor(OverallQual)), data = house_price) + 
    geom_bar(bins = 80, , fill = 'red') + 
    theme_bw() + 
    labs(x = "OverallQual", y = 'count')

ggplot(aes(x = Alley), data = house_price) + 
    geom_bar(fill = 'red') + 
    theme_bw()

ggplot(aes(x = YearBuilt), data = house_price) +
    geom_line(stat = 'density', color = 'red') + 
    theme_bw()
    

ggplot(aes(x = RoofStyle), data = house_price) +
    geom_bar(fill = 'red') + 
    theme_bw()

ggplot(aes(x = Exterior1st), data = house_price) +
    geom_bar(fill = 'red') + 
    theme_bw()  

ggplot(aes(x = ExterCond), data = house_price) +
    geom_bar(fill = 'red') + 
    theme_bw()  

ggplot(aes(x = CentralAir), data = house_price) + 
    geom_bar(fill = 'red') + 
    theme_bw()

ggplot(aes(x = HalfBath), data = house_price) + 
    geom_bar(fill = 'red') + 
    theme_bw()

ggplot(aes(x = MSZoning, y = LotArea), data = house_price) + 
    geom_boxplot() + 
    coord_flip() +
    theme_bw()

ggplot(aes(x = MSZoning, y = LotFrontage), data = house_price) + 
    geom_boxplot() + 
    coord_flip() +
    theme_bw()

ggplot(aes(x = YearBuilt), data = house_price) + 
    geom_bar(fill = 'red') + 
    facet_grid(OverallQual ~ .) +
    theme_bw()

house_price_num <- subset(house_price, select = -c(MSZoning, Alley, RoofStyle, 
                                                   Exterior1st, CentralAir))

house_price_num$ExterCond <- ifelse(house_price_num$ExterCond == 'Ex', 5, 
                                ifelse(house_price_num$ExterCond == 'Gd', 4,
                                    ifelse(house_price_num$ExterCond == 'TA', 3,
                                        ifelse(house_price_num$ExterCond == 'Fa', 2, 1))))

correlations <- cor(na.omit(house_price_num))

corrplot(correlations, method="number", tl.cex = 0.8, type="lower")
corrplot.mixed(correlations)
