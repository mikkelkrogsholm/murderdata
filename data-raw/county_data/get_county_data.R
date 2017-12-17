# Urls ----
urls <- c(
  "https://www.ers.usda.gov/webdocs/DataFiles/48747/Unemployment.xls",
  "https://www.ers.usda.gov/webdocs/DataFiles/48747/PopulationEstimates.xls",
  "https://www.ers.usda.gov/webdocs/DataFiles/48747/PovertyEstimates.xls",
  "https://www.ers.usda.gov/webdocs/DataFiles/48747/Education.xls"
  )

names(urls) <- str_c("data_set_", 1:4, ".xls")

walk(1:4, function(i){
  download.file(urls[i], str_c("data-raw/county_data/", names(urls)[i]))
})

# functions ----

change_names <- function(string){
  string <- tolower(string)
  string <- str_replace_all(string, "-", "_")
  string <- str_replace_all(string, " ", "_")
  string <- str_replace_all(string, " ", "_")
  string <- str_replace_all(string, ",", "_")
  string <- str_replace_all(string, "'", "")
  string <- str_replace_all(string, "[()]", "_")
  string <- str_replace_all(string, "(_){2,}", "_")
  string
}

# unemp_income ----
data_set_1_sheets <- readxl::excel_sheets("data-raw/county_data/data_set_1.xls")

data_set_1 <- readxl::read_xls("data-raw/county_data/data_set_1.xls", sheet = 1)
names(data_set_1) <- data_set_1[9, ] %>% unlist()
data_set_1 <- slice(data_set_1, 10:n())
names(data_set_1) <- change_names(names(data_set_1))

data_set_1_desc <- readxl::read_xls("data-raw/county_data/data_set_1.xls", sheet = 2)
data_set_1_desc$Variables <- tolower(data_set_1_desc$Variables)
data_set_1_desc <- data_set_1_desc[1:48, ]
names(data_set_1_desc) <- change_names(names(data_set_1_desc))

data_set_1[] <- map(data_set_1, parse_guess)

unemp_income <- data_set_1

data_set_1_desc$dataset <- "unemp_income"

metadata <- data_set_1_desc

# pop_est ----
data_set_2_sheets <- readxl::excel_sheets("data-raw/county_data/data_set_2.xls")

data_set_2 <- readxl::read_xls("data-raw/county_data/data_set_2.xls", sheet = 1)
names(data_set_2) <- data_set_2[2, ] %>% unlist()
data_set_2 <- slice(data_set_2, 3:n())
names(data_set_2) <- change_names(names(data_set_2))

data_set_2_desc <- readxl::read_xls("data-raw/county_data/data_set_2.xls", sheet = 2)
data_set_2_desc <- data_set_2_desc[3:119, 1:2]
names(data_set_2_desc) <- c(c("variables", "descriptions"))

data_set_2_desc$variables <- change_names(data_set_2_desc$variables)

data_set_2[] <- map(data_set_2, parse_guess)

data_set_2_desc$dataset <- "pop_est"

pop_est <- data_set_2

metadata <- rbind(metadata, data_set_2_desc)


# pov_est ----
data_set_3_sheets <- readxl::excel_sheets("data-raw/county_data/data_set_3.xls")

data_set_3 <- readxl::read_xls("data-raw/county_data/data_set_3.xls", sheet = 1)
names(data_set_3) <- data_set_3[3, ] %>% unlist()
data_set_3 <- slice(data_set_3, 4:n())
names(data_set_3) <- change_names(names(data_set_3))

data_set_3_desc <- readxl::read_xls("data-raw/county_data/data_set_3.xls", sheet = 2)
data_set_3_desc <- data_set_3_desc[1:34, 1:2]
names(data_set_3_desc) <- c(c("variables", "descriptions"))

data_set_3_desc$variables <- change_names(data_set_3_desc$variables)

data_set_3[] <- map(data_set_3, parse_guess)

data_set_3_desc$dataset <- "pov_est"

pov_est <- data_set_3

metadata <- rbind(metadata, data_set_3_desc)

# edu_lvl ----
data_set_4_sheets <- readxl::excel_sheets("data-raw/county_data/data_set_4.xls")

data_set_4 <- readxl::read_xls("data-raw/county_data/data_set_4.xls", sheet = 1)
names(data_set_4) <- data_set_4[4, ] %>% unlist()
data_set_4 <- slice(data_set_4, 5:n())
names(data_set_4) <- change_names(names(data_set_4))

names(data_set_4)[4] <- "rural_urban_continuum_code_2003"
names(data_set_4)[5] <- "urban_influence_code_2003"
names(data_set_4)[6] <- "rural_urban_continuum_code_2003"
names(data_set_4)[7] <- "urban_influence_code_2003"

data_set_4[] <- map(data_set_4, parse_guess)

edu_lvl <- data_set_4


# save data ----
devtools::use_data(unemp_income, pop_est, pov_est, edu_lvl, metadata)
