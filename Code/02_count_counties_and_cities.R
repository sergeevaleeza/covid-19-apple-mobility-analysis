# script to gain inside knowledge of the processed data for single state
# using dplyr package to get number of cities and counties in a given state
# get numbers for different mobility type data, and save it as .csv file

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-09-20

# load the package "dplyr"
library("dplyr")

# load in the dataset from previous script
input_file <- "Output/applemobilitytrends-2020-09-12_Texas.csv"
state_data <- read.csv(input_file)

# dplyr chians, get summary for state date mobility grouped by geo_type and
# transportation_type as a table.
count_subregion_by_transport <- state_data %>%
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()

# save table with city and county mobilitu data as a .csv file
write.csv(count_subregion_by_transport,
          "Output/texas_cities_and_counties_counts.csv")
