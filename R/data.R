# sk_by_country ----
#' Serial Killers by Country
#'
#' Caution should be taken in reviewing this table as the number of serial killers by country is a function
#' of the number of actual killers, the number caught, and the number reported by police or the media
#'
#' Note: Serial killers operating in multiple countries are not included
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 20 rows and 5 variables:
#' \describe{
#'   \item{country}{Country name}
#'   \item{no_sk}{Number of Serial Killers}
#'   \item{pct_sk}{Percent of Serial Killers}
#'   \item{share_world_pop}{Country's Share of World Population}
#'   \item{ratio}{Ratio}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_by_country"

# sk_by_race_decade ----
#' U.S. Serial Killers Percentage by Race and Decade
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 13 rows and 6 variables:
#' \describe{
#'   \item{decade}{Decade}
#'   \item{white}{White race}
#'   \item{black}{Black race}
#'   \item{hispanic}{Hispanic race}
#'   \item{asian}{Asian race}
#'   \item{native_american}{Native American race}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_by_race_decade"

# sk_definition_of ----
#' Number of Separate Serial Killers Operating in a Given Year in the U.S.
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 95 rows and 3 variables:
#' \describe{
#'   \item{year}{year}
#'   \item{two_or_more}{Definition of having 2 or more victims}
#'   \item{three_or_more}{Definition of having 3 or more victims}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_definition_of"

# sk_frequency_by_decade ----
#' Serial Killer Frequency by Decade (Decade of First Kill)
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 12 rows and 4 variables:
#' \describe{
#'   \item{decade}{Decade}
#'   \item{us}{In the united states only}
#'   \item{international}{Outside of the united states}
#'   \item{total}{US and International}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_frequency_by_decade"

# sk_gender_decade_all ----
#' Frequency of Serial Killers Gender by Decade: U.S. and International
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 24 rows and 4 variables:
#' \describe{
#'   \item{decade}{Decade}
#'   \item{gender}{Gender of serial killers}
#'   \item{n}{Total count}
#'   \item{percent}{Percentage}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_gender_decade_all"

# sk_gender_decade_intl ----
#' Frequency of Serial Killers Gender by Decade: International Only
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 24 rows and 4 variables:
#' \describe{
#'   \item{decade}{Decade}
#'   \item{gender}{Gender of serial killers}
#'   \item{n}{Total count}
#'   \item{percent}{Percentage}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_gender_decade_intl"

# sk_gender_decade_us ----
#' Frequency of Serial Killers Gender by Decade: United States Only
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 24 rows and 4 variables:
#' \describe{
#'   \item{decade}{Decade}
#'   \item{gender}{Gender of serial killers}
#'   \item{n}{Total count}
#'   \item{percent}{Percentage}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_gender_decade_us"

# sk_iq_detailed ----
#' Serial Killer IQ - detailed
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 24 rows and 4 variables:
#' \describe{
#'   \item{area}{Overall area pertaining to the serial killer}
#'   \item{variable}{Variable connected to area}
#'   \item{n}{Total count}
#'   \item{iq}{IQ}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_iq_detailed"

# sk_iq_overview ----
#' Serial Killer IQ - overview
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 5 rows and 3 variables:
#' \describe{
#'   \item{area}{Overall area pertaining to the serial killer}
#'   \item{variable}{Variable connected to area}
#'   \item{iq}{IQ}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_iq_overview"

# sk_method ----
#' Method by Which Victim Was Killed
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 12 rows and 3 variables:
#' \describe{
#'   \item{method}{Method of Death}
#'   \item{n}{Total count}
#'   \item{pct}{Percentage}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_method"

# sk_motives ----
#' Broad Motives
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 10 rows and 7 variables:
#' \describe{
#'   \item{motive}{Motive of the serial killer}
#'   \item{n}{Total count}
#'   \item{percentage}{Percentage}
#'   \item{white}{White race, US only}
#'   \item{black}{Black race, US only}
#'   \item{hisp}{Hispanic race, US only}
#'   \item{asian}{Asian race, US only}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_motives"

# sk_victims_demographics ----
#' Characteristics of U.S. Serial Killer Victims
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 116 rows and 4 variables:
#' \describe{
#'   \item{variable}{Overarching demographic variable}
#'   \item{value}{Value of overarching demographic variable}
#'   \item{n}{Total count}
#'   \item{pct}{Percentage}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_victims_demographics"

# sk_victims_state ----
#' Victims By State
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 51 rows and 5 variables:
#' \describe{
#'   \item{state}{US state}
#'   \item{n}{Total count}
#'   \item{victim_rank}{Rank by victim count}
#'   \item{pop_rank}{Rank by population}
#'   \item{diffence}{Difference between victim rank and population rank}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_victims_state"

# sk_victims_yearly ----
#' Number of Serial Killer Victims by Year
#'
#' Note: The numbers for 2014 and 2015 should be interpreted with caution as
#' there is normally a lag between a murder and the identification of the serial killer.
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 116 rows and 3 variables:
#' \describe{
#'   \item{year}{Year of the murder}
#'   \item{us}{Count for the United States}
#'   \item{canada}{Count for Canada}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_victims_yearly"

# sk_yearly_avg_by_decade ----
#' Definition of Serial Killer by Decade
#'
#' Aamodt, M. G. (2015, November 23). Serial killer statistics. Retrieved (2017-12-12)
#' from http://maamodt.asp.radford.edu/serial killer information center/project description.htm
#'
#' @format A tibble with 7 rows and 3 variables:
#' \describe{
#'   \item{decade}{Decade}
#'   \item{two_or_more}{Definition of having 2 or more victims}
#'   \item{three_or_more}{Definition of having 3 or more victims}
#' }
#' @source Radford University/FGCU Serial Killer Database
"sk_yearly_avg_by_decade"
