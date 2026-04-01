#Day 1 - Part-to-whole

library(tidyverse)
library(readxl)
library(usmap)


#make chloropleth showing nps employement/total employement per state

data <- nps_state_econ_data |> 
  left_join(bls_data) |> 
  mutate(proportion_jobs = (jobs/(total_employment_thousands*1000))*100) |> 
  mutate(prop_tot_nps = (jobs/sum(jobs))*100) |> 
  rename(full = state)

state <- us_map(regions = "states")

map_data <- state |> 
  left_join(data) |> 
  filter(full != ("Puerto Rico"))

ggplot(map_data) +
  geom_sf(aes(fill = proportion_jobs)) +
  theme_bw() +
  labs(fill = "Percent NPS jobs")

