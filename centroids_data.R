library(tidyverse)
library(rvest)

url <- "https://developers.google.com/public-data/docs/canonical/states_csv"
states <- read_html(url) %>%
  html_nodes("table") %>%
  html_table()

centroids <- states[[1]]
write_csv(centroids, here("data", "centroids.csv"))
