#加载需要的库
library(ggplot2)
library(dplyr)
library(tidyr)

#加载数据集
qualifying <- read.csv("C:/Users/niebo/OneDrive/Desktop/qualifying_1960-2024.csv", header = TRUE)

# 1. 观众人数（match_attendance）
p1 <- ggplot(qualifying, aes(x = as.factor(year), y = match_attendance, fill = as.factor(year))) +
  geom_violin(trim = FALSE) + 
  geom_boxplot(width = 0.2) +
  theme_minimal() + 
  labs(title = "Audience distribution", y = "Number of audience", x = "Years") +
  theme(legend.position = "none")

# 2. 比赛结果 - 主场得分（home_score）
p2 <- ggplot(qualifying, aes(x = as.factor(year), y = home_score, fill = "Home")) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.2) +
  theme_minimal() +
  labs(title = "Home score distribution", y = "Score", x = "Years") +
  theme(legend.position = "none")

# 3. 比赛结果 - 客场得分（away_score）
p3 <- ggplot(qualifying, aes(x = as.factor(year), y = away_score, fill = "Away")) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.2) +
  theme_minimal() +
  labs(title = "Away points distribution", y = "Score", x = "Years") +
  theme(legend.position = "none")

# 4. 比赛类型（type）
p4 <- ggplot(qualifying, aes(x = type, y = home_score, fill = type)) +
  geom_violin(trim = FALSE) + 
  geom_boxplot(width = 0.2) +
  theme_minimal() + 
  labs(title = "Distribution of game types", y = "Home score", x = "Game type") +
  theme(legend.position = "none")

# 输出四个图表
print(p1)
print(p2)
print(p3)
print(p4)