# Arctic-Ocean-NPP-Analyses

All code should be run in RStudio. All data files are provided in the data folder. All R scripts have the corresponding data file names needed in read.csv() functions throughout the file. The README.md in the data folder includes details on which csvs are used in which coding files.

(1) "Arctic Ocean Regressions.R"
This file performs temporal linear regressions on open water area, open water duration, sea surface temperature, and chlorophyll a for the Arctic Ocean only.

(2) "Regional Regressions.R"
This file performs temporal linear regressions on open water area, open water duration, sea surface temperature, and chlorophyll a for nine Arctic Ocean seas and its central Basin.

(3) "NPP Regressions.R"
This file performs regressions on net primary production for the Arctic Ocean, all nine seas, and the Basin.

(4) "Best Model Fit.R"
This file performs every combination of multiple year regressions for the Arctic Ocean, all nine seas, and the Basin. Then, for each region, it computes each model's Akaike Criterion Information (AIC) score. The model with the lowest AIC is chosen as the best fit model. The relative contributions of each predictor to the best fit model's total explained variance is computed using LMG relative importance analysis. 

All analyses were conducted using R version 4.4.0 (2024-04-24).

The following R packages were used:
ggplot2 (3.5.2)
relaimpo (2.2.7)
dplyr (1.1.4)
tidyr (1.3.1)
ggh4x (0.3.1)
patchwork (1.3.2)

AI Use Statement: ChatGPT (GPT-6) was used to assist with writing and debugging R code. All AI-assisted code and outputs were reviewed, and I have read and understood the code and independently verified the resulting calculations.
