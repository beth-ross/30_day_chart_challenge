# day 8: "circular"
library(fmsb)
library(patchwork)
library(tidyverse)
library(emojifont)

bee_data <- data.frame(Jan = 10,
                       Feb = 12,
                       March = 77,
                       Apr = 194,
                       May = 248,
                       June = 338,
                       July = 367,
                       Aug = 380,
                       Sept = 319,
                       Oct = 88,
                       Nov = 10,
                       Dec = 2)

bee_data <- rbind(rep(380,12),rep(0,12),bee_data)

bee_radar <- radarchart(bee_data,
                        title = "Number of observed native bee species in New Mexico")

bee_data2 <- bee_data[-c(1:2),] |> 
    pivot_longer(
    cols = everything(),
    names_to = "Month",
    values_to = "Count"
  ) |> 
  mutate(label = emoji('bee'))

ggplot(data = bee_data2, 
       aes(x = fct_inorder(Month), y = Count)) +
  geom_emoji(emoji = "1f41d") +
  geom_line(color = "grey") +
  theme_minimal() +
  labs(x = "Month", y = "Count of Species",
       title = "Number of observed native bee species in New Mexico") +
  theme(text = element_text(size = 16))
