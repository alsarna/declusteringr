
<!-- README.md is generated from README.Rmd. Please edit that file -->

# declusteringr

<!-- badges: start -->

<!-- badges: end -->

The goal of declusteringr is to declustering spatial data. This package
offers support for `sf` spatial objects.

## Installation

You can install the released version of declusteringr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("declusteringr")
```

## Examples

This is a basic example of cell declustering:

``` r
library(declusteringr)

gridWeighted(spatial_object = sf::st_read('dane/punkty1.shp'), cellsize = 0.05)
#> Reading layer `punkty1' from data source `C:\Users\Lenovo\Documents\Packages_Functions\declusteringr\dane\punkty1.shp' using driver `ESRI Shapefile'
#> Simple feature collection with 50 features and 1 field
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: -0.8504505 ymin: -0.1315315 xmax: -0.09009009 ymax: 0.5171171
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> although coordinates are longitude/latitude, st_intersects assumes that they are planar
#> Simple feature collection with 50 features and 5 fields
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: -0.8504505 ymin: -0.1315315 xmax: -0.09009009 ymax: 0.5171171
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> First 10 features:
#>    id row.id col.id received_weights lengths                     geometry
#> 40  1    162      1          0.15625       2 POINT (-0.7855856 0.4126126)
#> 42  2    163      2           0.3125       1 POINT (-0.7423423 0.3981982)
#> 41  3    162      3          0.15625       2  POINT (-0.7675676 0.390991)
#> 46  4    180      4           0.3125       1 POINT (-0.6594595 0.4378378)
#> 34  5    135      5           0.3125       1 POINT (-0.5441441 0.2936937)
#> 33  6    133      6           0.3125       1 POINT (-0.6162162 0.3117117)
#> 44  7    169      7           0.3125       1   POINT (-0.436036 0.372973)
#> 35  8    136      8           0.3125       1 POINT (-0.4612613 0.3117117)
#> 27  9    105      9           0.3125       1 POINT (-0.4072072 0.1783784)
#> 47 10    184     10           0.3125       1 POINT (-0.4828829 0.4414414)
```

`gridWeighted` is adding columns row.id - the cell’s number, col.id -
the point’s number, received\_weights - the weight of each cell and
lengths - amounts of each points in cell. `gridWeighted` does not change
amount of features. Weights are calculated according to this pattern:

This is basic example of random
declustering:

``` r
gridRandom(spatial_object = sf::st_read('dane/punkty1.shp'), cellsize = 0.05 , numpoint = 1)
#> Reading layer `punkty1' from data source `C:\Users\Lenovo\Documents\Packages_Functions\declusteringr\dane\punkty1.shp' using driver `ESRI Shapefile'
#> Simple feature collection with 50 features and 1 field
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: -0.8504505 ymin: -0.1315315 xmax: -0.09009009 ymax: 0.5171171
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> although coordinates are longitude/latitude, st_intersects assumes that they are planar
#> Geometry set for 48 features 
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: -0.8504505 ymin: -0.1315315 xmax: -0.09009009 ymax: 0.5171171
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#> First 5 geometries:
#> POINT (-0.4576577 -0.1315315)
#> POINT (-0.418018 -0.1171171)
#> POINT (-0.6234234 -0.04144144)
#> POINT (-0.5261261 -0.04864865)
#> POINT (-0.3567568 -0.07027027)
```

`gridRandom` is choosing random features by specifying some parameters.
`gridRandom` can change amount of features.
