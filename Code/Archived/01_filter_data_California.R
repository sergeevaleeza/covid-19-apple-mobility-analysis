# script to read Apple mobility data from Covid-19
# subset data to just include rows from California
# and extract to csv file

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-08-30

# read in raw csv file, and attach it to object "raw_covid_data"
raw_covid_data <- read.csv("Data/Raw/2020-08-28-applemobilitytrends.csv")

# subset to only have rows where sub.region column has "California"
# exclude "Baja California"
# data  is looked up i nsuch order [ 1st  rows_we_want, 2nd columns_we_want]
california_data <- raw_covid_data[raw_covid_data$sub.region == "California", ]


# save California data to new csv file in Output directory
write.csv(california_data, file =
            "Output/California_apple_mobility_covid_data.csv")
