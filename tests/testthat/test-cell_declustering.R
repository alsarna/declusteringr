testthat::test_that("object length",{
  testthat::expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/inst/points/punkty1.shp')), 50)
  testthat::expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/inst/points/punkty2.shp')), 50)
  testthat::expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/inst/points/punkty3.shp')), 50)
  testthat::expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/inst/points/punkty4.shp')), 200)
  testthat::expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/inst/points/punkty5.shp')), 400)
  testthat::expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/inst/points/punkty6.shp')), 900)
})
