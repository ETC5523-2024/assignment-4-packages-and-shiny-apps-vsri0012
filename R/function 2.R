#' Calculate Average Reign Length by Era
#'
#' This function calculates the average championship reign length across different historical eras.
#'
#' @param data A data frame containing wrestling data. Defaults to `wrestling_data_clean`.
#' @return A data frame with each era and the average reign length within that era, sorted in descending order.
#' @export
#' @examples
#' average_reign_length_by_era()
average_reign_length_by_era <- function(data = wrestling_data_clean) {
  data %>%
    group_by(era) %>%
    summarise(avg_reign_length = mean(days, na.rm = TRUE)) %>%
    arrange(desc(avg_reign_length))
}
