
## Exact replication
### Awk command to check for replication between two gwas files based on  rsid and positions


The script compares rsid columns between thw two files, if their is a match it appends the data in one file. Filtering is then done based on p-value using slected threshold

awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }' FG_awi-sumstat MAGIC1000_EUR.tsv >awi-eur-replicated


####Add headet to combined data showing signals present in two g
(echo -e "SNP\tCHR\tBP\tGENPOS\tALLELE1\tALLELE0\tA1FREQ\tINFO\tBETA\tSE\tP_BOLT_LMM_INF\tP_BOLT_LMM\tvariant\tchromosome\tbase_pair_location\teffect_allele\tother_allele\teffect_allele_frequency\tbeta\tstandard_error\tp_value\tsample_size" && awi-eur-replicated) >awi-eur-replicated2.txt


#### Check replicated signals

awk '$20 <0.00000005 || NR==1' awi-eur-replicated2.txt>awi-eur-replicated-final.txt 
