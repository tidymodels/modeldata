library(tidymodels)
library(janitor)
library(readr)

# ------------------------------------------------------------------------------

tidymodels_prefer()
theme_set(theme_bw())
options(pillar.advice = FALSE, pillar.min_title_chars = Inf)

# ------------------------------------------------------------------------------

steroidogenic_toxicity <-
  read_delim(
    "https://github.com/topepo/steroidogenic_tox/raw/master/data.txt",
    delim = "\t"
  ) %>%
  clean_names() %>%
  rename_with(~ gsub("cyp", "cyp_", .x)) %>%
  select(-compound) %>%
  mutate(class = factor(class, levels = c("toxic", "nontoxic")))

# ------------------------------------------------------------------------------

usethis::use_data(steroidogenic_toxicity, overwrite = TRUE)
