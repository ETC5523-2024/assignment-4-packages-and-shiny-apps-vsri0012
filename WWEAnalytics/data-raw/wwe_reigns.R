library(tidyverse)
library(lubridate)

wrestling_data <- read_csv("data-raw/data.csv")

wrestling_data <- wrestling_data %>%
  mutate(date = dmy(date),
         year = year(date))

colSums(is.na(wrestling_data))

wrestling_data <- wrestling_data %>%
  filter(!is.na(days))

average_reign_per_wrestler <- wrestling_data %>%
  group_by(name) %>%
  summarise(avg_reign_length = mean(days, na.rm = TRUE))


overall_avg_reign <- mean(wrestling_data$days, na.rm = TRUE)

wrestling_data <- wrestling_data %>%
  mutate(era = case_when(
    year < 1980 ~ "Pre-1980",
    year < 2000 ~ "1980s-1990s",
    TRUE ~ "2000s and later"
  ))

average_reign_by_era <- wrestling_data %>%
  group_by(era) %>%
  summarise(avg_reign_length = mean(days, na.rm = TRUE))

top_20_wrestlers <- average_reign_per_wrestler %>%
  arrange(desc(avg_reign_length)) %>%
  top_n(20, avg_reign_length)

usethis::use_data(wrestling_data, overwrite = TRUE)
usethis::use_data(average_reign_by_era, overwrite = TRUE)
usethis::use_data(top_20_wrestlers, overwrite = TRUE)
