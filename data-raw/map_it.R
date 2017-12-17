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

murders <- murders %>% distinct(COUNTYNS, .keep_all = TRUE) %>%
  filter(Weapon == "Handgun - pistol, revolver, etc")

geo <- md_counties
geo_data <- geo@data
geo_data$COUNTYNS %<>% as.character()

murder_geo <- murders %>% left_join(md_geo_lut)

geo_data$COUNTYNS %>% n_distinct()

geo_data <- geo_data %>%
  left_join(murder_geo, by = "COUNTYNS") %>%
  distinct(COUNTYNS, .keep_all = TRUE)

geo@data <- geo_data

###
library(leaflet)

pal <- colorNumeric("YlOrRd", NULL)

geo_data$unsolved %>% range(na.rm = T)

leaflet(geo) %>%
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              popup = ~unsolved,
              opacity = 1.0, fillOpacity = 1,
              fillColor = ~pal(unsolved),
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE))
