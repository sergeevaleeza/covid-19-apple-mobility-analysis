# script to read Apple mobility data from Covid-19
# subset data to include rows from any state
# and extract to csv file

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-09-20

# use a function to subset any US state from original dataset
# create output .csv file containing original data name + state name
# use function for a list of 10 states

#load functions
source("Code/Functions/state_mobility_data.R")

# Top 10 states by population were chosen
states_list_of_ten <- list("California", "Texas", "Florida", "New York",
                           "Pennsylvania", "Illinois", "Ohio", "Georgia",
                           "North Carolina", "Michigan")

# for loop to iterate through list of 10 states.
for (state_to_choose in states_list_of_ten) {
  state_mobility_data(
    input_file_name = "Data/Raw/applemobilitytrends-2020-10-03.csv",
    state = state_to_choose
  )
}
