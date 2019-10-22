# punkty i geometria
path <-  'dane/punkty5.shp'
punkty <- sf::st_read(path)
geom <- sf::st_geometry(punkty)
punkty_proj <- sf::st_crs(punkty)


# siatka
grd <- sf::st_make_grid(punkty)
