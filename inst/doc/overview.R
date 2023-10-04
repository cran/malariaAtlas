## ----globalKnitrOptions, include = FALSE--------------------------------------
library(malariaAtlas)
knitr::opts_chunk$set(fig.width=12, fig.height=8)

## ----results = "hide", message = FALSE----------------------------------------
listPRPointVersions()

## ----results = "hide", message = FALSE----------------------------------------
listVecOccPointVersions()

## ----results = "hide", message = FALSE----------------------------------------
listShpVersions()

## ----results = "hide", message = FALSE----------------------------------------
listPRPointCountries(version = "202206")

## ----results = "hide", message = FALSE----------------------------------------
listVecOccPointCountries(version = "201201")

## ----results = "hide", message = FALSE----------------------------------------
listSpecies(version = "201201")

## ----results = "hide", message = FALSE----------------------------------------
listShp(version = "202206")

## ----results = "hide", message = FALSE----------------------------------------
listRaster()

## ----results = "hide", message = FALSE----------------------------------------
isAvailable_pr(country = "Madagascar")

## ----results = "hide", message = FALSE----------------------------------------
isAvailable_pr(ISO = "USA")

## ----results = "hide", message = FALSE----------------------------------------
isAvailable_pr(continent = "Asia")

## ----results = "hide", message = FALSE----------------------------------------
isAvailable_vec(country = "Myanmar")

## ----results = "hide", message = FALSE----------------------------------------
isAvailable_vec(country = c("Nigeria", "Ethiopia"))

## ----results = "hide", message = FALSE----------------------------------------
isAvailable_pr(country = "Madagascar", version = "202206")

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
MDG_pr_data <- getPR(country = "Madagascar", species = "both")

## ----echo = FALSE-------------------------------------------------------------
tibble::glimpse(MDG_pr_data)

## ----message = FALSE----------------------------------------------------------
Africa_pvpr_data <- getPR(continent = "Africa", species = "Pv")

## ----message = FALSE----------------------------------------------------------
Extent_pfpr_data <- getPR(extent = rbind(c(-2.460181, 13.581921), c(-3.867188, 34.277344)), species = "Pf")

## ----message = FALSE----------------------------------------------------------
MDG_pr_data_202206 <- getPR(country = "Madagascar", species = "both", version = "202206")

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MDG_pr_data)

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MDG_pr_data,
         facet = FALSE)

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
MMR_vec_data <- getVecOcc(country = "Myanmar")

## ----echo = FALSE-------------------------------------------------------------
tibble::glimpse(MMR_vec_data)

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
MMR_vec_data_201201 <- getVecOcc(country = "Myanmar", version = "201201")

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MMR_vec_data)

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MMR_vec_data,
         facet = TRUE)

## ----message = FALSE----------------------------------------------------------
MDG_shp <- getShp(ISO = "MDG", admin_level = c("admin0", "admin1"))

## ----echo = FALSE-------------------------------------------------------------
tibble::glimpse(MDG_shp)

## ----message = FALSE----------------------------------------------------------
autoplot(MDG_shp)

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MDG_shp,
         facet = TRUE,
         map_title = "Example of facetted shapefiles.")

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
MDG_PfPR2_10 <- getRaster(dataset_id = "Explorer__2020_Global_PfPR", shp = MDG_shp, year = 2013)

## ----message = FALSE----------------------------------------------------------
p <- autoplot(MDG_PfPR2_10, shp_df = MDG_shp)

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
MDG_PfPR2_10 <- getRaster(dataset_id = "Explorer__2020_Global_PfPR", shp = MDG_shp, year = 2013)

p <- autoplot(MDG_PfPR2_10, shp_df = MDG_shp, printed = FALSE)

pr <- getPR(country = c("Madagascar"), species = "Pf")
p[[1]] +
geom_point(data = pr[pr$year_start==2013,], aes(longitude, latitude, fill = positive / examined, size = examined), shape = 21)+
scale_size_continuous(name = "Survey Size")+
 scale_fill_distiller(name = "PfPR", palette = "RdYlBu")

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
MMR_shp <- getShp(ISO = "MMR", admin_level = "admin0")
MMR_An_dirus <- getRaster(dataset_id = "Explorer__2010_Anopheles_dirus_complex", shp = MMR_shp)

p <- autoplot(MMR_An_dirus, shp_df = MMR_shp, printed = FALSE)

vec <- getVecOcc(country = c("Myanmar"), species = "Anopheles dirus")
p[[1]] +
geom_point(data = vec, aes(longitude, latitude, colour = species))+
  scale_colour_manual(values = "black", name = "Vector survey locations")+
 scale_fill_distiller(name = "Predicted distribution of An. dirus complex", palette = "PuBuGn", direction = 1)

