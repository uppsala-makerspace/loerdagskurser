
get_raw_data <- function() {
  readr::read_csv(file = "survey.csv", show_col_types = FALSE)
}
get_raw_data()

get_data <- function() {
  t <- get_raw_data()
  t$Aktivitet <- NULL
  t
}
get_data()
