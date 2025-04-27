library(tidymodels)
library(janitor)
library(forcats)

# ------------------------------------------------------------------------------

tidymodels_prefer()
theme_set(theme_bw())
options(pillar.advice = FALSE, pillar.min_title_chars = Inf)

# ------------------------------------------------------------------------------

load(url(
  "https://github.com/topepo/FES/raw/06812c48a21882808403cee338b8312fdbd35a46/Data_Sets/Ischemic_Stroke/stroke_data.RData"
))

ischemic_stroke <-
  bind_rows(stroke_train, stroke_test) %>%
  clean_names() %>%
  rename(male = sex, nascet_scale = nascet) %>%
  mutate(
    stroke = ifelse(stroke == "Y", "yes", "no"),
    stroke = factor(stroke, levels = c("yes", "no"))
  ) %>%
  as_tibble()

# ------------------------------------------------------------------------------

usethis::use_data(ischemic_stroke)
