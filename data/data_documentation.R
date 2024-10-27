#' WWE Championship Reigns Dataset (Cleaned)
#'
#' A cleaned dataset that records WWE Championship title reigns, including details
#' on the wrestler's name, reign duration, championship, event, and additional biographical
#' information. The data provides insights into the longevity and historical context of title reigns.
#'
#' @format A data frame with 412 rows and 14 variables:
#' \describe{
#'   \item{name}{Character. The name of the wrestler who held the championship.}
#'   \item{reign}{Numeric. The reign number for each wrestler's championship period.}
#'   \item{days}{Numeric. The number of days the championship reign lasted.}
#'   \item{date}{Date. The start date of the championship reign. Formatted as YYYY-MM-DD.}
#'   \item{event}{Character. The event where the wrestler won the championship title.}
#'   \item{location}{Character. The location where the title reign started.}
#'   \item{link}{Character. A hyperlink reference to the wrestler's Wikipedia page.}
#'   \item{belt}{Character. The championship title held by the wrestler.}
#'   \item{date_of_birth}{Character. The wrestler's date of birth, formatted as MM/DD/YYYY.}
#'   \item{date_of_death}{Character. The wrestler's date of death, if applicable, formatted as MM/DD/YYYY.}
#'   \item{cause_of_death}{Character. The cause of death, if applicable, for deceased wrestlers.}
#'   \item{year}{Numeric. The year the reign started, extracted from the `date` column.}
#'   \item{era}{Character. The historical period for the reign, categorized into "Pre-1980", "1980s-1990s", and "2000s and later".}
#'   \item{gender}{Character. The gender of the wrestler, classified as "Male" or "Female".}
#' }
#'
#' @details
#' This cleaned dataset provides detailed records of WWE Championship reigns across
#' multiple historical periods, with each row representing an individual title reign. The dataset is
#' designed to facilitate analysis of trends, patterns, and differences in reign lengths by era and gender.
#'
#' @source
#' WWE Championship Reigns Dataset, sourced from [Kaggle](https://www.kaggle.com).
#'
#' @examples
#' # View the structure of the dataset
#' glimpse(wrestling_data_clean)
#'
#' # Calculate the average reign length by era
#' wrestling_data_clean %>%
#'   group_by(era) %>%
#'   summarise(avg_reign = mean(days, na.rm = TRUE))
#'
"wrestling_data_clean"
