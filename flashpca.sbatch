#!/bin/env bash
#SBATCH -p batch
#SBATCH -J flashpca
#SBATCH -c 16 ##number of cores
#SBATCH --mem=16000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8


./flashpca_x86-64 --bfile FI-clean-ldpruned --numthreads 16 -d 10 --outpc ~/MAGIC/FI/FI-flash-pc --outval ~/MAGIC/FI/FI-flash-val 
