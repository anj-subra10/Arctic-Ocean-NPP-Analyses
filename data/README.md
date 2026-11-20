These data were obtained from the Bio-optical Database of the Arctic Ocean (Lewis et al., 2020), publicly available on Dryad (https://doi.org/10.5061/dryad.cnp5hqc17). The dataset was accessed on November 19, 2026.

Data were published in tandem with the publication of: K. M. Lewis et al., Changes in phytoplankton concentration now drive increased Arctic Ocean primary production. Science 369, 198-202(2020). DOI:10.1126/science.aay8380

Original file downloaded from Dryad: "aay8380 timeseries data.xlsx"
The file was split and parsed through into many csvs for the analyses performed in this code.

All csvs starting with "Regression" were used to perform the temporal linear regressions on open water area, open water duration, sea surface temperature, and chlorophyll a. "Regressions_ArcticOcean.csv" is used in the "Arctic Ocean Regressions.R" code file. All other "Regression" csvs are used for regional analyses in the "Regional Regressions.R" code file.

"Net Primary Productivity.csv" was used to perform all spatial net primary production linear regressions in the "NPP Regressions.R" code file.

All csvs starting with "Model" were used to fit multiple linear regressions and select the best fit model using Akaike Information Criterion. This is performed in the "Best Model Fit.R" code file.
