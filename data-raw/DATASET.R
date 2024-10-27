# Load necessary libraries
library(tidyverse)
library(lubridate)

# Read the data
wrestling_data <- read_csv("data-raw/data.csv")

# Define the list of female wrestlers
female_wrestlers <- c(
  "The Fabulous Moolah", "Wendi Richter", "Leilani Kai", "The Spider Lady",
  "Sensational Sherri", "Rockin' Robin", "Alundra Blayze", "Bull Nakano",
  "Bertha Faye", "Jacqueline", "Sable", "Debra", "Ivory", "The Kat",
  "Stephanie McMahon-Helmsley", "Lita", "Chyna", "Trish Stratus",
  "Jazz", "Molly Holly", "Victoria", "Gail Kim", "Melina", "Mickie James",
  "Beth Phoenix", "Michelle McCool", "Layla", "Charlotte Flair",
  "Sasha Banks", "Naomi", "Alexa Bliss", "Bayley", "Asuka", "Becky Lynch",
  "Ronda Rousey", "Carmella"
)

# Data Cleaning and Preparation
wrestling_data_clean <- wrestling_data %>%
  # Convert `date` column to Date format (assuming 'date' format is `dd-mmm-yy`)
  mutate(date = dmy(date),
         year = year(date)) %>% # Extract year from date

  # Handle missing values by filtering out rows where 'days' is NA
  filter(!is.na(days)) %>%

  # Define historical eras based on the 'year' column
  mutate(era = case_when(
    year < 1980 ~ "Pre-1980",
    year < 2000 ~ "1980s-1990s",
    TRUE ~ "2000s and later"
  )) %>%

  # Add a gender column based on predefined female wrestler names
  mutate(gender = if_else(name %in% female_wrestlers, "Female", "Male")) %>%

  # Filter out any rows with missing or irrelevant values in key columns, if necessary
  filter(!is.na(name) & !is.na(days))

# Display the cleaned dataset with gender
wrestling_data_clean

