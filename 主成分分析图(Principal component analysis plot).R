#载入需要的库
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggfortify)

#读取数据集
lineups <- read.csv("C:/Users/niebo/OneDrive/Desktop/euro_lineups.csv", header = TRUE)

#检查缺失值的数量
sum(is.na(lineups$height))
sum(is.na(lineups$weight))

#进行数据清洗
lineups_clean <- lineups %>%
  select(height, weight) %>%
  na.omit() #删除有缺失值的行

#将数据标准化
lineups_pca_data_scaled <- scale(lineups_clean)

#进行主成分分析
pca_result <- prcomp(lineups_pca_data_scaled, center = TRUE, scale. = TRUE)

#查看主成分分析结果
summary(pca_result)

#可视化主成分分析结果
autoplot(pca_result, data = lineups_clean, colour = 'weight') +
  labs(title = "Principal component analysis results: height and weight",
       x = "Principal component 1",
       y = "Principal component 2") +
  theme_minimal()

#输出各个主成分的解释方差比例
pca_result_summary <- summary(pca_result)
pca_result_summary$importance[2,] #查看各个主成分的方差比