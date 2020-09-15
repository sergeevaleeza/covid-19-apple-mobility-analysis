# script to read Apple mobility data from Covid-19
# subset data to just include rows from Texas
# and extract to csv file 

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-08-30

# read in raw csv file, and attach it to object "raw_covid_data"
raw_covid_data <- read.csv("Data/Raw/2020-08-28-applemobilitytrends.csv")

# select rows where sub.region column has "Texas"
texas_data <- raw_covid_data[raw_covid_data$sub.region == "Texas",]

# save Texas data to new csv file in Output directory
write.csv(texas_data, file = "Output/Texas_apple_mobility_covid_data.csv")
