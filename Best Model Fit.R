library(relaimpo)

# Arctic Ocean
AO <- read.csv("Model_ArcticOcean.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)
summary(model5)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
summary(model10)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model5, type = "lmg", rela = TRUE)
calc.relimp(model1, type = "lmg", rela = TRUE)
calc.relimp(model10, type = "lmg", rela = TRUE)

#-----------------------------------------------
# Nordic Sea
AO <- read.csv("Model_NordicSea.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)
summary(model5)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model5, type = "lmg", rela = TRUE)

#-----------------------------------------------
# Barents Sea
AO <- read.csv("Model_BarentsSea.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)
summary(model5)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model5, type = "lmg", rela = TRUE)

#-----------------------------------------------
# Kara Sea
AO <- read.csv("Model_KaraSea.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)
summary(model1)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model1, type = "lmg", rela = TRUE)

#-----------------------------------------------
# Laptev Sea
AO <- read.csv("Model_LaptevSea.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)
summary(model1)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model1, type = "lmg", rela = TRUE)

#-----------------------------------------------
# East Siberian Sea
AO <- read.csv("Model_EastSiberianSea.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)
summary(model1)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model1, type = "lmg", rela = TRUE)

#-----------------------------------------------
# Chukchi Sea
AO <- read.csv("Model_ChukchiSea.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)
summary(model5)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model5, type = "lmg", rela = TRUE)

#-----------------------------------------------
# Beaufort Sea
AO <- read.csv("Model_BeaufortSea.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)
summary(model1)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model1, type = "lmg", rela = TRUE)

#-----------------------------------------------
# Canadian Archipelago
AO <- read.csv("Model_CandianArchipelago.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)
summary(model1)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model1, type = "lmg", rela = TRUE)

#-----------------------------------------------
# Baffin Bay
AO <- read.csv("Model_BaffinBay.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)
summary(model5)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model5, type = "lmg", rela = TRUE)

#-----------------------------------------------
# Basin
AO <- read.csv("Model_Basin.csv", header = TRUE) # first row headers
AO <- AO[-1, ] # remove second row (contains units)
AO[] <- lapply(AO, as.numeric)

# All possible models
model1 <- lm(NPP ~ OWD + OWA + SST + Chl, data = AO)

model2 <- lm(NPP ~ OWD + OWA + SST, data = AO)
model3 <- lm(NPP ~ OWD + OWA + Chl, data = AO)
model4 <- lm(NPP ~ OWD + SST + Chl, data = AO)
model5 <- lm(NPP ~ OWA + SST + Chl, data = AO)

model6 <- lm(NPP ~ OWD + OWA, data = AO)
model7 <- lm(NPP ~ OWD + SST, data = AO)
model8 <- lm(NPP ~ OWD + Chl, data = AO)
model9 <- lm(NPP ~ OWA + SST, data = AO)
model10 <- lm(NPP ~ OWA + Chl, data = AO)
summary(model10)
model11 <- lm(NPP ~ SST + Chl, data = AO)

model12 <- lm(NPP ~ OWD, data = AO)
model13 <- lm(NPP ~ OWA, data = AO)
model14 <- lm(NPP ~ SST, data = AO)
model15 <- lm(NPP ~ Chl, data = AO)

# Compare AIC
AIC(model1, model2, model3, model4, model5,
    model6, model7, model8, model9, model10,
    model11, model12, model13, model14, model15)

calc.relimp(model10, type = "lmg", rela = TRUE)