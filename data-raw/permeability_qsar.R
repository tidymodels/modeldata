library(tidymodels)
library(janitor)
library(AppliedPredictiveModeling)

# ------------------------------------------------------------------------------

tidymodels_prefer()
theme_set(theme_bw())
options(pillar.advice = FALSE, pillar.min_title_chars = Inf)

# ------------------------------------------------------------------------------

data("permeability")

fingerprints <- as.data.frame(fingerprints)

names(fingerprints) <- recipes::names0(ncol(fingerprints), "chem_fp_")

permeability_qsar <-
  fingerprints %>%
  mutate(
    permeability = permeability[, 1]
  ) %>%
  as_tibble() %>%
  relocate(permeability)

# ------------------------------------------------------------------------------

usethis::use_data(permeability_qsar)
