points1 = sf::st_read(system.file("points/punkty1.shp", package = "declusteringr"))
points2 = sf::st_read(system.file("points/punkty2.shp", package = "declusteringr"))
points3 = sf::st_read(system.file("points/punkty3.shp", package = "declusteringr"))
points4 = sf::st_read(system.file("points/punkty4.shp", package = "declusteringr"))
points5 = sf::st_read(system.file("points/punkty5.shp", package = "declusteringr"))
points6 = sf::st_read(system.file("points/punkty6.shp", package = "declusteringr"))

testthat::test_that("object length",{
  testthat::expect_length(sf::st_geometry(points1), 50)
  testthat::expect_length(sf::st_geometry(points2), 50)
  testthat::expect_length(sf::st_geometry(points3), 50)
  testthat::expect_length(sf::st_geometry(points4), 200)
  testthat::expect_length(sf::st_geometry(points5), 400)
  testthat::expect_length(sf::st_geometry(points6), 900)
})

testthat::test_that("checking type",{
  testthat::expect_type(points1, "list")
  testthat::expect_type(points2, "list")
  testthat::expect_type(points3, "list")
  testthat::expect_type(points4, "list")
  testthat::expect_type(points5, "list")
  testthat::expect_type(points6, "list")
})

testthat::test_that("checking class of object",{
  testthat::expect_is(points1, "sf")
  testthat::expect_is(points2, "sf")
  testthat::expect_is(points3, "sf")
  testthat::expect_is(points4, "sf")
  testthat::expect_is(points5, "sf")
  testthat::expect_is(points6, "sf")
})

testthat::test_that("checking geometry errors",{
  test_linestring <-  sf::st_read(system.file("points/linestring.shp", package = "declusteringr"))
  test_polygon <-  sf::st_read(system.file("points/polygon.shp", package = "declusteringr"))
  test_multipoint <- sf::st_read(system.file("points/multipoint.shp", package = "declusteringr"))

})
