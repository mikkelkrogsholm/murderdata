
library(tidyverse); library(lubridate); library(stringr)

murderdata <- get_murderdata(case_level = TRUE)

plotdata <- murder_data %>%
  filter(VicSex != "Unknown", OffSex != "Unknown") %>%
  mutate(VicOffSex = paste0(str_sub(VicSex, 1, 1), str_sub(OffSex, 1, 1))) %>%
  group_by(Year, Month, VicOffSex) %>%
  count() %>%
  ungroup() %>%
  mutate(date = paste(Year, Month, "15") %>% ymd())


ggplot(plotdata) +
  geom_line(aes(date, log(n), color = VicOffSex))
