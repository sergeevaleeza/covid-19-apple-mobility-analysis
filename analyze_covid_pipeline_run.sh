#!/bin/bash

# A bash script to drive the rendering of the Rmarkdown file
# using some parameters passed in from the shell
# This script expects two command line parameters,
# the first parameter is a US state,
# the second parameter is raw mobility data to process
# downloaded from Apple COVID mobility data website.

# Elizaveta Sergeeva
# October 24, 2020
# esergeeva@usfca.edu

if [ $# -eq 0 ]
then 
  echo "To run this script, supply two arguments:"
  echo "The first is the name of the US state to be analyzed."
  echo "The socond is the path to raw mobility data csv file."
  exit 1
fi

Rscript -e "rmarkdown::render('Analysis.Rmd', \
            params = list(state = '$1', \
            data = '$2'))"