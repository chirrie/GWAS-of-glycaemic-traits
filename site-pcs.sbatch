#!/bin/env bash
#SBATCH -p batch
#SBATCH -J flashpca
#SBATCH -c 16 ##number of cores
#SBATCH --mem=16000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8


./flashpca_x86-64 --bfile nai-clean-ldpruned --numthreads 16 -d 10 --outpc ~/nai2-flash.pc --outval ~/sitewise/nai2-flash-val 
