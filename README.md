
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/murderdata)](http://cran.r-project.org/package=murderdata)

See package webpage her: <https://mikkelkrogsholm.github.io/murderdata/>

murderdata
==========

The goal of murderdata is to make it easy to get data from the [Murder Accountability Project](http://murderdata.org/). With data from the Murder Accountability Project you can determine how often police departments in american communities clear a homicide through arrest using the clearances data. You can also explore individual cases reported to the FBI or obtained by the Murder Accountability Project under local Freedom of Information Acts. Using the supplementary data, you can look for patterns in the occurrence of specific types of homicides and how often police identified the offender. Read more at <http://murderdata.org/>.

Installation
------------

You can install murderdata from github with:

``` r
# install.packages("devtools")
devtools::install_github("mikkelkrogsholm/murderdata")
```

Example
-------

This is a basic example which shows you how to get data:

### Clearences

With data from the Murder Accountability Project you can determine how often police departments in american communities clear a homicide through arrest using the `clearances` data.

``` r
library(murderdata)
dplyr::glimpse(md_clearances)
#> Observations: 156,554
#> Variables: 8
#> $ ori    <chr> "AK00101", "AK00101", "AK00101", "AK00101", "AK00101", ...
#> $ name   <chr> "ANCHORAGE", "ANCHORAGE", "ANCHORAGE", "ANCHORAGE", "AN...
#> $ year   <int> 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1...
#> $ mrd    <int> 7, 18, 1, 7, 7, 7, 4, 9, 6, 11, 7, 15, 13, 16, 16, 15, ...
#> $ clr    <int> 6, 16, 1, 5, 4, 6, 4, 4, 6, 11, 7, 5, 7, 13, 9, 8, 13, ...
#> $ state  <chr> "Alaska", "Alaska", "Alaska", "Alaska", "Alaska", "Alas...
#> $ county <chr> "Anchorage, AK", "Anchorage, AK", "Anchorage, AK", "Anc...
#> $ agency <chr> "Anchorage", "Anchorage", "Anchorage", "Anchorage", "An...
```

### Supplementary

You can also explore individual cases reported to the FBI or obtained by the Murder Accountability Project under local Freedom of Information Acts. Using the `supplementary` data, you can look for patterns in the occurrence of specific types of homicides and how often police identified the offender.

``` r
dplyr::glimpse(md_supplementary)
#> Observations: 751,785
#> Variables: 32
#> $ id           <chr> "197601001AKASP00", "197601001AL00102", "19760100...
#> $ cntyfips     <chr> "Juneau, AK", "Jefferson, AL", "Jefferson, AL", "...
#> $ ori          <chr> "AKASP00", "AL00102", "AL00104", "AL00106", "AL00...
#> $ state        <chr> "Alaska", "Alabama", "Alabama", "Alabama", "Alaba...
#> $ agency       <chr> "State Troopers", "Birmingham", "Fairfield", "Lee...
#> $ agentype     <chr> "Primary state LE", "Municipal police", "Municipa...
#> $ source       <chr> "FBI", "FBI", "FBI", "FBI", "FBI", "FBI", "FBI", ...
#> $ solved       <chr> "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", ...
#> $ year         <int> 1976, 1976, 1976, 1976, 1976, 1976, 1976, 1976, 1...
#> $ statename    <chr> "ALASKA", "ALA", "ALA", "ALA", "ALA", "ALA", "ALA...
#> $ month        <chr> "January", "January", "January", "January", "Janu...
#> $ incident     <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1...
#> $ actiontype   <chr> "Normal update", "Normal update", "Normal update"...
#> $ homicide     <chr> "Murder and non-negligent manslaughter", "Murder ...
#> $ situation    <chr> "Single victim/single offender", "Single victim/s...
#> $ vicage       <chr> "48", "65", "45", "43", "35", "25", "27", "42", "...
#> $ vicsex       <chr> "Male", "Male", "Female", "Male", "Male", "Male",...
#> $ vicrace      <chr> "American Indian or Alaskan Native", "Black", "Bl...
#> $ vicethnic    <chr> "Unknown or not reported", "Unknown or not report...
#> $ offage       <chr> "55", "67", "53", "35", "25", "26", "29", "19", "...
#> $ offsex       <chr> "Female", "Male", "Male", "Female", "Female", "Ma...
#> $ offrace      <chr> "American Indian or Alaskan Native", "Black", "Bl...
#> $ offethnic    <chr> "Unknown or not reported", "Unknown or not report...
#> $ weapon       <chr> "Knife or cutting instrument", "Shotgun", "Shotgu...
#> $ relationship <chr> "Husband", "Acquaintance", "Wife", "Brother", "Ac...
#> $ circumstance <chr> "Other arguments", "Felon killed by private citiz...
#> $ subcircum    <chr> NA, "Felon killed in commission of a crime", NA, ...
#> $ viccount     <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0...
#> $ offcount     <int> 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0...
#> $ filedate     <chr> "030180", "030180", "030180", "030180", "030180",...
#> $ fstate       <chr> "Alaska", "Alabama", "Alabama", "Alabama", "Alaba...
#> $ msa          <chr> "Rural Alaska", "Birmingham-Hoover, AL", "Birming...
```

Further
-------

See the vignette in the package on how to look for serial killers...
