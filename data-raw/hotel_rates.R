library(tidymodels)
library(readr)
library(janitor)
library(textrecipes)
library(lubridate)
library(randomNames)

# ------------------------------------------------------------------------------

tidymodels_prefer()
options(pillar.advice = FALSE, pillar.min_title_chars = Inf)

# ------------------------------------------------------------------------------

# See "Hotel booking demand datasets"
# https://scholar.google.com/scholar?hl=en&as_sdt=0%2C7&q=%22Hotel+booking+demand+datasets%22
hotel_raw <-
  readr::read_csv(
    "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-11/hotels.csv"
  ) %>%
  as_tibble() %>%
  mutate(
    arrival_date = paste(
      arrival_date_year,
      arrival_date_month,
      arrival_date_day_of_month,
      sep = "_"
    ),
    arrival_date = ymd(arrival_date),
    arrival_date_num = decimal_date(arrival_date),

    market_segment = gsub(
      "TA/TO",
      "_travel_agent",
      market_segment,
      fixed = TRUE
    ),
    market_segment = gsub("TA", "_travel_agent", market_segment),
    market_segment = gsub("[[:space:]]", "", market_segment),

    meal = case_when(
      meal == "BB" ~ "Bed and Breakfast",
      meal == "HB" ~ "breakfast and one other meal",
      meal == "FB" ~ "breakfast lunch and dinner",
      TRUE ~ "no meal package"
    ),

    near_christmas = arrival_date_month == "December" &
      arrival_date_day_of_month <= 26 &
      arrival_date_day_of_month >= 24,
    near_christmas = as.numeric(near_christmas),
    near_new_years = (arrival_date_month == "December" &
      arrival_date_day_of_month >= 30) |
      (arrival_date_month == "January" & arrival_date_day_of_month <= 2),
    near_new_years = as.numeric(near_new_years)
  )

# ------------------------------------------------------------------------------
# instead of codes, use random names for agents and companies. Stratify by
# ethnicity to avoid overlap

agents <- tibble(agent = unique(hotel_raw$agent))

set.seed(1)
agents$fake_name <-
  randomNames(
    nrow(agents),
    name.order = "first.last",
    name.sep = "_",
    ethnicity = c(1:2, 4:6), # reserve 3 for company names
    sample.with.replacement = FALSE
  )
agents$fake_name <- gsub("[[:punct:]]", "_", tolower(agents$fake_name))
agents$fake_name <- gsub("[[:space:]]", "_", tolower(agents$fake_name))
agents$fake_name[agents$agent == "NULL"] <- "not_applicable"

hotel_raw <-
  left_join(hotel_raw, agents, by = "agent") %>%
  mutate(agent = fake_name) %>%
  select(-fake_name)

###

companies <- tibble(company = unique(hotel_raw$company))

set.seed(2)
companies$fake_name <-
  randomNames(
    nrow(companies),
    ethnicity = 3,
    which.names = "last",
    sample.with.replacement = FALSE
  )
companies$fake_name <- gsub("[[:punct:]]", "_", tolower(companies$fake_name))
companies$fake_name <- gsub("[[:space:]]", "_", tolower(companies$fake_name))
types <- c("_llc", "_inc", "_and_company", "_pbc")
types <- sample(types, nrow(companies), replace = TRUE)
companies$fake_name <- paste0(companies$fake_name, types)
companies$fake_name[companies$company == "NULL"] <- "not_applicable"

hotel_raw <-
  left_join(hotel_raw, companies, by = "company") %>%
  mutate(company = fake_name) %>%
  select(-fake_name)

# ------------------------------------------------------------------------------
# version for regression analysis

hotel_rates_all <-
  hotel_raw %>%
  filter(
    is_canceled == 0 &
      adr > 15 &
      adr < 2000 &
      hotel == "Resort Hotel" &
      reservation_status == "Check-Out" &
      deposit_type == "No Deposit" &
      !(market_segment %in% c("Complementary", "Undefined"))
  ) %>%
  select(
    -reservation_status,
    -is_canceled,
    avg_price_per_room = adr,
    -reservation_status_date,
    -hotel,
    -arrival_date_month,
    -deposit_type
  ) %>%
  mutate(year_day = yday(arrival_date)) %>%
  relocate(avg_price_per_room) %>%
  recipe() %>%
  step_clean_levels(all_nominal()) %>%
  prep() %>%
  bake(new_data = NULL)

# ------------------------------------------------------------------------------
# pull off first year of data to compute historical ADR by day

year_2016_data <-
  hotel_rates_all %>%
  filter(arrival_date <= min(arrival_date) + years(1))

year_2016_stats <-
  year_2016_data %>%
  summarize(
    hist_adr_raw = mean(avg_price_per_room),
    hist_bookings = n(),
    .by = year_day
  ) %>%
  arrange(year_day)

year_2016_stats$historical_adr <-
  loess(
    hist_adr_raw ~ year_day,
    data = year_2016_stats,
    span = .1,
    degree = 2
  )$fitted

# Add a value for the leap year
year_2016_stats_leap <-
  tibble(
    year_day = 366,
    historical_adr = year_2016_stats$hist_adr_raw[nrow(year_2016_stats)]
  )

year_2016_stats <-
  bind_rows(year_2016_stats, year_2016_stats_leap) %>%
  select(year_day, historical_adr)

hotel_rates <-
  hotel_rates_all %>%
  filter(arrival_date > min(arrival_date) + years(1)) %>%
  left_join(year_2016_stats, by = "year_day") %>%
  arrange(arrival_date) %>%
  select(
    -arrival_date_year,
    -arrival_date_week_number,
    -arrival_date_day_of_month,
    -year_day
  )

usethis::use_data(hotel_rates, overwrite = TRUE)
