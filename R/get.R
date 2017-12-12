#' Get data from \href{http://murderdata.org}{The Murder Accountability Project}
#'
#' The Murder Accountability Project is a nonprofit group organized in 2015 and
#' dedicated to educate Americans on the importance of accurately accounting for
#' unsolved homicides within the United States. They seek to obtain information
#' from federal, state and local governments about unsolved homicides and to
#' publish this information. The Project’s Board of Directors is composed of
#' retired law enforcement investigators, investigative journalists, criminologists
#' and other experts on various aspects of homicide.
#'
#' With data from the Murder Accountability Project you can determine how often
#' police departments in american communities clear a homicide through arrest using the
#' \code{clearances} data. You can also explore individual cases reported to the
#' FBI or obtained by the Murder Accountability Project under local Freedom of
#' Information Acts. Using the \code{supplementary} data, you can look for patterns in
#' the occurrence of specific types of homicides and how often police identified
#' the offender.
#'
#' Homicide investigators may find this site useful in testing theories about
#' murders in their community. The \code{supplementary} data available is especially
#' useful to test theories about suspects who may have killed across multiple
#' jurisdictions or within the same jurisdiction over a period of time.
#' The \code{supplementary} data is the most complete accounting of homicides available
#' anywhere.
#'
#' @param data_type Do you want the \code{clearences} or the \code{supplementary}
#'     data set? The function defaults to the clearences data set.
#'
#' @return a tibble
#' @export
#'
#' @examples
#' clearances <- get_murderdata()
#' dplyr::glimpse(clearances)
#'
#' supplementary <- get_murderdata("supplementary")
#' dplyr::glimpse(supplementary)
#'
get_murderdata <- function(data_type = c("clearances", "supplementary")){

  # Set proper URL
  if(length(data_type) > 1) data_type = "clearances"


  if(data_type == "clearances") {
    url <- "https://www.dropbox.com/s/zs88zakc03zjxtr/UCR65_16.csv.zip?dl=1"
  }

  if(data_type == "supplementary") {
    url <- "https://www.dropbox.com/s/vwpyz3cfxwmilk5/SHR76_16.csv.zip?dl=1"
  }

  # Download data
  tmp <- base::tempfile(fileext = ".zip")
  utils::download.file(url, tmp)
  murder_data <- readr::read_csv(tmp)

  # return
  murder_data
}

