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
  raw_covid_data <- read.csv(input_file_name)

  # select rows where sub.region column has selected state
  state_data <- raw_covid_data[raw_covid_data$sub.region == state, ]

  #check if the input state is actually in the raw data
  if (nrow(state_data) == 0) {
    stop("ERROR: No matches found. Please check state name.")
  }

  # save Texas data to new csv file in Output directory
  write.csv(state_data, file = paste0("Output/",
                                      tools::file_path_sans_ext(
                                        basename(input_file_name)),
                                      "_",
                                      gsub(pattern = " ",
                                           replacement = "_", state),
                                      ".csv"))
}
