
## RedPony Analytics GLM Course (2023 November)

## packages ----
install.packages(c("tidyverse", "magrittr", "glmmTMB", "DHARMa", "car", "effects", "emmeans", "ggeffects", "sjPlot", "curl"))

require(tidyverse)
require(magrittr)
require(glmmTMB)
require(DHARMa)
require(car)
require(effects)
require(emmeans)
require(ggeffects)
require(sjPlot)
require(curl)

## options ----
options(scipen = 6, digits = 8)
ggplot2::theme_set(theme_light())
rstudioapi::writeRStudioPreference("data_viewer_max_columns", 1000L)

## functions ----
diagnostics.func <- function(x){
    par(mfrow=c(2,2))
    simres <- DHARMa::simulateResiduals(fittedModel=x , n=250)
    DHARMa::plotQQunif(simres)
    DHARMa::plotResiduals(simres, rank=T, quantreg=T)
    DHARMa::testZeroInflation(simres)
    DHARMa::testDispersion(simres)
}

# load data from Github ----
githubURL <- "https://github.com/JamesOWaterman/RP_GLM_Course/raw/main/shelter_cat_feeding_latency.rds"
cat_feeding <- readRDS(url(githubURL, method = "libcurl"))

githubURL <- "https://github.com/JamesOWaterman/RP_GLM_Course/raw/main/shelter_cat_survival.rds"
cat_survival <- readRDS(url(githubURL, method = "libcurl"))

githubURL <- "https://github.com/JamesOWaterman/RP_GLM_Course/raw/main/shelter_cat_flea_burden.rds"
cat_fleas <- readRDS(url(githubURL, method = "libcurl"))

githubURL <- "https://github.com/JamesOWaterman/RP_GLM_Course/raw/main/shelter_cat_euthanasia.rds"
cat_euthanasia <- readRDS(url(githubURL, method = "libcurl"))

githubURL <- "https://github.com/JamesOWaterman/RP_GLM_Course/raw/main/shelter_cat_adoption.rds"
cat_adoption <- readRDS(url(githubURL, method = "libcurl"))
