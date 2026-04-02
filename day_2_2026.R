library(ggwaffle)
library(emojifont)
library(tidyverse)
library(patchwork)

# Create data with all 100 positions shown for both years
data <- data.frame(
  year = c(rep(2009, 100), rep(2017, 100)),
  id = c(1:100, 1:100),
  present = c(rep(TRUE, 100), c(rep(TRUE, 51), rep(FALSE, 49)))
) %>%
  mutate(
    row = ceiling(id / 10),
    col = ((id - 1) %% 10) + 1
  )

whale_waffle <- waffle_iron(data, aes_d(group = year), rows = 10)
whale_waffle$label <- emoji("whale2")
whale_waffle$present <- data$present

plot_2009 <- ggplot(whale_waffle |> filter(group == 2009), 
                    aes(x = x, y = y, color = present, fill = present)) +
  geom_text(aes(x, y, label = label), family = "OpenMoji", size = 12) +
  scale_colour_manual(values = c("TRUE" = "#4169E1", "FALSE" = "#D3D3D3")) +
  scale_fill_manual(values = c("TRUE" = "#4169E1", "FALSE" = "#D3D3D3")) +
  coord_equal() +
  theme_void() +
  theme(legend.position = "none") +
  labs(title = "2009")
  

plot_2017 <- ggplot(whale_waffle |> filter(group == 2017), 
                    aes(x = x, y = y, color = present, fill = present)) +
  geom_text(aes(x, y, label = label), family = "OpenMoji", size = 12) +
  scale_colour_manual(values = c("TRUE" = "#4169E1", "FALSE" = "#D3D3D3")) +
  scale_fill_manual(values = c("TRUE" = "#4169E1", "FALSE" = "#D3D3D3")) +
  coord_equal() +
  theme_void() +
  theme(legend.position = "none") +
  labs(title = "2017")

plot_2009 + plot_2017 + plot_layout(ncol = 2, widths = c(.9,.9)) +
  plot_annotation(title = "Rice's Whale population change in Gulf of Mexico",
                  subtitle = "100 whales in 2009 to 51 whales in 2017",
                  caption = "Data from NOAA")
