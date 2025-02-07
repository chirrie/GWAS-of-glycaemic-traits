#!/bin/env bash
#SBATCH -p batch
##SBATCH -w n27
#SBATCH -J Popcorn-cor
#SBATCH -c 8 ##number of cores
#SBATCH --mem=30000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8
module load python/2.7.10 
#####Script for running crosss-ancestry genetic correlation

popcorn compute --maf 0.01 --bfile1 ~/imputed_data_plink/all_imputed_map_qc --bfile2 European-b --gen_effect  AWI_EUR-b.cscore



popcorn fit --use_mle --cfile AWI_EUR-b.cscore --gen_effect --sfile1 FG-awi-gen.txt --sfile2 magic-eur.txt AWI-FG-EUR_nomun-correlation.txt

##popcorn fit --use_mle --cfile AWI_AFR-b.cscore --gen_effect --sfile1 FG-awi-genz.txt --sfile2 magic-aaz.txt AWI-FG-AA_zscore-correlation.txt
