analyze_region <- function(file, region_name) {
  AO <- read.csv(file, header = TRUE)
  AO <- AO[-1, ]
  AO[] <- lapply(AO, as.numeric)
  
  # Subset data by time period
  AO1 <- subset(AO, year >= 1998 & year <= 2008)
  AO2 <- subset(AO, year >= 2009 & year <= 2018)
  AO_all <- subset(AO, year >= 1998 & year <= 2018)
  
  # Run all 12 regressions
  variables <- c(
    grep("^mnChl.aw\\.", names(AO), value = TRUE),
    grep("^nmSST.aw\\.", names(AO), value = TRUE),
    grep("^mnOW\\.", names(AO), value = TRUE),
    grep("^OWdays\\.", names(AO), value = TRUE)
  )
  periods <- list("1998–2008" = AO1, "2009–2018" = AO2, "1998–2018" = AO_all)
  
  models <- lapply(periods, function(data) {
    setNames(lapply(variables, function(v) {
      lm(reformulate("year", response = v), data = data)
    }), variables)
  })
  
  # Reshape data for plotting
  AO_long <- pivot_longer(AO, cols = all_of(variables),
                          names_to = "Variable", values_to = "Value")
  
  AO_long$Variable <- factor(AO_long$Variable, levels = variables,
                             labels = c("Chlorophyll a", "Sea Surface Temperature",
                                        "Open Water Area", "Open Water Days"))
  
  # Individual plot function
  plot_variable <- function(var, y_label) {
    ggplot(subset(AO_long, Variable == var), aes(x = year, y = Value)) +
      geom_point(color = "black") +
      geom_smooth(data = subset(AO_long, Variable == var & year >= 1998 & year <= 2008),
                  aes(color = "1998–2008"), method = "lm", se = FALSE) +
      geom_smooth(data = subset(AO_long, Variable == var & year >= 2009 & year <= 2018),
                  aes(color = "2009–2018"), method = "lm", se = FALSE) +
      geom_smooth(aes(color = "1998–2018"), method = "lm", se = FALSE) +
      scale_color_manual(name = "Regression Period",
                         values = c("1998–2008" = "blue", "2009–2018" = "red",
                                    "1998–2018" = "darkgreen")) +
      theme_classic() +
      labs(x = "Year", y = y_label)
  }
  
  # Create four plots
  p1 <- plot_variable("Chlorophyll a", expression("Chlorophyll a (mg/m"^3*")"))
  p2 <- plot_variable("Sea Surface Temperature", expression("SST ("^o*"C)"))
  p3 <- plot_variable("Open Water Area", expression("Open Water Area (km"^2*")"))
  p4 <- plot_variable("Open Water Days", "Open Water Days (d)")
  
  # Combine plots
  combined_plot <- (p1 + p2) / (p3 + p4) +
    plot_layout(guides = "collect") +
    plot_annotation(title = paste("Temporal Trends: 1998–2018"))
  
  # Return data, regressions, and plot
  return(list(data = AO, models = models, plot = combined_plot))
}

region_files <- c(
  NordicSea = "Regressions_NordicSea.csv",
  BarentsSea = "Regressions_BarentsSea.csv",
  KaraSea = "Regressions_KaraSea.csv",
  LaptevSea = "Regressions_LaptevSea.csv",
  EastSiberianSea = "Regressions_EastSiberianSea.csv",
  ChukchiSea = "Regressions_ChukchiSea.csv",
  BeaufortSea = "Regressions_BeaufortSea.csv",
  CanadianArchipelago = "Regressions_CanadianArchipelago.csv",
  BaffinBay = "Regressions_BaffinBay.csv",
  Basin = "Regressions_Basin.csv"
)

# Run analysis for all regions
results <- list()

for (region in names(region_files)) {
  results[[region]] <- analyze_region(region_files[[region]], region)
}

# Extract results
results[["Basin"]]$plot

# Get variable names
names(results[["Basin"]]$models[["1998–2008"]])

# 1998–2008
lapply(results[["Basin"]]$models[["1998–2008"]], summary)

# 2009–2018
lapply(results[["Basin"]]$models[["2009–2018"]], summary)

# 1998–2018
lapply(results[["Basin"]]$models[["1998–2018"]], summary)