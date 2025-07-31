## code to prepare `taxi` dataset goes here

library(tidyverse)
library(tidymodels)
library(janitor)

# https://data.cityofchicago.org/Transportation/Taxi-Trips-2022/npd7-ywjz
taxi_raw <- read_csv(
  "https://data.cityofchicago.org/api/views/e55j-2ewb/rows.csv?accessType=DOWNLOAD"
) |>
  clean_names()

set.seed(1234)

taxi_med <- taxi_raw |>
  filter(!is.na(tips), payment_type != "Cash") |>
  drop_na() |>
  slice_sample(n = 20000) |>
  mutate(
    tip = if_else(tips > 0, "yes", "no") |> factor(levels = c("yes", "no")),
    trip_start = mdy_hms(trip_start_timestamp),
    local = if_else(
      pickup_community_area == dropoff_community_area,
      "yes",
      "no"
    ) |>
      factor(levels = c("yes", "no")),
    pickup_community_area = factor(pickup_community_area),
    dropoff_community_area = factor(dropoff_community_area)
  )

taxi_rec_base <- recipe(tip ~ ., data = taxi_med) |>
  step_date(
    trip_start,
    features = c("dow", "month"),
    keep_original_cols = TRUE
  ) |>
  step_time(
    trip_start,
    features = c("hour", "minute"),
    keep_original_cols = TRUE
  ) |>
  step_other(company) |>
  step_rm(
    trip_start_timestamp,
    trip_end_timestamp,
    taxi_id,
    tips,
    trip_start,
    trip_start_minute,
    contains("census"),
    contains("centroid"),
    contains("community_area")
  ) %>%
  step_rename(
    id := trip_id,
    duration = trip_seconds,
    distance = trip_miles,
    total_cost = trip_total,
    dow = trip_start_dow,
    month = trip_start_month,
    hour = trip_start_hour
  )

taxi <- prep(taxi_rec_base) |>
  bake(new_data = NULL) |>
  relocate(tip)

taxi <- taxi |>
  mutate(month = factor(month, levels = c("Jan", "Feb", "Mar", "Apr"))) |>
  select(-c(id, duration, fare, tolls, extras, total_cost, payment_type)) |>
  drop_na() |>
  slice_sample(n = 10000)

usethis::use_data(taxi, overwrite = TRUE)
