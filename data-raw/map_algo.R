library(tidyverse); library(magrittr)

murder_data <- md_get_murder_data(supplementary = TRUE)

murder_data %>%
  filter(Year > 2000) %>%
  mutate(Solved = Solved %>% factor() %>% as.numeric() %>% subtract(1)) %>%
  group_by(VicSex, CNTYFIPS, Weapon) %>%
  summarise(total = n(),
            solved = sum(Solved),
            percentage = mean(Solved)) %>%
  ungroup() %>%
  filter(VicSex == "Female",
         percentage <= .33) %>%
  mutate(unsolved = total - solved) %>%
  arrange(desc(unsolved))
