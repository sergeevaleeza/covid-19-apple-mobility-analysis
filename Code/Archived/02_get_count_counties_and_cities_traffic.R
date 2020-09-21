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

# test out function
city_county_mobility_data(
  input_state_file = "Output/applemobilitytrends-2020-09-12_Texas.csv"
  )
