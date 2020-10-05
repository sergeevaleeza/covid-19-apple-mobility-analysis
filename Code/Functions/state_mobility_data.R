# script to read Apple mobility data from Covid-19
# subset data to include rows from any state
# and extract to csv file

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-09-14

# create a function to subset any US state from original dataset
# create output .csv file containing original data name + state name
state_mobility_data <- function(input_file_name, state) {

  # read in full .csv data
  raw_covid_data <- readr::read_csv(input_file_name, col_names = TRUE)

  # select rows where sub.region column has selected state
  state_data <- raw_covid_data %>%
    dplyr::filter(`sub-region` == state)

  state_no_spaces <- gsub(state, pattern = " ", replacement = "_")

  # save state  data to new csv file in Output directory
  readr::write_csv(state_data, paste0("Output/State_Data_Wide/",
                                      tools::file_path_sans_ext(
                                        basename(input_file_name)),
                                      "_",
                                      state_no_spaces,
                                      ".csv"))

  return(state_data)

}
