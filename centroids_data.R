library(tidyverse)
library(rvest)
#rvest helps you scrape information from web pages.
#Create an html document from a url with read_html().
#Select parts of a document using CSS selectors: html_nodes(doc, "table td")


url <- "https://developers.google.com/public-data/docs/canonical/states_csv"
states <- read_html(url) %>%
  html_nodes("table") %>%
  html_table()

#[[]] = can extract one element from list or data frame,
#returned object (out of basic object classes) not necessarily list/dataframe

centroids <- states[[1]]
write_csv(centroids, here("data", "centroids.csv"))
