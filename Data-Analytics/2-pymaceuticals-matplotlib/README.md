# Pymaceuticals Inc. Analysis

## Summary
Data visualization plays a crucial role in understanding complex datasets, and this assignment leverages Matplotlib to analyze and present findings from an animal study on potential cancer treatments.

### Analysis Overview
- Data Cleaning: Identified and removed a mouse with duplicated timepoints for the same drug regimen, ensuring data integrity for subsequent analysis.
- Summary Statistics: Calculated mean, median, standard deviation, and standard error of the mean for tumor volume across different drug regimens. Ketapril exhibited the largest tumor volumes on average.
- Bar Charts and Pie Charts: Visualized the distribution of drug regimen timepoints and the gender distribution of mice using both Pandas' DataFrame.plot() method and Matplotlib's pyplot methods.
- Quartiles, Outliers, and Box Plots: Calculated quartiles and interquartile range (IQR) for final tumor volumes across four promising treatment regimens (Capomulin, Ramicane, Infubinol, and Ceftamin). Identified one outlier in the Infubinol regimen.
- Line Plot and Scatter Plot: Examined tumor volume progression over time for a mouse treated with Capomulin, and observed a positive correlation between mouse weight and average tumor volume for the entire Capomulin treatment regimen.
- Correlation and Regression: Calculated the correlation coefficient and performed linear regression analysis to understand the relationship between mouse weight and tumor volume.

### Key Insights
- Ketapril showed the largest tumor volumes, highlighting the importance of effective treatment selection.
- Infubinol exhibited an outlier, suggesting further investigation into its efficacy and potential side effects.
- Capomulin treatment resulted in tumor volume reduction over time for a specific mouse, indicating its effectiveness as a treatment option.
- Positive correlation between mouse weight and tumor volume suggests weight management could impact treatment outcomes.

This analysis provides valuable insights for Pymaceuticals Inc. in their pursuit of effective anti-cancer medications and lays the foundation for further research and development efforts.
