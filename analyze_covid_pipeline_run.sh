#!/bin/bash

# A bash script to drive the rendering of the Rmarkdown file 
# using some parameters passed in from the shell

Rscript -e "rmarkdown::render('Analysis.Rmd', \
            params = list(state = 'Arizona', \
            data = 'applemobilitytrends-2020-10-23.csv'))"