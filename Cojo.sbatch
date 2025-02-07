#!/bin/env bash
#SBATCH -p batch
#SBATCH -w n02
#SBATCH -J cojo
#SBATCH -c 8 ##number of cores
#SBATCH --mem=30000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8

module load bioinf
module load python/3.9

nextflow pull h3abionet/h3agwas
## update the pipeline
nextflow run h3abionet/h3agwas/finemapping/cojo-assoc.nf --head_pval P_BOLT_LMM --head_bp BP --head_chr CHR --head_rs SNP --head_beta BETA --head_se SE --head_A1 ALLELE1 --head_A2 ALLELE0 --input_dir "/dataE/AWIGenGWAS/shared/imputed_data_plink/" --input_pat all_imputed_map_qc --output_dir cojo --data FG_phenotype.txt --pheno glucose_log --file_gwas "/home/chebii/Awi-gen/FG-assoc/all_imputed_map_qc-glucose_log.imp.stat" -profile slurmSingularity -r dev --cojo_top_snps_chro 1






meta<-read.csv("~/Awi-gen/FG_raw/boltlmm/output/metasoft/metasoft-clean.csv")
