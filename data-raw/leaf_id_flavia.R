library(tidymodels)
library(janitor)
library(readr)

# ------------------------------------------------------------------------------

tidymodels_prefer()
theme_set(theme_bw())
options(pillar.advice = FALSE, pillar.min_title_chars = Inf)

# ------------------------------------------------------------------------------

flavia_url <-
  "https://github.com/SMART-Research/leaffeatures_paper/raw/65ffd8c8b926b8df3f499c9224d6073975db5c3c/data_all_with_label_flavia_with_species.csv"

leaf_id_flavia <-
  read_csv(flavia_url) %>%
  clean_names() %>%
  mutate(
    species = gsub("([[:punct:]])|([[:space:]])", "_", tolower(species)),
    shape = tolower(shape_label),
    apex = if_else(!is.na(apex), tolower(apex), "none"),
    base = if_else(!is.na(base), tolower(base), "none"),
    edge_type = tolower(edge_type),
    edge_type_2 = tolower(edge_type_2),
    edge_type_2 = ifelse(is.na(edge_type_2), "", edge_type_2),
    edges = map2_chr(edge_type, edge_type_2, ~ paste(.x, .y, sep = "_")),
    edges = gsub("_$", "", edges),
    denate_edge = ifelse(
      edge_type == "denate" | edge_type_2 == "denate",
      "yes",
      "no"
    ),
    lobed_edge = ifelse(
      edge_type == "lobed" | edge_type_2 == "lobed",
      "yes",
      "no"
    ),
    smooth_edge = ifelse(
      edge_type == "smooth" | edge_type_2 == "smooth",
      "yes",
      "no"
    ),
    toothed_edge = ifelse(
      edge_type == "toothed" | edge_type_2 == "toothed",
      "yes",
      "no"
    ),
    undulate_edge = ifelse(
      edge_type == "undulate" | edge_type_2 == "undulate",
      "yes",
      "no"
    ),
    across(where(is.character), factor)
  ) %>%
  select(-id, -cx, -cy, -shape_label, -edges, -edge_type_2, -edge_type) %>%
  rename(narrow_factor = nf) %>%
  rename_with(~ gsub("_g_", "_green_", .x)) %>%
  rename_with(~ gsub("_b_", "_blue_", .x)) %>%
  rename_with(~ gsub("_r_", "_red_", .x)) %>%
  rename_with(~ gsub("^no_of_", "num_", .x)) %>%
  relocate(
    species,
    apex,
    base,
    shape,
    denate_edge,
    lobed_edge,
    smooth_edge,
    toothed_edge,
    undulate_edge
  )

# ------------------------------------------------------------------------------

usethis::use_data(leaf_id_flavia)
