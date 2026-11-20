library(ggplot2)
library(dplyr)
library(tidyr)
library(ggh4x) # for multiple y-axes labels on facet plot
library(patchwork) # to create multi-plot

# Arctic Ocean
AO <- read.csv("Regressions_ArcticOcean.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# Subset temporally for regressions
# 1998–2008
AO1 <- subset(AO, year >= 1998 & year <= 2008)
# 2009–2018
AO2 <- subset(AO, year >= 2009 & year <= 2018)
# Entire dataset: 1998–2018
AO_all <- subset(AO, year >= 1998 & year <= 2018)

# 12 regressions total - all variables, all time periods
# 1998–2008
AO_Chl_1 <- lm(mnChl.aw.Arctic ~ year, data = AO1)
summary(AO_Chl_1)
AO_SST_1 <- lm(nmSST.aw.Arctic ~ year, data = AO1)
summary(AO_SST_1)
AO_OWA_1 <- lm(mnOW.Arctic ~ year, data = AO1)
summary(AO_OWA_1)
AO_OWD_1 <- lm(OWdays.Arctic ~ year, data = AO1)
summary(AO_OWD_1)

# 2009–2018
AO_Chl_2 <- lm(mnChl.aw.Arctic ~ year, data = AO2)
summary(AO_Chl_2)
AO_SST_2 <- lm(nmSST.aw.Arctic ~ year, data = AO2)
summary(AO_SST_2)
AO_OWA_2 <- lm(mnOW.Arctic ~ year, data = AO2)
summary(AO_OWA_2)
AO_OWD_2 <- lm(OWdays.Arctic ~ year, data = AO2)
summary(AO_OWD_2)

# 1998–2018
AO_Chl_3 <- lm(mnChl.aw.Arctic ~ year, data = AO_all)
summary(AO_Chl_3)
AO_SST_3 <- lm(nmSST.aw.Arctic ~ year, data = AO_all)
summary(AO_SST_3)
AO_OWA_3 <- lm(mnOW.Arctic ~ year, data = AO_all)
summary(AO_OWA_3)
AO_OWD_3 <- lm(OWdays.Arctic ~ year, data = AO_all)
summary(AO_OWD_3)

# Reshape data to create facet plot
AO_long <- pivot_longer(
  AO,
  cols = c(mnChl.aw.Arctic, nmSST.aw.Arctic,
           mnOW.Arctic, OWdays.Arctic),
  names_to = "Variable",
  values_to = "Value"
)

# Reshape data to create facet plot
AO_long$Variable <- factor(
  AO_long$Variable,
  levels = c("mnChl.aw.Arctic", "nmSST.aw.Arctic",
             "mnOW.Arctic", "OWdays.Arctic"),
  labels = c("Chlorophyll a", "Sea Surface Temperature",
             "Open Water Area", "Open Water Days")
)

# Allows for different colors on graph for temporal linear regressions
AO1_long <- subset(AO_long, year >= 1998 & year <= 2008)
AO2_long <- subset(AO_long, year >= 2009 & year <= 2018)

# Creating 2x2 plot for each variable against years
# Function to create an individual plot for each variable
plot_variable <- function(var, y_label) {
  ggplot(subset(AO_long, Variable == var), aes(x = year, y = Value)) +
    geom_point(color = "black") +
    geom_smooth(data = subset(AO_long, Variable == var & year >= 1998 & year <= 2008),
                aes(color = "1998–2008"), method = "lm", se = FALSE) +
    geom_smooth(data = subset(AO_long, Variable == var & year >= 2009 & year <= 2018),
                aes(color = "2009–2018"), method = "lm", se = FALSE) +
    geom_smooth(aes(color = "1998–2018"), method = "lm", se = FALSE) +
    scale_color_manual(name = "Regression Period",
                       values = c("1998–2008" = "blue", "2009–2018" = "red", "1998–2018" = "darkgreen")) +
    theme_classic() +
    labs(x = "Year", y = y_label)
}

p1 <- plot_variable("Chlorophyll a", expression("Chlorophyll a (mg/m"^3*")"))
p2 <- plot_variable("Sea Surface Temperature", expression("SST ("^o*"C)"))
p3 <- plot_variable("Open Water Area", expression("Open Water Area (km"^2*")"))
p4 <- plot_variable("Open Water Days", "Open Water Days (d)")

(p1 + p2) / (p3 + p4) +
  plot_layout(guides = "collect") +
  plot_annotation(title = "Temporal Trends in the Arctic Ocean (1998–2018)")