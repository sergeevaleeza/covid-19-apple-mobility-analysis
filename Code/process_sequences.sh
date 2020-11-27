#!/bin/bash

# This is bash script to analyze sequence data for SARS-CoV2 virus
# provided by NCBI website. This bash script analyzed the gzip file
# based on the location provided
# If you have additional parameter, it will read out all information
# about the sequences in the file.
# First is the total number of seqeuneces in the file
# Second i the text file containing coutries and number of sequences

# Leeza Sergeeva
# November 24, 2020
# esergeeva@usfca.edu

if [ $# -eq 0 ]
then
  echo "To run this script supply one or two arguments:"
  echo "first argument is path to the gzip compressed SARS-CoV-2 fasta file."
  echo "Second (optional) argument is 'ALL'"
exit
fi

sars=$1
ALL=$ALL

if [ $# -eq 1 ];
then
  # tally up the number of SARS-CoV-2 seqeunces in the dataset from each country
  # and sort this output from largest to smallest
  bioawk -c fastx '{ print $comment}' $sars | cut -d '|' -f 3 --output-delimiter='_' | sed -E 's/ /_/g' |
  awk -- '{for (i = 1; i <= NF; i++) wc[$i] += 1}; END {for (w in wc) print w, wc[w]};' |
  sort -rnk2
exit 1
fi

if [ $# -eq 2 ] || [[ $ALL == "ALL" ]];
then
  echo "Total number of sequences in the file: "
  echo "$(zcat $sars | bioawk -cfastx 'END{print NR}')"
  echo "Here is the list of countries from which sequences were obtained, sorted from largest to smallest: "
  echo "$(bioawk -c fastx '{ print $comment}' $sars | cut -d '|' -f 3 --output-delimiter='_' | sed -E 's/ /_/g' |
  awk -- '{for (i = 1; i <= NF; i++) wc[$i] += 1}; END {for (w in wc) print w, wc[w]};' |
  sort -rnk2)"
exit
fi
