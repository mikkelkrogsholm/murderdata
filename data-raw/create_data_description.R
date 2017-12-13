data_files <- list.files("data")


data_file <- data_files[5]
dir <- "data"

description <- "Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12) from http://maamodt.asp.radford.edu/serial killer information center/project description.htm"

describe_dfs <- function(data_file, dir, description = NULL){

  data_name <- data_file %>% str_replace_all(".rda", "")

  load(paste0(dir, "/", data_file))
  df <- get(data_name)
  rows <- nrow(df)
  cols <- ncol(df)

  item_string <- "#'   \\item{%s}{description}"

  insert_items <- map(names(df), function(name) sprintf(item_string, name)) %>%
    unlist() %>%
    paste(collapse = "\n")

  string <- paste0(
    "# %s ----
#' Title
#'
#' Description
#'
#' @format A tibble with %1.0f rows and %1.0f variables:
#' \\describe{ \n",
    insert_items, "
#' }
#' @source \\url{http://skdb.fgcu.edu/public}
\"%s\""
  )

  if(!is.null(description)) {
    string <- string %>% str_replace("Description", description)
      }


  out <- sprintf(string, data_name, rows, cols, data_name)

  out
}

describe_dfs(data_file, "data", description)  %>% cat()

data_files %>%
  map(describe_dfs, "data", description) %>%
  unlist() %>%
  paste0(collapse = "\n\n") %>%
  cat()

