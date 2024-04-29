
######## START ########

# ---- Install, attach and load R packages ----

# A loop that will install all the listed packages if needed
packages <- c("openxlsx", "writexl", "ggplot2", "tidyverse", "here", "ggstatsplot", "ggsignif", "paletter")
for (i in packages) {
  if (!require(i, character.only = TRUE)) install.packages(i)
}

library(openxlsx)
library(writexl)
library(ggplot2)
library(tidyverse)
library(here)
library(ggstatsplot)
library(ggsignif)
library(paletteer)

# ---- Extract raw data ---- 
rawdata <- read.xlsx(here("data", "data_project.xlsx"), sheet = "raw_data")

# Check if the raw data has the expected structure
if (ncol(rawdata) != 3) {
  stop("Unexpected number of columns in raw data. Expected 3 columns.")
}

# Check if the first column contains expected labels
expected_labels <- c("NLS_Control", "NLS_MP004", "NLS_MP010")
if (!identical(colnames(rawdata), expected_labels)) {
  stop("Unexpected column labels in raw data.")
}

# Check if all values are numeric
if (!all(sapply(rawdata, is.numeric))) {
  stop("Non-numeric values found in raw data.")
}

# Check if there are any missing values
if (any(is.na(rawdata))) {
  stop("Missing values found in raw data.")
}

rawdata # Visualize raw data

# ---- Transform the data into long data ----
long_data <- rawdata %>%
  gather(key = "Condition", value = "Number of inclusions per cell") # Condition is used for control, MP004 and MP010

long_data   # Check format of data

write_xlsx(long_data, path = here("data", "processed_data.xlsx"))   # Export processed data to a new document

# ---- Plot a graph with the long data ----
p <- ggbetweenstats(
  data = long_data,
  
  # All necessary labels for graph
  x = Condition,
  y = `Number of inclusions per cell`,
  title = "Average number of TDP-43 inclusions",
  results.subtitle = FALSE,  
  xlab = "",   # No need to apply a label as the code will automatically produce for each condition
  ylab = "Number of inclusions per cell",
  
  # Parameters for stats
  type = "parametric",
  pairwise.display = "s",   # will plot only significant
  p.adjust.method = "bonferroni",
  digits = 2,   # will show 2 decimal places
  ggsignif.args = list(
    textsize = 4, 
    tip_length = 0.01
  ),
  centrality.type = "parametric",   # "parametric" will plot mean
  
  # Adjust visualization settings
  
  # customize the mean
  centrality.point.args = list(size = 5, 
                               color = "#CC0000"),
  #customize the label for the mean
  centrality.label.args = list(size = 4,
                               nudge_x = 0.4,
                               segment.linetype = 4,
                               min.segment.length = 0),
  # customize individual plots
  point.args = list(position = ggplot2::position_jitterdodge(dodge.width = 0.75), 
                    alpha = 0.7,
                    size = 5, 
                    stroke = 0),
  package = "khroma",   # changes package used
  palette = "okabeito"  # uses a colorblind-safe palette
) + 
  
  # removes right text displaying post-hoc test used
  theme(axis.title.y.right = element_blank(), 
        axis.text.y.right = element_blank(), 
        axis.ticks.y.right = element_blank())

p # load plot


# ---- Save plot and export as jpeg----
ggsave(
  filename = "./Figures/NEW_Avg_number_TDP43_inclusions.jpeg",
  dpi = 1200,
  width = 180,
  height = 170,
  units = "mm"
)
 # Nature publishing group criteria used

######## END ########
