# script to read any subsetted state mobility data file,
# tally the rows grouped by city/county and transportation type,
# and then output a .csv file into the output directory.

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-09-20

# use a function to subset any US state from original dataset
# create output .csv file containing original data name + state name

#load functions
source("Code/Functions/count_counties_and_cities_traffic.R")

# Top 10 states by population were chosen
states_list_of_ten <- list("California", "Texas", "Florida", "New York",
                           "Pennsylvania", "Illinois", "Ohio", "Georgia",
                           "North Carolina", "Michigan")

# for loop to iterate through list of 10 states and pick appropriate .csv file
for (state_to_choose in states_list_of_ten) {
    city_county_mobility_data(
    input_state_file = paste0("Output/applemobilitytrends-2020-09-18_",
                              state_to_choose, ".csv")
  )
}
