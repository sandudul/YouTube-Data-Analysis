# Full Presentation Version - TPSM Group Assignment

## Document Purpose
This is the complete, slide-by-slide presentation script for your project:

**Statement:** "Content that resonates with audiences attracts higher engagement."

This version is built from project files and outputs in:
- `Group Assignment (15%).md`
- `README.md`
- `analysis.R`
- `dataset/Global YouTube Statistics.csv`
- `descriptive_plot.png`
- `predictive_plot.png`

Use this as your final speaking and slide-content reference.

---

## Slide 1 - Title Slide
### Slide Title
**TPSM Group Assignment: Statistical Validation of YouTube Engagement Dynamics**

### On-Slide Content
- Module: TPSM
- Group Assignment (15%)
- Team members: [Add names + IDs]
- Selected analytical statement:
  - "Content that resonates with audiences attracts higher engagement."

### Speaker Notes
"Our presentation validates this statement using statistical modelling. We use descriptive, inferential, and predictive analytics on a real-world YouTube dataset. Our goal is to prove, with data, that resonance-related content outcomes are linked to stronger engagement outcomes."

### Transition
"First, we define the problem and our analytical objectives."

---

## Slide 2 - Problem Statement
### Slide Title
**Problem Context**

### On-Slide Content
- Problem: Why do some channels gain significantly higher engagement than others?
- Core question: Is engagement driven more by content resonance than by upload volume?
- Focus of analysis:
  - Resonance (views) vs engagement (subscribers)
  - Content type (category) vs quantity (uploads)

### Speaker Notes
"In platform ecosystems like YouTube, creators often assume posting more content guarantees growth. Our project tests a stronger hypothesis: resonance, measured through views and category response, is a more meaningful driver of engagement than pure volume."

### Transition
"Next, we outline our analytical objectives." 

---

## Slide 3 - Objectives
### Slide Title
**Analytical Objectives**

### On-Slide Content
1) Identify which content categories show highest resonance (views)
2) Test whether category meaningfully affects resonance (ANOVA)
3) Quantify and predict engagement from resonance (correlation + regression)

### Speaker Notes
"These objectives guide the structure of the workflow: we start with descriptive comparisons by category, then confirm differences with hypothesis testing, and finally estimate a predictive relationship between views and subscribers." 

### Transition
"Now we show the dataset and the variables we mapped to resonance and engagement." 

---

## Slide 4 - Dataset and Variable Mapping
### Slide Title
**Dataset Overview and Variable Definitions**

### On-Slide Content
- Dataset: Global YouTube Statistics (secondary dataset)
- Records after cleaning: **987**
- Number of categories: **19**
- Variable mapping:
  - Resonance proxy: `video.views`
  - Engagement proxy: `subscribers`
  - Content type: `category`
  - Quantity proxy: `uploads`

### Speaker Notes
"We use 987 cleaned observations across 19 content categories. We define resonance as total video views and engagement as total subscribers. Content quantity is represented by uploads, which allows us to test the quality-versus-quantity argument."

### Transition
"Before analysis, we applied a minimal but important cleaning pipeline."

---

## Slide 5 - Data Cleaning and Preparation
### Slide Title
**Data Cleaning Pipeline**

### On-Slide Content
- Tool: R script `analysis.R`
- Cleaning rule used:
  - Remove rows with missing values in `video.views`, `subscribers`, `category`
  - standardizing category labels
  - handling nan categories
  - removing missing key values excluding zero view records 
- Reason:
  - Ensure valid statistical testing and model estimation
- Result:
  - Final usable sample size = **987 rows**
  - Rows removed: **8**
  - not specified category count: **39**

### Speaker Notes
"Our cleaning is aligned with the assignment’s statistical modelling focus. We dropped rows with missing values in core analysis variables to avoid biased estimates and runtime model issues. We did not over-filter, so we preserved data diversity."

### Transition
"With the cleaned data prepared, we first examined descriptive behavior."

---

## Slide 6 - Descriptive Analytics
### Slide Title
**Descriptive Analytics: Which Categories Resonate Most?**

### On-Slide Content
- Method:
  - Compute mean `video.views` per `category`
  - Rank categories by average views
- Top categories by average views:
  1. **Shows**: 34.32B (n = 13)
  2. **Trailers**: 16.63B (n = 2)
  3. **Education**: 15.48B (n = 45)
- Visual: `descriptive_plot.png`

### Speaker Notes
"The descriptive ranking shows strong variation between categories. Categories such as Shows and Education have much higher average view counts, suggesting stronger audience resonance. We also note sample sizes, because categories with very small counts like Trailers can be volatile and should be interpreted carefully."

### Transition
"Descriptive patterns are useful, but we need formal hypothesis testing to confirm significance."

---

## Slide 7 - Inferential Analytics I (ANOVA)
### Slide Title
**ANOVA: Does Category Significantly Affect Engagement (Views)?**

### On-Slide Content
- Model: `video.views ~ category`
- Hypotheses:
  - H0: Mean views are equal across all categories
  - H1: At least one category has a different mean view level
- Results:
  - F-statistic = **5.0849**
  - p-value = **3.07e-11**
- Decision:
  - Since p-value < 0.05, **Reject H0**

### Speaker Notes
"The ANOVA result is statistically significant. This confirms category is not random noise; it has a measurable relationship with views. Therefore, content type plays a significant role in audience resonance."

### Transition
"Now we test whether posting more videos alone explains subscriber growth."

---

## Slide 8 - Inferential Analytics II (Correlation)
### Slide Title
**Correlation Test: Quantity (Uploads) vs Engagement (Subscribers)**

### On-Slide Content
- Test: Pearson correlation between `uploads` and `subscribers`
- Sample used: n = **987**
- Results:
  - r = **0.0889**
  - p-value = **0.00520**
- Interpretation:
  - Relationship is statistically detectable but **very weak** in magnitude

### Speaker Notes
"Even though the p-value is below 0.05, the correlation coefficient is only 0.0889, which is a weak effect. So the practical impact of upload count alone is limited. This supports the argument that quantity without resonance is not enough for meaningful engagement growth."

### Transition
"After descriptive and inferential evidence, we build a predictive model."

---

## Slide 9 - Predictive Analytics (Linear Regression)
### Slide Title
**Predictive Model: Subscribers from Video Views**

### On-Slide Content
- Model: `subscribers ~ video.views`
- Estimated equation:
  - Subscribers = **11,932,454 + 0.0009586 × video.views**
- Goodness of fit:
  - R-squared = **0.6794**
- Visual: `predictive_plot.png`

### Speaker Notes
"The slope is positive, meaning higher views are associated with higher subscribers. An R-squared of 0.6794 indicates the model explains about 67.94% of subscriber variance using views alone, which is strong for a simple one-predictor model. This provides predictive support for the statement."

### Transition
"Now we integrate all three analysis layers into one conclusion."

---

## Slide 10 - Integrated Findings
### Slide Title
**Integrated Statistical Story**

### On-Slide Content
- Descriptive evidence:
  - Categories differ clearly in average resonance
- Inferential evidence:
  - ANOVA confirms category-level differences are significant
  - Upload count has weak correlation with subscribers
- Predictive evidence:
  - Views strongly predict subscriber levels

### Speaker Notes
"All three analytical layers align. Category matters, upload quantity alone is weak, and resonance through views is a strong predictor of engagement. So the selected statement is supported statistically, not just narratively."

### Transition
"Every model has assumptions and boundaries, so we now discuss limitations."

---

## Slide 11 - Limitations and Method Improvements
### Slide Title
**Limitations and Future Enhancements**

### On-Slide Content
- Limitations:
  - Observational dataset: supports association, not strict causality
  - Possible confounders not modeled (country effects, channel age, format strategy)
  - Mean-based summaries can be sensitive to outliers
- Improvements:
  - Multiple regression with additional predictors
  - Log-transform skewed variables
  - Residual diagnostics and robust inference

### Speaker Notes
"Our findings are strong but still correlational in nature. For a stronger causal argument, we would need richer controls or quasi-experimental design. For modelling quality, multiple regression and transformed variables would improve stability and interpretability."

### Transition
"With these considerations, we can now make our final decision on the statement."

---

## Slide 12 - Final Decision
### Slide Title
**Final Decision**

### On-Slide Content
- Decision on statement: **Supported (evidence of association)**
- ANOVA: p-value < 0.05 → category impacts resonance (views)
- Regression: p < 0.05, R² = 0.6794 → views strongly relate to subscribers
- Uploads–subscribers: r = 0.0889 → quantity effect is weak
- Implication: engagement aligns more with resonance than upload volume

### Speaker Notes
"We make a final decision using our inferential and predictive results. The statement is supported as an association: category influences views significantly, views predict subscribers strongly, and upload quantity shows only a weak relationship with subscribers."

### Transition
"Now we summarize the key takeaway and implications."

---

## Slide 13 - Final Conclusion
### Slide Title
**Conclusion**

### On-Slide Content
- Statement verdict: **Supported**
- Why:
  1. Category significantly influences views (ANOVA)
  2. Upload volume has weak practical correlation with subscribers
  3. Views predict subscribers with substantial explanatory power (R² = 0.6794)
- Practical takeaway:
  - Optimize for resonant content strategy, not just publishing frequency

### Speaker Notes
"Our statistical conclusion is clear: content resonance is a key mechanism for engagement growth. Strategy should prioritize content type, audience fit, and resonance indicators over pure output volume."

### Transition
"We are now ready for viva and technical questions."

---

## Slide 14 - Viva and Q&A Backup
### Slide Title
**Viva Readiness**

### On-Slide Content
- Why ANOVA?
  - Compare means across multiple categories
- Why Pearson correlation?
  - Linear association between two numeric variables
- Why simple linear regression?
  - Predictive baseline with interpretable coefficients
- Evidence quality:
  - Significant ANOVA
  - Weak uploads-subscribers effect size
  - Strong resonance-to-engagement predictive fit

### Speaker Notes
"If asked why p-value and effect size both matter: p-value tests whether an effect is likely non-random, while effect size shows practical importance. Our correlation result is a good example: statistically significant but practically weak."

---

## Appendix A - Exact Values You Can Paste Into Slides
- Clean sample size: **987**
- Unique categories: **19**
- Top categories by mean views:
  - Shows: **34,323,602,070**
  - Trailers: **16,631,358,804**
  - Education: **15,480,321,620**
- ANOVA:
  - F = **5.0849**
  - p = **3.0699e-11**
- Correlation (`uploads`, `subscribers`):
  - r = **0.0889**
  - p = **0.0052019**
- Regression (`subscribers ~ video.views`):
  - Intercept = **11,932,454**
  - Slope = **0.0009586346**
  - R² = **0.6794078**

---

## Appendix B - Team Speaking Split (Recommended)
- Member 1: Slides 1-4
- Member 2: Slides 5-6
- Member 3: Slides 7-8
- Member 4: Slides 9-14

---

## Appendix C - Delivery Checklist
- Keep each slide to one core statistical message
- Display the two generated plots clearly
- Mention both significance and effect size where relevant
- Keep final claim tied directly to tested evidence
- Maintain consistent variable names as in `analysis.R`
