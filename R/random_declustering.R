#' Random Declustering
#'
#' @description Function for random points selection from grid cells in a spatial object
#'
#' @param spatial_object Object of class sfc or sf
#' @param cellsize Target cellsize in map units
#' @param numpoints Number of points that will be chosen from a grid cell
#'
#' @return Object of class sf
#' @export
declstr_random <- function(spatial_object, cellsize, numpoints){
  if (unique(sf::st_geometry_type(spatial_object)) == "POINT"){
    geom <- sf::st_geometry(spatial_object)
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
  } else {
    stop("You have to use 'POINT' type of geometry.")
  }
}
