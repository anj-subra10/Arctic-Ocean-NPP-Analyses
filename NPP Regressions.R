library(ggplot2)

NPP <- read.csv("Net Primary Productivity Values.csv", header = TRUE) # first row headers
NPP <- NPP[-1, ] # remove second row (contains units)
NPP[] <- lapply(NPP, as.numeric)

# Rename columns 2–11
colnames(NPP)[2:12] <- c("Arctic Ocean", "Nordic Sea", "Barents Sea", "Kara Sea",
                         "Laptev Sea", "East Siberian Sea", "Chukchi Sea", "Beaufort Sea",
                         "Canadian Archipelago", "Baffin Bay", "Basin")

results <- list()
year_col <- names(NPP)[1]

for (i in 2:12) {
  variable <- names(NPP)[i]
  
  # Run regression
  model <- lm(as.formula(paste0("`", variable, "` ~ `", year_col, "`")), data = NPP)
  
  # Store model
  results[[variable]] <- model
  
  # Print summary statistics
  cat("\n", variable, "\n")
  print(summary(model))
  
  # Plot regression
  p <- ggplot(NPP, aes(x = .data[[year_col]], y = .data[[variable]])) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE, color = "blue") +
    theme_classic() +
    labs(title = variable, x = "Year", y = "Net Primary Production")
  
  print(p)
}

# Retrieve specific region's results
#summary(results[["Region1"]])