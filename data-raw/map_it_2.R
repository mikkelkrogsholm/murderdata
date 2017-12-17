library(tidyverse); library(magrittr); library(murderdata); library(stringr)

murders <- md_supplementary %>%
  filter(Year >= 2000) %>%
  mutate(Solved = Solved %>% factor() %>% as.numeric() %>% subtract(1)) %>%
  mutate(VicAgeGrp = VicAge %>%
           str_replace_all("Newborn or infant", "0") %>%
           as.numeric() %>%
           cut(breaks = seq(0, 100, by = 10), include.lowest = TRUE)) %>%
  group_by(VicAgeGrp, VicSex, CNTYFIPS, Weapon) %>%
  summarise(total = n(),
            solved = sum(Solved),
            percentage = mean(Solved)) %>%
  ungroup() %>%
  filter(VicSex == "Female",
         VicAgeGrp %in% c("(10,20]", "(20,30]")) %>%
  group_by(CNTYFIPS) %>%
  summarise(total = sum(total),
            solved = sum(solved),
            percentage = solved / total) %>%
  mutate(unsolved = total - solved) %>%
  filter(unsolved > 2,
         percentage <= .5,) %>%
  arrange(desc(unsolved))

geo_data <- md_counties_shp@data

geo_data <- geo_data %>%
  left_join(county_lut, by = c("GEOID" = "cntyfips"))

geo_data <- geo_data %>%
  left_join(., murders, by = c("county" = "CNTYFIPS"))

library(leaflet)


geo <- md_counties_shp
geo@data <- geo_data

pal <- colorNumeric("YlOrRd", NULL)

geo$unsolved %>% range(na.rm = T)

my_popup <- str_c(
  "<strong>County:</strong> ", geo@data$county, "<br>",
  "<strong>Unsolved:</strong> ", ifelse(is.na(geo@data$unsolved), 0, geo@data$unsolved)
)

leaflet(geo) %>%
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              popup = my_popup,
              opacity = 1.0, fillOpacity = 1,
              fillColor = ~pal(unsolved),
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE))
