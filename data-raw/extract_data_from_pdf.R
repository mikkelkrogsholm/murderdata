# source: http://skdb.fgcu.edu/public/Serial%20Killer%20Statistics%2023NOV2015.pdf

# Read in data ----
library(googlesheets)
sk_data <- gs_key("1RvrC3KOv0w28oAjVTBusJsUh4BK13J1hFDa5vYDs-kM")
ws <- sk_data$ws
sk_ws <- map(1:sk_data$n_ws, safely(function(i) {
  Sys.sleep(7)
  gs_read(sk_data, ws = i)
  }))

sk_ws_good <- sk_ws %>% map(~.x$result)
names(sk_ws_good) <- gs_ws_ls(sk_data)

# Fix tables ----
pacman::p_load(tidyverse, stringr, lubridate, magrittr)

sk_frequency_by_decade <- sk_ws_good$sk_freq_decade

sk_definition_of <- sk_ws_good$sep_killings_year
names(sk_definition_of) %<>%
  str_replace_all("2", "two") %>%
  str_replace_all("3", "three") %>%
  str_replace_all(" ", "_")

sk_yearly_avg_by_decade <- sk_ws_good$avg_decade
names(sk_yearly_avg_by_decade) %<>%
  str_replace_all("2", "two") %>%
  str_replace_all("3", "three") %>%
  str_replace_all(" ", "_")

sk_by_race_decade <- sk_ws_good$by_race

sk_gender_decade_all <- sk_ws_good$gender_decade_all

sk_gender_decade_us <- sk_ws_good$gender_decade_us

sk_gender_decade_intl <- sk_ws_good$gender_decade_intl

sk_motives <- sk_ws_good$reason
names(sk_motives) %<>% str_to_lower()

sk_motives[,3:7] <- sapply(sk_motives[,3:7], function(x){
  x %>% str_replace_all("%", "") %>% as.numeric()
})

sk_iq_detailed <- sk_ws_good$iq_detailed %>% select(1:4)
names(sk_iq_detailed) %<>% str_to_lower()

sk_iq_overview <- sk_ws_good$iq_overview
names(sk_iq_overview) %<>% str_to_lower()

sk_by_country <- sk_ws_good$by_country
names(sk_by_country) <- c("country", "no_sk", "pct_sk", "share_world_pop", "ratio")
sk_by_country$share_world_pop %<>% str_replace_all("%", "") %>% as.numeric()

sk_victims_demographics <- sk_ws_good$victims_us
names(sk_victims_demographics) <- c("variable", "value", "n", "pct")
sk_victims_demographics$pct %<>% str_replace_all("%", "") %>% as.numeric()

sk_victims_state <- sk_ws_good$victims_state
names(sk_victims_state) <- c("state", "n", "victim_rank", "pop_rank", "diffence")

sk_method <- sk_ws_good$method
names(sk_method) <- c("method", "n", "pct")
sk_method$pct %<>% str_replace_all("%", "") %>% as.numeric()

sk_victims_yearly <- sk_ws_good$per_year
names(sk_victims_yearly) %<>% str_to_lower()

# Use data ----

devtools::use_data(
  sk_frequency_by_decade,
  sk_definition_of,
  sk_yearly_avg_by_decade,
  sk_by_race_decade,
  sk_gender_decade_all,
  sk_gender_decade_us,
  sk_gender_decade_intl,
  sk_motives,
  sk_iq_detailed,
  sk_iq_overview,
  sk_by_country,
  sk_victims_demographics,
  sk_victims_state,
  sk_method,
  sk_victims_yearly,
  overwrite = TRUE
)
