#' Calculate Average Reign Length by Wrestler
#'
#' This function calculates the average championship reign length for each wrestler.
#'
#' @param data A data frame containing wrestling data. Defaults to `wrestling_data_clean`.
#' @return A data frame with each wrestler's name and their average reign length, sorted in descending order.
#' @export
#' @examples
#' average_reign_length_by_wrestler()
average_reign_length_by_wrestler <- function(data = wrestling_data_clean) {
  data %>%
    group_by(name) %>%
    summarise(avg_reign_length = mean(days, na.rm = TRUE)) %>%
    arrange(desc(avg_reign_length))
}
