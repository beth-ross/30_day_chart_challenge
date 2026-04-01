library(tidyverse)
library(here)
library(janitor)
library(tigris)
library(readxl)

project_root <- here::here()

ni_data_folder <- "C:/Users/Beth/Documents/Biz/Next Interior/interior_contributions/interior_contributions/data/"

nps_econ_data <- readRDS(paste0(ni_data_folder,"NPS_econ_by_CD_2025-11-03.rds"))

nps_state_econ_data_dirt <- read_xlsx("nps_state_econ_data.xlsx")

bls_data_dirt <- read_xlsx("bls_state_data.xlsx")                         

nps_state_econ_data <- clean_names(nps_state_econ_data_dirt)

bls_data <- clean_names(bls_data_dirt)



