## ----globalKnitrOptions, include = FALSE--------------------------------------
knitr::opts_chunk$set(fig.width=12, fig.height=8)

## ----listd, results = "hide", message = FALSE---------------------------------
library(malariaAtlas)
listData(datatype = "pr points")

## ----results = "hide", message = FALSE----------------------------------------
listData(datatype = "vector points")

## ----results = "hide", message = FALSE----------------------------------------
listData(datatype = "raster")

## ----results = "hide", message = FALSE----------------------------------------
listData(datatype = "shape")

## ----highlight = TRUE---------------------------------------------------------
isAvailable_pr(country = "Madagascar")

## ----highlight = TRUE---------------------------------------------------------
isAvailable_vec(country = "Myanmar")

## ----message = FALSE----------------------------------------------------------
MDG_pr_data <- getPR(country = "Madagascar", species = "both")

## ----message = FALSE----------------------------------------------------------
MMR_vec_data <- getVecOcc(country = "Myanmar")

## ----message = FALSE----------------------------------------------------------
MDG_shp <- getShp(ISO = "MDG", admin_level = c("admin1", "admin2"))

