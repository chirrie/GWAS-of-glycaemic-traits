#!/bin/env bash
##SBATCH -w n06
#SBATCH -J fe-raw
#SBATCH -c 8 ##number of cores
#SBATCH --mem=30000
##SBATCH --error slurm-A%.out

module load regenie/3.4.1
### do this :conda activate regenie_env

regenie --threads 8 --step 1 --force-step1 --bed /home/chebii/MAGIC/regen/regen-ldpruned --phenoFile FG-female.txt --phenoCol glucose_qc --covarFile FG-female.txt --covarCol age --covarCol Age2 --covarCol PC{1:6} --strict --bsize 1000 --qt --lowmem --write-samples --out FG-fe-raw-step1



regenie --threads 8 --step 2 --bed /dataE/AWIGenGWAS/shared/imputed_data_plink/all_imputed_map_qc --phenoFile FG-female.txt --phenoCol glucose_qc --covarFile FG-female.txt --covarCol age --covarCol Age2 --covarCol PC{1:6} --strict --bsize 200 --qt --lowmem --pred FG-fe-raw-step1_pred.list --out FG-fe-bmiunadj
  

