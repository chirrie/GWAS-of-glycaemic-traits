#!/bin/env bash
#SBATCH -p batch
#SBATCH -w n02
#SBATCH -J plink
#SBATCH -c 10 ##number of cores
#SBATCH --mem=10G
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8

module load plink

#script to update rsids in 1g plink files

#awk 'FNR==NR {a[$1":"$2]=$3; next} {if($1":"$4 in a) print $2, a[$1":"$4]}' reference.txt 1000g-b.bim > mapping.txt

#plink --bfile kg --update-name mapping.txt 2 1 --make-bed --out updated_1g
##### remove duplicates SNPS
plink --bfile updated_1g --extract snps_to_keep.txt --make-bed --out updated_1000

