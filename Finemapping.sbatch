#!/bin/env bash
#SBATCH -p batch
#SBATCH -w n02
#SBATCH -J finemap2
#SBATCH -c 12 ##number of cores
#SBATCH --mem=30000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8

module load bioinf
module load python/3.9
module load java/18

nextflow pull h3abionet/h3agwas

nextflow run  h3abionet/h3agwas/finemapping/main.nf --head_pval P_BOLT_LMM --head_bp BP --head_chr CHR --head_rs SNP --head_beta BETA --head_se SE --head_A1 ALLELE1 --head_A2 ALLELE0 --input_dir "~/imputed_data_plink/" --input_pat all_imputed_map_qc --file_gwas "~/FG.stat" --list_phenogc "Fasting blood glucose" --output_dir "~/Awi-gen/FG_raw/finemap24" --output finemapping_FG24 -profile slurmSingularity -r dev 
