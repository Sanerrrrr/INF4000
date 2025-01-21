library(ggplot2)
library(dplyr)
library(cluster)

# 加载数据
data <- read.csv("C:\\Users\\niebo\\OneDrive\\Desktop\\euro_summary.csv")

# 数据清洗
if("result" %in% names(data)) {
  # 如果列存在，进行数据清洗
  clean_data <- data %>%
    filter(!is.na(result))  # 过滤掉result列中的NA值
  print("数据已成功清洗。")
} else {
  # 如果列不存在，输出错误信息
  stop("错误：数据中不存在名为 'result' 的列。请检查列名。")
}

# 查看清洗后的数据
head(clean_data)

# 聚类分析
set.seed(123) # 设置随机种子，确保结果可复现
k <- kmeans(clean_data[, c("matches", "goals")], centers = 3) # 设置k为3
clean_data$cluster <- k$cluster  # 添加聚类结果到数据框

# 打印聚类中心
print(k$centers)

# 使用ggplot2进行可视化，设置不同聚类的点形状
ggplot(clean_data, aes(x = result, y = goals, color = factor(cluster), shape = factor(cluster))) +
  geom_point(size = 4) +  # 调整点的大小
  labs(title = "Cluster analysis of team skills and tactics", x = "Score", y = "Goals") +
  theme_minimal() +
  scale_shape_manual(values = c(15, 17, 18))  # 设置不同聚类的形状（15为方形，17为三角形，18为菱形）
