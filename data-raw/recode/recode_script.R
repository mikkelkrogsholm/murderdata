library(tidyverse); library(stringr); library(murderdata)

cntyfips <- read_lines("data-raw/recode/cntyfips.txt")
cntyfips <- str_trim(cntyfips)

out <- cntyfips[3:3205] %>%
  str_split("   ")

ids <- out %>% map(function(x) x[1]) %>% str_replace_all("'", "")
names <- out %>% map_chr(function(x) x[2])

county_lut <- tibble(cntyfips = ids, county = names)

md_supplementary[1:10, ]

md_supplementary$CNTYFIPS %>% unique() %in% cntyfips_lut$county %>% mean()

md_clearances$County %>% unique() %in% cntyfips_lut$county %>% mean()

devtools::use_data(county_lut)
