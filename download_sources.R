library(curl)

zipfile <- tempfile(fileext = ".zip")
tmpfolder <- tempfile()

# Dutch
curl_download(
  "https://github.com/OpenTaal/opentaal-hunspell/raw/master/nl.dic",
  "nl_NL.dic"
)
curl_download(
  "https://raw.githubusercontent.com/OpenTaal/opentaal-hunspell/master/nl.aff",
  "nl_NL.aff"
)

# French
curl_download(
  "http://grammalecte.net/download/fr/hunspell-french-dictionaries-v7.0.zip",
  zipfile
)
dir.create(tmpfolder)
unzip(
  zipfile, files = paste0("fr-classique.", c("aff", "dic")), exdir = tmpfolder
)
file.copy(file.path(tmpfolder, "fr-classique.aff"), "fr_FR.aff")
file.copy(file.path(tmpfolder, "fr-classique.dic"), "fr_FR.dic")

# German
curl_download("https://j3e.de/hunspell/de_DE.zip", zipfile)
unzip(zipfile, files = paste0("de_DE.", c("aff", "dic")), exdir = ".")
