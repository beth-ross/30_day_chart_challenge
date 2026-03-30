#Day 1 - Part-to-whole

library(treemap)
library(d3treeR)

#remove '&' from data
nps_econ2 <- nps_econ_data |> 
  mutate(NPS_unit_nm = str_replace(NPS_unit_nm, "&", ""))

#treemap doesn't match in box size or legend colors = smoky or golden gate should be
# bigger than blue ridge
nps_econ2 |> filter(econ_output > 2000000)

treemap(nps_econ2,
        index = "NPS_unit_nm",
        vSize = "econ_output",
        #fontsize.labels = 15,
        #bg.labels = c("white"),
        vColor = "econ_output",
        type = "value",
        #palette = "BuPu",
        title = "Economic Output by NPS Unit",
        title.legend = "Output in $000")

#inter <- d3tree(nps_tree, width = "200%", height = "600px", rootname = "test")
