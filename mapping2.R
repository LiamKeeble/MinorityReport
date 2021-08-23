library(ggmap)
library(tidyverse)
path <- get_scriptpath()


# api key ####
api <- readLines("path/../../google.api")
register_google(key = api)