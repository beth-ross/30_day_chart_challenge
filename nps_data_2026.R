library(tidyverse)
library(here)

project_root <- here::here()

ni_data_folder <- "C:/Users/Beth/Documents/Biz/Next Interior/interior_contributions/interior_contributions/data/"

nps_econ_data <- readRDS(paste0(ni_data_folder,"NPS_econ_by_CD_2025-11-03.rds"))


                         