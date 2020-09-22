# funciton to get full date and pivot it the long way, taking all columns as 
# date and turning it into a table called date and save new  file as _long.csv
# in output folder

# Leeza Sergeeva
# esergeeva@dons.usfca.edu
# 2020-09-21


#load functions
source("Code/Functions/create_long_pivot_table.R")

# test out function to create long pivot table from original raw file
create_long_pivot_table(
  input_file_name = "Data/Raw/applemobilitytrends-2020-09-20.csv"
)
