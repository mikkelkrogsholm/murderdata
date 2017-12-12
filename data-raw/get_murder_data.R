

get_murderdata <- function(clearances = TRUE, supplementary = (!clearances)){

  # Set proper URL
  if(clearances) url <- "https://www.dropbox.com/s/zs88zakc03zjxtr/UCR65_16.csv.zip?dl=1"
  if(supplementary) url <- "https://www.dropbox.com/s/vwpyz3cfxwmilk5/SHR76_16.csv.zip?dl=1"

  # Download data
  tmp <- tempfile()
  download.file(url, tmp)
  murder_data <- readr::read_csv(unzip(tmp))

  # return
  murder_data
}
