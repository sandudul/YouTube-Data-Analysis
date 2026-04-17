# Youtube Statistics Analysis - TPSM Group Assignment

## Introduction
This repository contains the statistical analysis for our group assignment in the **TPSM** module. 

Our selected analytical statement is:
> **"Content that resonates with audiences attracts higher engagement."**

The goal of this project is to validate this statement using **Descriptive**, **Inferential**, and **Predictive** analytics grounded in statistical modelling principles. We use R for all data processing and analysis.

## Dataset
We utilized the **Global YouTube Statistics** dataset.
- **Source:** [dataset/Global YouTube Statistics.csv](dataset/Global%20YouTube%20Statistics.csv)
- **Key Variables Used:**
  - `video views`: Represents audience resonance.
  - `subscribers`: Represents long-term engagement.
  - `category`: Represents content type.
  - `uploads`: Used to test quantity vs. quality hypotheses.

## Process
The analysis follows a structured statistical approach:

1.  **Data Loading & Cleaning**: 
    -   Loaded the dataset using R.
    -   Filtered out missing values (`NA`) in key columns to ensure accuracy.

2.  **Descriptive Analytics**:
    -   Objective: Identify which content categories currently "resonate" the most.
    -   Method: Calculated and plotted the mean video views for each category.

3.  **Inferential Analytics**:
    -   Objective: Statistically prove that content type affects engagement.
    -   Method: Performed ANOVA and Correlation tests.

4.  **Predictive Analytics**:
    -   Objective: Forecast future engagement based on current resonance metrics.
    -   Method: Applied Simple Linear Regression.

To run the analysis:
```R
# Run the main script
source("analysis.R")
```

## Main Hypothesis
Our central hypothesis is that **audience resonance (measured by views and category preference) is a stronger driver of engagement (subscribers) than mere quantity of output.**

We break this down into specific statistical hypotheses:

### 1. Categories determine Resonance (ANOVA)
-   **$H_0$ (Null):** The mean engagement (views) is the *same* across all content categories.
-   **$H_1$ (Alternative):** At least one category has a significantly different mean engagement.
    -   *result:* We expect to **reject $H_0$**, proving that the *type* of content is a significant factor in how much it resonates.

### 2. Quality > Quantity (Correlation)
-   **Hypothesis:** Is there a strong correlation between the *number of uploads* and *subscribers*?
    -   *Interpretation:* A weak correlation suggests that simply posting *more* does not guarantee engagement; the content must resonate to be effective.

## Models with Hypothesis

### Model A: Analysis of Variance (ANOVA)
-   **Formula:** `video.views ~ category`
-   **Purpose:** To determine if the variance in views is significantly explained by the content category. This statistically validates that "Content Type" is a driver of resonance.

### Model B: Simple Linear Regression
-   **Formula:** `subscribers ~ video.views`
    -   $Y = \beta_0 + \beta_1X$
    -   $Y$ = Subscribers (Engagement)
    -   $X$ = Video Views (Resonance)
-   **Purpose:** To predict subscriber growth based on view counts. A strong positive relationship ($R^2$) confirms that as content resonates more (getting more views), it leads to higher engagement (more subscribers).
