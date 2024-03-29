% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as.MAPshp.R
\name{as.MAPshp}
\alias{as.MAPshp}
\title{Convert SpatialPolygon objects into MAPshp objects}
\usage{
as.MAPshp(object)
}
\arguments{
\item{object}{SpatialPolygon or SpatialPolygonsDataframe object to convert into a 'MAPshp'.}
}
\value{
\code{as.MAPshp} returns a MAPshp object (data.frame) containing the below columns.

\enumerate{
\item \code{country_id} ISO-3 code of given administrative unit (or the ISO code of parent unit for administrative-level 1 units).
\item \code{gaul_code} GAUL code of given administrative unit.
\item \code{admn_level} administrative level of the given administrative unit - either 0 (national) or 1 (first-level division)
\item \code{parent_id} GAUL code of parent administrative unit of a given polygon (for admin0 polygons, PARENT_ID = 0).
\item \code{country_level} composite \code{country_id}_\code{admn_level} field.
}
}
\description{
\code{as.MAPshp} converts a SpatialPolygon or SpatialPolygonsDataframe object downloaded using getShp into a 'MAPshp object (data.frame) for easy plotting with ggplot.
}
\examples{
#Download shapefiles for Madagascar and visualise these on a map.

\dontrun{
MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
MDG_shp <- as.MAPshp(MDG_shp)
autoplot(MDG_shp)
}

}
\seealso{
\code{\link{autoplot.MAPshp}}

to download rasters directly from MAP.
}
