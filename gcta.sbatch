#!/bin/env bash
#SBATCH -p batch
##SBATCH -w n02
#SBATCH -J gcta
#SBATCH -c 8 ##number of cores
#SBATCH --mem=30000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8


./gcta-1.94.1 --bfile ~/imputed_data_plink/all_imputed_map_qc --make-grm --out FI_test --thread-num 10


./gcta-1.94.1 --reml --grm FI_test --pheno FI.phen --qcovar 8pcs.txt --out FI_he --thread-num 10

./gcta64 --grm mydata_allSNPs --pheno mydata.phen --reml-bivar 1 2 for geneti corraltion
