% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/autoplot.SpatRaster.R
\name{autoplot.SpatRaster}
\alias{autoplot.SpatRaster}
\title{Quickly visualise Rasters downloaded from MAP}
\usage{
\method{autoplot}{SpatRaster}(
  object,
  ...,
  shp_df = NULL,
  legend_title = "",
  plot_titles = TRUE,
  fill_scale_transform = "identity",
  fill_colour_palette = "RdYlBu",
  printed = TRUE
)
}
\arguments{
\item{object}{SpatRaster object to be visualised.}

\item{...}{Other arguments passed to specific methods}

\item{shp_df}{Shapefile(s) (data.frame) to plot with downloaded raster.}

\item{legend_title}{String used as title for all colour scale legends.}

\item{plot_titles}{Plot name of raster object as header for each individual raster plot?}

\item{fill_scale_transform}{String givning a transformation for the fill aesthetic.
See the trans argument in \code{\link[ggplot2]{continuous_scale}} for possible values.}

\item{fill_colour_palette}{String referring to a colorbrewer palette to be used for raster colour scale.}

\item{printed}{Logical vector indicating whether to print maps of supplied rasters.}
}
\value{
\code{autoplot.SpatRaster} returns a list of plots (gg objects) for each
  supplied raster.
}
\description{
\code{autoplot.SpatRaster} creates a map of all rasters in a SpatRaster object and
  displays these in a grid.
}
\examples{
\dontrun{
# Download PfPR2-10 Raster (Bhatt et al 2015) and raw survey points
#   for Madagascar in 2013 and visualise these together on a map.

# Download madagascar shapefile to use for raster download.
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")

# Download PfPR2-10 Raster for 2013 & plot this
MDG_PfPR2_10 <- getRaster(surface = "Plasmodium falciparum PR2-10", 
                          shp = MDG_shp, year = 2013)
p <- autoplot(MDG_PfPR2_10, shp_df = MDG_shp)

# Download raw PfPR survey points & plot these over the top of the raster
pr <- getPR(country = c("Madagascar"), species = "Pf")
# p[[1]] + geom_point(data = pr[pr$year_start==2013,],
#            aes(longitude, latitude, fill = positive / examined,
#                size = examined), shape = 21) +
#   scale_size_continuous(name = "Survey Size") +
#    scale_fill_distiller(name = "PfPR", palette = "RdYlBu") +
#    ggtitle("Raw PfPR Survey points\n +
#          Modelled PfPR 2-10 in Madagascar in 2013")


# Download global raster of G6PD deficiency (Howes et al 2012) and visualise this on a map.
G6PDd_global <- getRaster(surface = "G6PD Deficiency Allele Frequency")
autoplot(G6PDd_global)
}

}
\seealso{
\code{\link{getRaster}}:

to download rasters directly from MAP.
}
