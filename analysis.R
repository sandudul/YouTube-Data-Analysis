# Load necessary libraries
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")

library(ggplot2)
library(dplyr)

# Load the dataset
# Ensure the dataset is in a 'dataset' folder relative to this script
df <- read.csv("dataset/Global YouTube Statistics.csv")

# Data Cleaning
# Standardize category labels and remove invalid rows
df_clean <- df %>%
  mutate(
    category = trimws(as.character(category)),
    category = ifelse(tolower(category) == "nan", "not specified", category)
  ) %>%
  filter(
    !is.na(video.views),
    !is.na(subscribers),
    !is.na(category),
    video.views > 0
  )

# --- 1. Descriptive Analytics ---
# Goal: Show which categories "resonate" the most (highest average views)
cat("\n--- Descriptive Analytics ---\n")
category_stats <- df_clean %>%
  group_by(category) %>%
  summarise(
    avg_views = mean(video.views, na.rm = TRUE),
    count = n()
  ) %>%
  arrange(desc(avg_views))

print(head(category_stats))

# Plot the top 10 categories by average views
ggplot(head(category_stats, 10), aes(x = reorder(category, avg_views), y = avg_views)) +
  geom_col(fill = "black") +
  coord_flip() +
  labs(
    title = "Top 10 Categories by Average Views (Resonance)",
    x = "Category",
    y = "Average Video Views"
  ) +
  theme_minimal()
ggsave("descriptive_plot.png")

# --- 2. Inferential Analytics (Hypothesis Testing) ---
# Hypothesis:
# H0 (Null): The type of content (Category) has NO effect on engagement (Views).
# H1 (Alternative): At least one category has significantly different engagement than others.

# Test 1: ANOVA (Analysis of Variance)
cat("\n--- Hypothesis Test 1: ANOVA ---\n")
anova_result <- aov(video.views ~ category, data = df_clean)
summary(anova_result)

# Test 2: Correlation Test (Upload Count vs. Subscribers)
# H0: There is no correlation between number of uploads and number of subscribers.
# H1: There is a significant correlation between uploads and subscribers.
cat("\n--- Hypothesis Test 2: Correlation (Uploads vs Subscribers) ---\n")
cor_test <- cor.test(df_clean$uploads, df_clean$subscribers)
print(cor_test)

# Interpretation: 
# If p-value < 0.05 in either test, we reject H0.
# - For ANOVA: It proves Category matters (Resonance).
# - For Correlation: If correlation is weak, it proves Quality > Quantity.

# --- 3. Predictive Analytics ---
# Goal: Predict future engagement (Subscribers) based on current resonance (Views)
# Use Linear Regression
cat("\n--- Predictive Analytics (Linear Regression) ---\n")
model <- lm(subscribers ~ video.views, data = df_clean)
summary(model)

# Plot the regression
ggplot(df_clean, aes(x = video.views, y = subscribers)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "lm", col = "red") +
  labs(
    title = "Predicting Subscribers based on Video Views",
    x = "Total Video Views (Resonance)",
    y = "Subscribers (Engagement)"
  ) +
  theme_minimal()
ggsave("predictive_plot.png")

cat("\nAnalysis Complete. Check the plots and console output.\n")
