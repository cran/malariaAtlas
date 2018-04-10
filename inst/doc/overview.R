## ----globalKnitrOptions, include = FALSE---------------------------------
knitr::opts_chunk$set(fig.width=12, fig.height=8)

## ----listd, results = "hide", message = FALSE----------------------------
library(malariaAtlas)
listData(datatype = "points")

## ----results = "hide", message = FALSE-----------------------------------
listData(datatype = "raster")

## ----results = "hide", message = FALSE-----------------------------------
listData(datatype = "shape")

## ----highlight = TRUE----------------------------------------------------
isAvailable(country = "Madagascar")

## ---- error = TRUE, highlight = TRUE-------------------------------------
isAvailable(ISO = "USA")

## ----message = FALSE-----------------------------------------------------
MDG_pr_data <- getPR(country = "Madagascar", species = "both")

## ----echo = FALSE--------------------------------------------------------
tibble::glimpse(MDG_pr_data)

## ----message = FALSE, warning = FALSE, results = "hide"------------------
autoplot(MDG_pr_data)

## ----message = FALSE, warning = FALSE, results = "hide"------------------
p <- autoplot(MDG_pr_data, printed = FALSE)
p + 
  scale_fill_gradientn(colours = rev(palettetown::pokepal('charmeleon', spread = 3))) +
  theme_minimal()

## ----message = FALSE-----------------------------------------------------
MDG_shp <- getShp(ISO = "MDG", admin_level = "both")

## ----echo = FALSE--------------------------------------------------------
tibble::glimpse(MDG_shp)

## ----message = FALSE-----------------------------------------------------
MDG_shp <- as.MAPshp(MDG_shp)
autoplot(MDG_shp)

## ----message = FALSE-----------------------------------------------------
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
MDG_PfPR2_10 <- getRaster(surface = "Plasmodium falciparum PR2-10", shp = MDG_shp, year = 2013)

## ----message = FALSE-----------------------------------------------------
MDG_PfPR2_10_df <- as.MAPraster(MDG_PfPR2_10)
MDG_shp_df <- as.MAPshp(MDG_shp)
p <- autoplot(MDG_PfPR2_10_df, shp_df = MDG_shp_df)

## ----message = FALSE, warning = FALSE------------------------------------
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
MDG_shp_df <- as.MAPshp(MDG_shp)
MDG_PfPR2_10 <- getRaster(surface = "Plasmodium falciparum PR2-10", shp = MDG_shp, year = 2013)
MDG_PfPR2_10_df <- as.MAPraster(MDG_PfPR2_10)

p <- autoplot(MDG_PfPR2_10_df, shp_df = MDG_shp_df, printed = FALSE)

pr <- getPR(country = c("Madagascar"), species = "Pf")
p[[1]] +
geom_point(data = pr[pr$year_start==2013,], aes(longitude, latitude, fill = positive / examined, size = examined), shape = 21)+
scale_size_continuous(name = "Survey Size")+
 scale_fill_distiller(name = "PfPR", palette = "RdYlBu")+
 ggtitle("Raw PfPR Survey points\n + Modelled PfPR 2-10 in Madagascar in 2013")

