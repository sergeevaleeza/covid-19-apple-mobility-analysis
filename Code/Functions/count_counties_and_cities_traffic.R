# script to gain inside knowledge of the processed data for single state
# using dplyr package to get number of cities and counties in a given state
# get numbers for different mobility type data, and save it as .csv file

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-09-20

# load the package "dplyr"

# function to read in state data and giving summary of number of cities and
# counties with different mobility type data, and save it as .csv file
city_county_mobility_data <- function(input_state_file) {

  # read in state .csv data
  state_data <- readr::read_csv(input_state_file, col_names = TRUE)

  # dplyr chians, get summary for state date mobility grouped by geo_type and
  # transportation_type as a table.
  count_subregion_by_transport <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # save table with city and county mobility data as a .csv file
  readr::write_csv(count_subregion_by_transport,
                   paste0("Output/State_Data_Tally/",
                          tools::file_path_sans_ext(
                            basename(input_state_file)),
                          "_cities_and_counties_counts.csv"))

  return(count_subregion_by_transport)

}
