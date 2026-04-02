library(ggwaffle)

nps_waffle <- waffle_iron(map_data, aes_d(group = full), rows = 7)

ggplot(nps_waffle) +
  geom_waffle(aes(x, y, fill = group))