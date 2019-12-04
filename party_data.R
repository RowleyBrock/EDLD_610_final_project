library(tidyverse)
library(rvest)

url <- "https://en.wikipedia.org/wiki/Political_party_strength_in_U.S._states"
states <- read_html(url) %>%
  html_nodes("table") %>%
  html_table()
party <- states[[4]] %>%
  clean_names() %>%
  mutate_all(tolower)
write_csv(party, here("data", "party.csv"))

head(party)
party <- party %>%
  select(state, partisan = partisan_split_as_of_2017_update) %>%
  separate(partisan, c("politic_perc","other_perc"), sep = "-")


