#' Get Top Wrestlers by Average Reign Length
#'
#' This function retrieves the top wrestlers based on the average length of their title reigns.
#'
#' @param data A data frame containing wrestling data. Defaults to `wrestling_data_clean`.
#' @param n The number of top wrestlers to return. Defaults to 10.
#' @return A data frame with the top \code{n} wrestlers and their average reign length.
#' @export
#' @examples
#' top_wrestlers_by_reign(n = 5)
top_wrestlers_by_reign <- function(data = wrestling_data_clean, n = 10) {
  average_reign_length_by_wrestler(data) %>%
    head(n)
}
