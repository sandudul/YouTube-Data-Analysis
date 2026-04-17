# Youtube Statistics Analysis (TPSM Group Assignment)

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
- Source file: [dataset/Global YouTube Statistics.csv](dataset/Global%20YouTube%20Statistics.csv)

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
- `predictive_plot.png` (Subscribers vs views with regression fit)
- `Rplots.pdf` (R graphics device output, depending on your R settings)

## Key results (from the current script)

### Descriptive
The script prints the top categories by **average views** (sample sizes vary per category). Example output includes high average views in categories such as **Shows**, **Trailers**, **Education**, and **Music**.

### Inferential
**ANOVA (views by category):**
- Result: statistically significant differences in mean `video.views` across `category`.
- Example run output: `p = 3.07e-11` (reject $H_0$ at $\alpha = 0.05$).

**Correlation (uploads vs subscribers):**
- Result: statistically significant but weak positive correlation.
- Example run output: `r ≈ 0.089`, `p ≈ 0.0052`.

### Predictive
**Linear regression (subscribers ~ views):**
- Result: strong positive association between `video.views` and `subscribers`.
- Example run output: `p < 2e-16`, with $R^2 \approx 0.679$.

## Conclusion (how to phrase it for the assignment)
These results **strongly support** the statement as an *association*: channels with higher resonance (more views) tend to have higher engagement (more subscribers). Because the dataset is observational, this should be written as “supported by evidence” rather than a strict causal “proof”.
