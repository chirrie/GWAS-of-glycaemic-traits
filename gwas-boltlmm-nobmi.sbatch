#!/bin/env bash
#SBATCH -p batch
##SBATCH -w n27
#SBATCH -J bolt-HOMA-r
#SBATCH -c 8 ##number of cores
#SBATCH --mem=30000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8

module load bioinf
module load python/3.9
module load bolt

bolt --bfile=~/all_imputed_map_qc --phenoFile=HOMA-IR.txt --phenoCol=log10_HOMA-IR --covarFile=HOMA-IR.txt --covarCol=sex --qCovarCol=PC{1:8} --qCovarCol=age --lmm --lmmForceNonInf --LDscoresFile=~/LDSCORE.1000G_AFR.tab.gz --numThreads=16 --maxModelSnps=1014126 --modelSnps=~/RsModelImput/rs_All_model_100_20_0.6 --geneticMapFile=~/genetic_map_hg19_withX.txt.gz --statsFile=HOMA-ir-undjustbmi.tab --impute2FileList=~/file_impute2 --impute2FidIidFile=~/score_imputed_data/FidIidFile.impute2 --statsFileImpute2Snps=HOMA-IR-unadjustbmi.stat
