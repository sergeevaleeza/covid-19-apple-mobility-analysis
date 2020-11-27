STATE			:= California
SPACE 			:= $() $()
STATE_NOSPACE		:= $(subst $(SPACE),_,$(STATE))
REPORT			:= Analisis_$(STATE_NOSPACE).html
OUTPUT			:= Output
REPORT_PATH		:= $(OUTPUT)/$(REPORT)
R_FUNCTIONS		:= $(wildcard Code/Functions/*.R)
MOBILITY_DATA		:= Data/Raw/applemobilitytrends-2020-10-23.csv
SEQ_DATA		:= /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz
SEQ_SUMMARY		:= $OUTPUT/sequence_summary.txt

all: $(REPORT_PATH)

$(REPORT_PATH): Analysis.Rmd references.bib $(R_FUNCTIONS) $(SEQ_SUMMARY) $(MOBILITY_DATA) analyze_covid_pipeline_run.sh
	bash analyze_covid_pipeline_run.sh "$(STATE)" "$(MOBILITY_DATA)" "$(SEQ_SUMMARY)"

$(SEQ_SUMMARY): Code/process_seqeuences.sh $(SEQ_DATA)
	bash Code/process_sequences.sh "$(SEQ_DATA)" > "$(SEQ_SUMMARY)"
