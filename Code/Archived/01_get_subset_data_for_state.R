# script to read Apple mobility data from Covid-19
# subset data to include rows from any state
# and extract to csv file

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-09-14

# use a function to subset any US state from original dataset
# create output .csv file containing original data name + state name

#load functions
source("Code/Functions/state_mobility_data.R")

# test out function
state_mobility_data(
  input_file_name = "Data/Raw/applemobilitytrends-2020-09-12.csv",
  state = "Texas"
)
