pacman::p_load(stringr, tidyverse, lubridate)

# Source:
# https://www.vox.com/2016/12/2/13803158/serial-killers-victims-data

reasons <- tribble(
  ~reason, ~percentage,
  "enjoyment", 31.8,
  "financial gain", 30.1,
  "anger", 18.1,
  "multiple", 9.8,
  "gang activity", 6.3,
  "avoid arrest", 1.4,
  "cult", 0.7,
  "hallucinations", 0.7,
  "convenience", 0.6,
  "attention", 0.5
)

sum(reasons$percentage)

methods <- tribble(
  ~method, ~percentage,
  "shot", 43,
  "strangled", 21.7,
  "stabbed", 14.8,
  "bludgeoned", 9.2,
  "poisoned", 7.2,
  "axed", 1.5,
  "drowned", 1,
  "smothered", .6,
  "burned", .6,
  "overdose", .2,
  "run over", .2
)

sum(methods$percentage)

iq <- tribble(
  ~method, ~iq,
  "bomb", 140.3,
  "poison", 100,
  "strangle", 96.7,
  "stab", 92.3,
  "shoot", 90.7,
  "bludgeon", 79.1
)

victim_profiles <- list(
  sex = tribble(
    ~sex, ~percentage,
    "male", 48.6,
    "female", 51.4
  ),
  race = tribble(
    ~race, ~percentage, ~us_census,
    "white", 67, 62,
    "black", 24, 13,
    "hispanic", 7, 17,
    "other", 2, 8
  ),
  age = tribble(
    ~age, ~percentage,
    "00-01", 1.4,
    "01-09", 4.9,
    "10-19", 18.1,
    "20-29", 27,
    "30-39", 17.7,
    "40-49", 11.1,
    "50-59", 7.5,
    "60-69", 5.5,
    "70-79", 3,
    "80+", 3.1
  )
)

victim_profiles$age$percentage %>% sum()

decade_killings <- tibble(
  decade = seq(1900, 2010, by = 10) %>% rep(each = 4),
  victims = rep(c("2","3","4","5+"), 12),
  percentage = c(8, 28, 22, 42, 25, 15, 17, 43, 37, 19, 11, 33, 27, 24, 13, 36,
    32, 25, 11, 32, 39, 15, 8, 38, 29, 28, 16, 27, 34, 19, 16, 31,
    41, 25, 10, 24, 45, 24, 12, 19, 43, 28, 11, 18, 48, 21, 18, 13)
)

decade_killings %>%
  group_by(decade) %>%
  summarise(total = sum(percentage))

