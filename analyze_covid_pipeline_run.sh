#!/bin/bash

set -euo pipefail

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
  echo "To run this script, supply three arguments:"
  echo "The first is the name of the US state to be analyzed."
  echo "If state contains space, input must be surrounded by double quotes."
  echo "The second is the path to raw mobility data csv file."
  echo "The third is the path to the sequence summary report text file."
exit 1
fi

state=$1
state=${state// /_}

RMD_PARAMS="params = list(state = '$1', data = '$2', seqdata = '$3')"
RMD_OUTPUT="output_dir = 'Output', output_file = 'Analysis_$state'"


Rscript -e "rmarkdown::render('Analysis.Rmd', $RMD_PARAMS, $RMD_OUTPUT)"

