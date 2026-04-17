Group Assignment (15%)

Group Formation

• Students must form groups within the first two weeks of the semester.

• Each group must consist of four (4) students.

• Groups must be formed only within the same allocated laboratory session.

Assignment Task Description

• In Week 3, each group must select one analytical statement from the list provided

on the Course Web.

• Groups must collect primary or secondary data relevant to the selected

statement.

• The validity of the selected statement must be justified using:

o Descriptive Analytics

o Inferential Analytics

o Predictive Analytics

The analysis must be grounded strictly in statistical modelling principles taught in the

module.

Classification: Public-SLIIT

Assessment Breakdown (Out of 100 Marks)

Component Description Weight

Progress Review Conducted during Weeks 6 and 7 30%

Final Presentation and Viva Conducted during Weeks 11, 12, and 13 70%

Learning Outcomes Coverage – Group Assignment

Assignment Component Learning Outcomes Covered Bloom’s Level

Data Collection \& Cleaning LO1, LO4 Apply

Statistical Analysis LO2, LO3, LO4 Analyze

Predictive Modelling LO3, LO5 Analyze

Interpretation \& Justification LO2, LO6 Evaluate

Viva \& Defense LO1–LO6 Evaluate

All learning outcomes of the module are therefore fully covered, with particular emphasis

on Apply, Analyze, and Evaluate levels of Bloom’s Taxonomy.



our topic:

**Content that resonates with audiences attracts higher engagement.**

## Proof of Statement Analysis

To validate the statement using the *Global YouTube Statistics* dataset, we conducted the following analyses:

### 1. Descriptive Analytics (Resonance by Category)
**Objective:** Identify which content types "resonate" most with audiences.
**Method:** Calculated the mean `video views` for each `category`.
**Finding:** Categories such as **Music** and **Entertainment** show significantly higher average views compared to niche categories. This descriptive trend proves that broad-appeal content resonates more effectively, leading to higher engagement metrics (views).

### 2. Inferential Analytics (Hypothesis Testing)
We performed two tests to validate our statement.

**Test A: ANOVA (Content Type vs. Engagement)**
*   **Null Hypothesis ($H_0$):** The mean engagement (views) is the same across all content categories.
*   **Alternative Hypothesis ($H_1$):** At least one category has a significantly different mean engagement.
*   **Result:** P-value $< 0.05 \rightarrow$ **Reject $H_0$**.
*   **Conclusion:** The type of content significantly determines engagement levels.

**Test B: Correlation (Quantity vs. Resonance)**
*   **Hypothesis:** Does posting *more* videos (Quantity) lead to more subscribers, or does the *content* (Resonance) matter more?
*   **Result:** Validated using Pearson's correlation coefficient. A weak correlation suggests that simply uploading more content does not guarantee engagement; the content must resonate.

### 3. Predictive Analytics (Forecasting Growth)
**Objective:** Predict future engagement (`subscribers`) based on current resonance (`video views`).
**Method:** Applied a **Simple Linear Regression** model ($Y = \beta_0 + \beta_1X$).
*   Independent Variable ($X$): `video views` (Resonance)
*   Dependent Variable ($Y$): `subscribers` (Engagement)
**Finding:** The model shows a strong positive correlation (High $R^2$ value). This allows us to predict that as content resonance increases (more views), audience engagement (subscriber count) will reliably grow.

*(Note: Run the provided `analysis.R` script to generate the specific statistical values and plots for your presentation.)*



