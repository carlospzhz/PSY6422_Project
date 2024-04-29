# PSY6422_Project
Mini-project focusing on improving visualizations.

## Purpose:
The objective of this module project is to recreate a graph from from an undergraduate dissertation titled “The effects of calcium modulators on TDP-43 function and development of a new co-localization protocol in ALS cellular models” using the original data in R, aiming to achieve the following:
1. Develop a visualization that improves upon the aesthetics of the existing graph, enhancing its visual appeal and clarity.
2. Create a visualization that facilitates the interpretation of the obtained data, offering new insight.

Full project is viewable at https://github.com/carlospzhz/PSY6422_Project.

### Research Question
The current graph lacks the ability to illustrate the distribution of individual data points. This information is crucial for understanding whether the observed increase in TDP-43 inclusions with MP004 is due to a general augmentation of inclusions across all cells or if it’s primarily driven by a rise in the frequency of cells with significantly higher numbers of inclusions. Thus, recreating the graph aims to answer this question.

### This repository contains:
- **figures** folder which contains:
  1. "Average_number_of_Inclusions_4h" - the original figure.
  2. "NEW_Avg_number_TDP43_inclusions.jpeg" - the final plot produced.
- **data** folder which contains:
  1. "codebook.txt" - a codebook for interpretation of the variables.
  2. "data_project.xlsx" - raw data used for the analysis and processing.
  3. "processed_data.xlsx" - data processed (long format) in the code used for visualisation.
- index.rmd - RMarkdown file (code)
- index.html - A web page of the markdown file


### Visualization produced
![](https://github.com/carlospzhz/PSY6422_Project/figures/NEW_Avg_number_TDP43_inclusions.jpeg)
