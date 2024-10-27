#' Calculate Average Reign Length by Gender
#'
#' This function calculates the average championship reign length for each gender.
#'
#' @param data A data frame containing wrestling data. Defaults to `wrestling_data_clean`.
#' @return A data frame with each gender and the average reign length for that gender, sorted in descending order.
#' @export
#' @examples
#' average_reign_length_by_gender()
average_reign_length_by_gender <- function(data = wrestling_data_clean) {
  data %>%
    group_by(gender) %>%
    summarise(avg_reign_length = mean(days, na.rm = TRUE)) %>%
    arrange(desc(avg_reign_length))
}
