#' Cell Declustering
#'
#' @description Function returns list of points with their weights and lengths from grid cell in spatial object
#'
#' @param spatial_object Object of class sfc or sf
#' @param cellsize Target cellsize in map units
#'
#' @return Object of class sf
#' @export
#'
#' @examples
#' points4 = sf::st_read(system.file("points/punkty4.shp", package = "declusteringr"))
#' x = declstr_weighted(spatial_object = points4, cellsize = 10000)
#' x
declstr_weighted <- function(spatial_object, cellsize){
   if (unique(sf::st_geometry_type(spatial_object)) == "POINT"){
     geom <- sf::st_geometry(spatial_object)
     grid <- sf::st_make_grid(spatial_object, crs = sf::st_crs(spatial_object), cellsize = cellsize)
     intersection <- sf::st_intersects(grid, geom, sparse = TRUE)
     counter <- 0

     lengths <- list()

     for (i in seq_along(intersection)){
       if (length(intersection[[i]] == 0)){
         counter <- counter + 1
       }
       lengths[[i]] <- length(intersection[[i]])
     }

     used_cells <- length(intersection) - counter

     received_weights <- list()

     for (j in seq(intersection)){
       if (length(intersection[[j]]) != 0){
         received_weights[[j]] <- (1 / used_cells * 1 / length(intersection[[j]])) * length(geom)
       }
       else{
         received_weights[[j]] <- 0
       }
     }

     weights_and_lengths <- data.frame(received_weights = unlist(received_weights),
                                       lengths = unlist(lengths))
     df_intersection <- as.data.frame(intersection)
     weights_and_lengths$row.id <- seq_len(nrow(weights_and_lengths))
     weights_and_lengths <- merge(df_intersection, weights_and_lengths, by = "row.id", all.x = TRUE)
     weights_and_lengths <- weights_and_lengths[order(weights_and_lengths$col.id), ]
     spatial_object_decl <- sf::st_sf(data.frame(spatial_object, weights_and_lengths))

     return(spatial_object_decl[-c(2,3)])
   } else if(unique(sf::st_geometry_type(spatial_object)) == "MULTIPOINT"){
      stop("You have to use 'POINT' type of geometry. Use st_cast() function to convert type.")
   } else {
      stop("You have to use 'POINT' type of geometry.")
   }
}
