## ----globalKnitrOptions, include = FALSE--------------------------------------
library(malariaAtlas)
knitr::opts_chunk$set(fig.width=12, fig.height=8)

## ----echo=FALSE---------------------------------------------------------------
# Helper function for ensuring functions don't ever throw errors for CRAN
tryOrLog <- function(...) {
  tryCatch({
    eval(...)
  },
  error = function(e) {
    print(e)
    return(NULL)
  })
}

## ----eval = FALSE-------------------------------------------------------------
#  listPRPointVersions()

## ----eval = FALSE-------------------------------------------------------------
#  listVecOccPointVersions()

## ----eval = FALSE-------------------------------------------------------------
#  listShpVersions()

## ----eval = FALSE-------------------------------------------------------------
#  listPRPointCountries(version = "202206")

## ----eval = FALSE-------------------------------------------------------------
#  listVecOccPointCountries(version = "201201")

## ----eval = FALSE-------------------------------------------------------------
#  listSpecies(version = "201201")

## ----eval = FALSE-------------------------------------------------------------
#  listShp(version = "202206")

## ----eval = FALSE-------------------------------------------------------------
#  listRaster()

## ----eval = FALSE-------------------------------------------------------------
#  isAvailable_pr(country = "Madagascar")

## ----eval = FALSE-------------------------------------------------------------
#  isAvailable_pr(ISO = "USA")

## ----eval = FALSE-------------------------------------------------------------
#  isAvailable_pr(continent = "Asia")

## ----eval = FALSE-------------------------------------------------------------
#  isAvailable_vec(country = "Myanmar")

## ----eval = FALSE-------------------------------------------------------------
#  isAvailable_vec(country = c("Nigeria", "Ethiopia"))

## ----eval = FALSE-------------------------------------------------------------
#  isAvailable_pr(country = "Madagascar", version = "202206")

## ----eval = FALSE-------------------------------------------------------------
#  MDG_pr_data <- getPR(country = "Madagascar", species = "both")

## ----message = FALSE, warning = FALSE, results = "hide", echo=FALSE-----------
# Hiding error handling for CRAN
MDG_pr_data <- tryOrLog(getPR(country = "Madagascar", species = "both"))

## ----echo = FALSE-------------------------------------------------------------
tibble::glimpse(MDG_pr_data)

## ----eval = FALSE-------------------------------------------------------------
#  Africa_pvpr_data <- getPR(continent = "Africa", species = "Pv")

## ----message = FALSE, warning = FALSE, results = "hide", echo = FALSE---------
# Hiding error handling for CRAN
Africa_pvpr_data <- tryOrLog(getPR(continent = "Africa", species = "Pv"))

## ----eval = FALSE-------------------------------------------------------------
#  Extent_pfpr_data <- getPR(extent = rbind(c(-2.460181, 13.581921), c(-3.867188, 34.277344)), species = "Pf")

## ----message = FALSE, warning = FALSE, results = "hide", echo = FALSE---------
# Hiding error handling for CRAN
Extent_pfpr_data <- tryOrLog(getPR(extent = rbind(c(-2.460181, 13.581921), c(-3.867188, 34.277344)), species = "Pf"))

## ----eval = FALSE-------------------------------------------------------------
#  MDG_pr_data_202206 <- getPR(country = "Madagascar", species = "both", version = "202206")

## ----message = FALSE, warning = FALSE, results = "hide", echo = FALSE---------
# Hiding error handling for CRAN
MDG_pr_data_202206 <- tryOrLog(getPR(country = "Madagascar", species = "both", version = "202206"))

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MDG_pr_data)

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MDG_pr_data,
         facet = FALSE)

## ----eval=FALSE---------------------------------------------------------------
#  MMR_vec_data <- getVecOcc(country = "Myanmar")

## ----message = FALSE, warning = FALSE, results = "hide", echo=FALSE-----------
# Hiding error handling for CRAN
MMR_vec_data <- tryOrLog(getVecOcc(country = "Myanmar"))

## ----echo = FALSE-------------------------------------------------------------
tibble::glimpse(MMR_vec_data)

## ----eval=FALSE---------------------------------------------------------------
#  MMR_vec_data_201201 <- getVecOcc(country = "Myanmar", version = "201201")

## ----message = FALSE, warning = FALSE, results = "hide", echo=FALSE-----------
# Hiding error handling for CRAN
MMR_vec_data_201201 <- tryOrLog(getVecOcc(country = "Myanmar", version = "201201"))

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MMR_vec_data)

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MMR_vec_data,
         facet = TRUE)

## ----eval = FALSE-------------------------------------------------------------
#  MDG_shp <- getShp(ISO = "MDG", admin_level = c("admin0", "admin1"))

## ----message = FALSE, warning = FALSE, results = "hide", echo = FALSE---------
# Hiding error handling for CRAN
MDG_shp <- tryOrLog(getShp(ISO = "MDG", admin_level = c("admin0", "admin1")))

## ----echo = FALSE-------------------------------------------------------------
tibble::glimpse(MDG_shp)

## ----message = FALSE----------------------------------------------------------
autoplot(MDG_shp)

## ----message = FALSE, warning = FALSE, results = "hide"-----------------------
autoplot(MDG_shp,
         facet = TRUE,
         map_title = "Example of facetted shapefiles.")

## ----eval=FALSE---------------------------------------------------------------
#  MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
#  MDG_PfPR2_10 <- getRaster(dataset_id = "Explorer__2020_Global_PfPR", shp = MDG_shp, year = 2013)

## ----message = FALSE, warning = FALSE, results = "hide", echo=FALSE-----------
# Hiding error handling for CRAN
MDG_shp <- tryOrLog(getShp(ISO = "MDG", admin_level = "admin0"))
MDG_PfPR2_10 <- tryOrLog(getRaster(dataset_id = "Explorer__2020_Global_PfPR", shp = MDG_shp, year = 2013))

## ----message = FALSE----------------------------------------------------------
p <- autoplot(MDG_PfPR2_10, shp_df = MDG_shp)

## ----eval=FALSE---------------------------------------------------------------
#  MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
#  MDG_PfPR2_10 <- getRaster(dataset_id = "Explorer__2020_Global_PfPR", shp = MDG_shp, year = 2013)
#  
#  p <- autoplot(MDG_PfPR2_10, shp_df = MDG_shp, printed = FALSE)
#  
#  pr <- getPR(country = c("Madagascar"), species = "Pf")
#  p[[1]] +
#  geom_point(data = pr[pr$year_start==2013,], aes(longitude, latitude, fill = positive / examined, size = examined), shape = 21)+
#  scale_size_continuous(name = "Survey Size")+
#   scale_fill_distiller(name = "PfPR", palette = "RdYlBu")

## ----eval=FALSE---------------------------------------------------------------
#  MMR_shp <- getShp(ISO = "MMR", admin_level = "admin0")
#  MMR_An_dirus <- getRaster(dataset_id = "Explorer__2010_Anopheles_dirus_complex", shp = MMR_shp)
#  
#  p <- autoplot(MMR_An_dirus, shp_df = MMR_shp, printed = FALSE)
#  
#  vec <- getVecOcc(country = c("Myanmar"), species = "Anopheles dirus")
#  p[[1]] +
#  geom_point(data = vec, aes(longitude, latitude, colour = species))+
#    scale_colour_manual(values = "black", name = "Vector survey locations")+
#   scale_fill_distiller(name = "Predicted distribution of An. dirus complex", palette = "PuBuGn", direction = 1)

