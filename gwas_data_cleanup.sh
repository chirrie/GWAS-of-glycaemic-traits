
#README


#Format gwas files magic data
#Below scripet replaces he headers with popcorn specific format

sed '1s/.*/SNP\tchr\tpos\tA2\tA1\tAF\tbeta\tSE\tP\tN/' MAGIC100i0G_FG_AA.tsv>output_file.txt

### omit p value column

awk '{for(i=1;i<=NF;i++) if(i!=9) printf "%s%s", $i, (i==NF ? "\n" : OFS)}' OFS="\t" output_file.txt> magic-eur.txt


#### remove SNPs with missing data and structrural variants

grep -v "NA" magic-eur.txt >m.txt

mv m.txt magic-eur.txt 
awk 'NR==1 || ($4 ~ /^[ACGT]$/ && $5 ~ /^[ACGT]$/)' magic-eur.txt >magic-eur-clean.txt



