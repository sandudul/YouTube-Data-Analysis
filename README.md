# Youtube Statistics Analysis

This repository contains our R-based statistical analysis for the TPSM group assignment.

**Analytical statement:**
> **"Content that resonates with audiences attracts higher engagement."**

We operationalize:
- **Resonance** → `video.views` (total video views)
- **Engagement** → `subscribers`
- **Content type** → `category`
- **Quantity** → `uploads` (used to test “quantity vs engagement”)

The workflow covers **Descriptive**, **Inferential**, and **Predictive** analytics.

## Dataset
We use the **Global YouTube Statistics** dataset:
- Source file: [Global YouTube Statistics.csv]([dataset/Global%20YouTube%20Statistics.csv](https://www.kaggle.com/datasets/nelgiriyewithana/global-youtube-statistics-2023))

after cleaning:
- Usable records: **987** (rows removed: **8**)
- Categories: **19**
- `not specified` category count: **39**

## What the analysis does
The main script [analysis.R](analysis.R) performs:

1) **Data loading & cleaning**
- Reads the CSV from `dataset/`.
- Standardizes `category` (trims whitespace; converts `NaN` category labels to `not specified`).
- Filters invalid rows (removes missing `video.views`, `subscribers`, `category`; keeps `video.views > 0`).

2) **Descriptive analytics (resonance by category)**
- Computes average `video.views` per `category`.
- Saves a bar chart of the top 10 categories by average views.

3) **Inferential analytics (hypothesis testing)**
- **ANOVA:** tests whether mean views differ across categories.
- **Correlation:** tests whether `uploads` is strongly related to `subscribers`.

4) **Predictive analytics (engagement prediction)**
- **Linear regression:** `subscribers ~ video.views` to quantify the relationship between resonance and engagement.
- Saves a scatterplot with regression line.

## How to run

### Option A (recommended): Rscript
From the repo root:

```bash
Rscript analysis.R
```

**Windows note:** if `Rscript` is not on PATH, you can call it by full path, for example:

```powershell
& "C:\Program Files\R\R-4.4.2\bin\Rscript.exe" analysis.R
```

### Option B: R interactive
In an R console from the repo root:

```r
source("analysis.R")
```

On first run, the script will install missing packages (`ggplot2`, `dplyr`).

## Outputs
Running the script generates:
- `descriptive_plot.png` (Top 10 categories by average views)
- `descriptive_views_distribution.png` (Views distribution for top categories; log scale)
- `descriptive_uploads_vs_subscribers.png` (Uploads vs subscribers; log-log)
- `predictive_plot.png` (Subscribers vs views with regression fit)
- `Rplots.pdf` (R graphics device output, depending on your R settings)

## Key results (presentation values)

### Descriptive
Top categories by **average views** (mean `video.views`; sample sizes in parentheses):
- **Shows**: 34.32B (n = 13)
- **Trailers**: 16.63B (n = 2)
- **Education**: 15.48B (n = 45)

### Inferential
**ANOVA (views by category):**
- Result: statistically significant differences in mean `video.views` across `category`.
- F-statistic = **5.0849**
- p-value = **3.07e-11** (reject $H_0$ at $\alpha = 0.05$)

**Correlation (uploads vs subscribers):**
- Result: statistically significant but weak positive correlation.
- Pearson r = **0.0889**
- p-value = **0.00520**

### Predictive
**Linear regression (subscribers ~ views):**
- Result: strong positive association between `video.views` and `subscribers`.
- Estimated equation: **Subscribers = 11,932,454 + 0.0009586 × video.views**
- $R^2$ = **0.6794**

## Conclusion (how to phrase it for the assignment)
These results **strongly support** the statement as an *association*: channels with higher resonance (more views) tend to have higher engagement (more subscribers). Because the dataset is observational, this should be written as “supported by evidence” rather than a strict causal “proof”.
