test_that("object length",{
  expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/data/punkty1.shp')), 50)
  expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/data/punkty2.shp')), 50)
  expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/data/punkty3.shp')), 50)
  expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/data/punkty4.shp')), 200)
  expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/data/punkty5.shp')), 400)
  expect_length(sf::st_geometry(sf::st_read('C:/Users/Lenovo/Documents/Packages_Functions/declusteringr/data/punkty6.shp')), 900)
})
