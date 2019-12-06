library(tidyverse)
library(rvest)
library(janitor)
library(here)
library(xml2)

url <- "https://www.pewforum.org/religious-landscape-study/compare/party-affiliation/by/state/"
tbl <- url %>%
  read_html() %>%
  html_nodes("table") %>%
  html_table()

tbl <- tbl[[1]][-1,] %>%
  mutate_all(tolower) %>%
  select(region = State,
         republican = "Republican/lean Rep.",
         democrat = "Democrat/lean Dem.")

tbl <- tbl %>%
  mutate(republican = parse_number(republican),
         democrat = parse_number(democrat)) %>%
  select(region, republican, democrat)

write_csv(tbl, here("data", "tbl.csv"))