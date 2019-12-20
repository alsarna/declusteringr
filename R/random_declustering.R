#' Random Declustering
#'
#' @description Function for random points selection from grid cells in a spatial object
#'
#' @param spatial_object Object of class sfc or sf
#' @param cellsize Definition of grid cell
#' @param numpoints Number of points that will be chosen from a grid cell
#'
#' @return Object of class sf
#' @export
declstr_random <- function(spatial_object, cellsize, numpoints){
  geom <- sf::st_geometry(spatial_object)
  proj <- sf::st_crs(spatial_object)
  grid <- sf::st_make_grid(spatial_object, crs = sf::st_crs(spatial_object), cellsize = cellsize)
  intersection <- sf::st_intersects(grid, geom, sparse = TRUE)

  for (i in seq_along(intersection)){
    if (numpoints < length(intersection[[i]])){
      if (length(intersection[[i]]) > 0){
        x <- intersection[[i]][sample(seq_along(intersection[[i]]), size = numpoints)]
        intersection[[i]] <- x
      }
    } else {
      x <- intersection[[i]][sample(seq_along(intersection[[i]]), size = length(intersection[[i]]))]
      intersection[[i]] <- x
    }
  unlisted = unlist(intersection)
  sf_object = geom[unlisted]
  }
  return(sf::st_sf(geom = sf_object))
}
