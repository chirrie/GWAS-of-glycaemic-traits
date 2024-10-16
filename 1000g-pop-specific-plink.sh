#!/bin/env bash
#SBATCH -p batch
##SBATCH -w n27
#SBATCH -J plink
#SBATCH -c 10 ##number of cores
#SBATCH --mem=10G
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8

module load plink


plink --threads 16 --bfile updated_1000 --keep Eas.samples.txt --make-bed --out EAS

plink --threads 16 --bfile updated_1000 --keep african-id.txt --make-bed --out African-b
