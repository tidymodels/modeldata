library(tidymodels)
library(janitor)
library(AppliedPredictiveModeling)

# ------------------------------------------------------------------------------

tidymodels_prefer()
theme_set(theme_bw())
options(pillar.advice = FALSE, pillar.min_title_chars = Inf)

# ------------------------------------------------------------------------------

data(hepatic)

names(bio) <- recipes::names0(ncol(bio), "bio_assay_")
names(chem) <- recipes::names0(ncol(chem), "chem_fp_")

hepatic_injury_qsar <-
  bind_cols(bio, chem) %>%
  mutate(
    class = as.character(injury),
    class = factor(class, ordered = TRUE, levels = levels(injury))
  ) %>%
  as_tibble() %>%
  relocate(class)

# ------------------------------------------------------------------------------

usethis::use_data(hepatic_injury_qsar, overwrite = TRUE)
