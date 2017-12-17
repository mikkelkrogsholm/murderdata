library(rgdal); library(tidyverse); library(magrittr); library(murderdata); library(stringr)
library(sp); library(rgeos)

cntyfips <- md_supplementary %>%
  pull(CNTYFIPS) %>%
  unique()

safe_geo_code <- safely(ggmap::geocode)

geolocations <- map(cntyfips[2494:length(cntyfips)], function(x) {
  safe_geo_code(x, source = "google")
})

ggmap::geocodeQueryCheck() %>% as.numeric()

geolocations_result <- geolocations %>%
  map_df(~.x$result)

first_run <- geolocations_result
second_run <- readRDS("data-raw/part_geo_result.RDS")

geolocations_result2 <- bind_rows(first_run[1:2493,], second_run)

is.na(first_run$lon) %>% sum()

geolocations_result2$CNTYFIPS <- cntyfips

saveRDS(geolocations_result2, "data-raw/geolocations_result_google.rds")

### Combine and fix
geo_dsk <- readRDS("data-raw/geolocations_result.rds")
geo_gl <- readRDS("data-raw/geolocations_result_google.rds")

# From https://www.census.gov/geo/maps-data/data/cbf/cbf_state.html
counties <- readOGR("data-raw/counties_shape/cb_2016_us_county_20m.shp",
                    layer = "cb_2016_us_county_20m", GDAL1_integer64_policy = TRUE)

map_to_county <- function(geo_df){
  #make a matrix
  coords <- as.matrix(cbind(geo_df$lon, geo_df$lat))

  coords[is.na(coords)] <- 0

  #and into Spatial
  points <- SpatialPoints(coords)

  CRS.new <- CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")

  proj4string(points) <- CRS.new
  proj4string(counties) <- CRS.new

  #get county polygon point is in
  result <- as.character(over(points, counties)$COUNTYNS)

  geo_df$COUNTYNS <- result

  # return
  geo_df %>% as_tibble()
}

geo_dsk_country <- map_to_county(geo_dsk)
geo_gl_country <- map_to_county(geo_gl)

geo_county <- geo_gl_country
geo_missing <- geo_county$COUNTYNS %>% is.na() %>% which()

geo_county[geo_missing, ] <- geo_dsk_country[geo_missing, ]

geo_missing <- geo_county$COUNTYNS %>% is.na() %>% which()

saveRDS(geo_county, "data-raw/geo_county.rds")

md_supplementary_geo <- md_supplementary %>%
  left_join(geo_county)

md_counties <- counties
md_geo_lut <- geo_county

devtools::use_data(md_counties, md_geo_lut, overwrite = T)

###

spts <- SpatialPoints(missing_geo[,1:2])
proj4string(spts) <- CRS.new
nearest_counties <- apply(gDistance(spts, counties, byid = TRUE), 2, min)

nearest_counties %>% as.integer()

counties$NAME[8]

missing_geo <- geolocations_result[is.na(geolocations_result$COUNTYNS), ]

## Set up container for results
missing_points <- SpatialPoints(missing_geo[,1:2])
proj4string(missing_points) <- CRS.new
n <- length(missing_points)
nearest_counties <- character(n)

utmStr <- "+proj=utm +zone=%d +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0"
crs <- CRS(sprintf(utmStr, 32))
counties2 <- spTransform(counties, crs)
missing_points <- spTransform(missing_points, crs)

## For each point, find name of nearest polygon (in this case, Belgian cantons)
for (i in seq_along(nearest_counties)) {
  nearest_counties[i] <- counties$COUNTYNS[which.min(gDistance(missing_points[i,], counties, byid = TRUE))]
}
