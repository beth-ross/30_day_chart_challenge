#day 3

library(tidyverse)
library(ggmosaic)
library(viridisLite)

ggplot(blm_data |> 
         filter(category != "BLM Expenditures") |> 
         group_by(state, category) |> 
         summarize(total_output2 = sum(total_econ_output), .groups = 'drop') |> 
         group_by(state) |> 
         mutate(proportion = total_output2/sum(total_output2)) |> 
         ungroup()) +
  geom_mosaic(aes(x = product(state), fill = category, weight = proportion)) +
  scale_fill_viridis_d() +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90),
        text = element_text(size = 16),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.x = element_blank()) +
  labs(title = "BLM Economic Output by State for FY23",
       subtitle = "Total of $252 Billion across the U.S.")
