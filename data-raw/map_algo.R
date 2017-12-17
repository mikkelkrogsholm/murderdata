library(tidyverse); library(magrittr); library(murderdata); library(stringr)

md_supplementary %>%
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
         percentage <= .33) %>%
  mutate(unsolved = total - solved) %>%
  arrange(desc(unsolved))


glimpse(md_supplementary)
glimpse(md_clearances)
