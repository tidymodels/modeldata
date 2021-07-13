## code to prepare `tate_text`

library(tidyverse)
artwork <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-12/artwork.csv')

tate_text <- artwork %>%
  filter(year > 1980, artistRole == "artist") %>%
  select(id, artist, title, medium, year) %>%
  mutate(across(c(artist, medium), as.factor))

usethis::use_data(tate_text, overwrite = TRUE)
