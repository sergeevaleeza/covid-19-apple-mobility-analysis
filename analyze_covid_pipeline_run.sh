#!/bin/bash

# A bash script to drive the rendering of the Rmarkdown file
# using some parameters passed in from the shell
# This script expects two command line parameters,
# the first parameter is a US state,
# the second parameter is raw data to process.

# Elizaveta Sergeeva
# October 24, 2020
# esergeeva@usfca.edu

Rscript -e "rmarkdown::render('Analysis.Rmd', \
            params = list(state = '$1', \
            data = '$2'))"