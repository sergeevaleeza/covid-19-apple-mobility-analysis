# script to get full date and pivot it the long way, taking all columns as date
# and turning it into a table called date and save new  file as _long.csv
# in output folder

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-09-21

# load in packages
library("readr")
library("tidyr")
library("dplyr")

# Read in most recent data from Apple
input_file_name <- "Data/Raw/applemobilitytrends-2020-09-20.csv"
all_covid_data <- read_csv(input_file_name)


# Convert data to long format
all_covid_data_long <- all_covid_data %>%
  pivot_longer(c(`2020-01-13`:dplyr::last(names(all_covid_data))),
               names_to = "date")

# Save new data to csv
write_csv(all_covid_data_long, paste0("Output/",
                                      tools::file_path_sans_ext(
                                        basename(input_file_name)),
                                      "_long.csv")
)
