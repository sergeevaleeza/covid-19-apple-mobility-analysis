#!/bin/bash

# This is bash script to analyze sequence data for SARS-CoV2 virus
# provided by NCBI website.

# Leeza Sergeeva
# November 23, 2020
# esergeeva@usfca.edu

# directory where the reference file FASTA is located
sars=/blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz
echo "The path to the life being analyzed is located at: $sars"

# calculate the total number of sequences in the file
# count number of lines that start with >,
echo "Total number of sequences in the file:"
zgrep -c "^>" $sars

# alternative way to show number of sequences in the file
#zcat $sars | bioawk -cfastx 'END{print NR}'

# tally up the number of SARS-CoV-2 seqeunces in the dataset from each country
# and sort this output from largest to smallest
echo "Here is the list of countries from which sequences were obtained, sorted from largest to smallest: "
bioawk -c fastx '{ print $comment}' $sars | cut -d '|' -f 3 --output-delimiter='_' |
awk -- '{for (i = 1; i <= NF; i++) wc[$i] += 1}; END {for (w in wc) print w, wc[w]};' |
sort -rnk2 > ../Output/sorted_list_of_countries_sars_seqeuences.txt

cat ../Output/sorted_list_of_countries_sars_seqeuences.txt
