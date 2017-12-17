
url <- "https://www.dropbox.com/s/xzulxmnzm3mf6bm/SHR.zip?dl=1"
filename <- "data-raw/fbi/fbi_sup.zip"
utils::download.file(url, filename)
unzip(filename, exdir = "data-raw/fbi/fbi_sup")


url <- "https://www.dropbox.com/s/mdonovdamlppf80/ReturnA.zip?dl=1"
filename <- "data-raw/fbi/fbi_all.zip"
utils::download.file(url, filename)
unzip(filename, exdir = "data-raw/fbi/fbi_all")

