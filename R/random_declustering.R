#' Random Points Choice From Grid Cell
#'
#' @description Function for random points choice from grid cell in spatial object
#'
#' @param spatial_object Object of class sfc
#' @param cellsize Definition of grid cell
#' @param numpoints Number of points that will be chosen from a grid cell
#'
#' @return Object of class sfc
#' @export


gridRandom <- function(spatial_object, cellsize, numpoints){
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
  return(sf_object)
}
