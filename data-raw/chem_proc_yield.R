library(tidymodels)
library(janitor)
library(AppliedPredictiveModeling)

# ------------------------------------------------------------------------------

tidymodels_prefer()
theme_set(theme_bw())
options(pillar.advice = FALSE, pillar.min_title_chars = Inf)

# ------------------------------------------------------------------------------

data(ChemicalManufacturingProcess)

chem_proc_yield <-
  ChemicalManufacturingProcess %>%
  clean_names() %>%
  rename_with(
    .cols = starts_with("manufacturing_process"),
    ~ gsub("manufacturing_process", "man_proc_", .x)
  ) %>%
  rename_with(
    .cols = starts_with("biological_material"),
    ~ gsub("biological_material", "bio_material_", .x)
  ) %>%
  as_tibble()

# ------------------------------------------------------------------------------

usethis::use_data(chem_proc_yield)
