# Title: Analysis of Apple Mobility Data in the Era of COVID-19

Author: Leeza Sergeeva  
Email: esergeeva.dons.usfca.edu


This project is about analyzing mobility data druring COVID_19 produced by Apple.

Data is available for [download](https://covid19.apple.com/mobility)


### Log
* On 2020-10-04, new apple mobility data was downloaded. New markdown file created where user can type in name of the state and get mobility data gets processed. First, data is getting subsetted to the chosen state. Then wide state data is pivoted on date, converting it into long table, and saving it as .csv file. Then wide data, is tallied and grouped by type of mobility data contained in state data, result is also saved as .csv file. Using ggplot2, two types of figures us generated and saved. First figure shows grouped bar plot of the tallied data. Second figure is a line plot of relative driving mobility across the state. Markdown file is capable to dynamically update, including tables and figures.


* On 2020-09-21, 03_ old code was turned into a function and old version was archived. All function calls were updated with new latest covid data. All new .csv filed for 2020-09-20 were created for long pivot data, and previously used top 10 states.

* On 2020-09-21, new covid data was downloaded, new code was written using libraries: readr, tidyr, and dplyr to convert columns containing day dates into one column named date, renaming new file with original name of the file followed by _long.csv

* On 2020-09-20, original 01_get_subset_data_for_state.R and 02_get_count_counties_and_citis_traffic.R were archived. New code with implemented For Loops was added to those funcitons to iterate for a provided list of 10 states. I choose top 10 states by population in this order: "California", "Texas", "Florida", "New York", "Pennsylvania", "Illinois", "Ohio", "Georgia", "North Carolina", and "Michigan" according to [World Population Review website](https://worldpopulationreview.com/states). Fixed naming issue with space being in the saved file. fixed with gsub function.

* On 2020-09-20, script was turned into a function with new call script in code folder, which takes input file (based on previous code to get state_mobility_data), and puts out in output folder name of the original file + _cities_and_counties_count.csv file

* On 2020-09-20, a new version of data was downloaded for analysis. Installed "dplyr" package. Wrote script to analyze data from previous script based on state's city and county mobility data.

* On 2020-09-14, git repository was created for the project and commit all files into that repository.

* On 2020-09-14, a new version of data was downloaded for analysis. Create function to get any state subset data and save it naming with original larg data set name followed by state name. Archived old code. 

* On 2020-08-30, data was downloaded originally for analysis and created silmple code to look up subset data of California and Texas states and export that data as separate .csv files.

