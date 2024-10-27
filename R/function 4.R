#' Filter Wrestling Data by Gender
#'
#' This function filters the wrestling data by gender, returning only rows that match the specified gender.
#'
#' @param data A data frame containing wrestling data. Defaults to `wrestling_data_clean`.
#' @param gender A character string specifying the gender to filter by (e.g., "Male" or "Female").
#' @return A data frame filtered by the specified gender.
#' @export
#' @examples
#' filter_by_gender(gender = "Female")
filter_by_gender <- function(data = wrestling_data_clean, gender) {
  data %>%
    filter(gender == gender)
}
