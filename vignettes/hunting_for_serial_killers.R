## ----libs, message=FALSE, warning=FALSE----------------------------------
library(murderdata)
library(dplyr)
library(magrittr)

## ----get_data, message=FALSE, warning=FALSE------------------------------
murder_data <- get_murderdata("supplementary")

## ----serial_killers------------------------------------------------------
serial_killers <- murder_data %>%
  mutate(Solved = Solved %>% factor() %>% as.numeric() %>% subtract(1)) %>%
  group_by(VicSex, CNTYFIPS, Weapon) %>%
  summarise(total = n(),
            solved = sum(Solved),
            percentage = mean(Solved)) %>%
  ungroup() 

## ----possible_serial_killers---------------------------------------------
possible_serial_killers <- serial_killers %>%
  filter(VicSex == "Female",
         percentage <= .33) %>%
  mutate(unsolved = total - solved) %>%
  arrange(desc(unsolved))

## ----summary-------------------------------------------------------------
possible_serial_killers %>% select(-VicSex) %>% head() %>% knitr::kable()

