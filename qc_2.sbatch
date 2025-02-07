#!/bin/env bash
#SBATCH -p batch
#SBATCH -w n27
#SBATCH -J qc
#SBATCH -c 4 ##number of cores
#SBATCH --mem=16000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8

##/opt/exp_soft/bioinf/bin
module load plink

##Filter samples and variants with high missing entry frequencies
###--bfile species the plink files
##“–geno 0.1” tells PLINK to throw out every variant where more than 10% of the genotype calls are “NA”s.
##“–mind 0.1” tells PLINK to throw out every sample where more than 10% of the genotype calls are “NA”s.
##--make-bed generates a new PLINK 1 fileset, with the high-missingness samples and variants removed.


plink --threads 4 --memory 16000  --bfile ./dataE/AWIGen/.. --geno 0.1 --mind 0.1 --make-bed --out missingness_filtered_data



####Remove close relatives from the data using --king-cutoff parameter
##KING kinship coefficients are scaled such that duplicate samples have kinship 0.5, not 1. 
##First-degree relations (parent-child, full siblings) correspond to ~0.25, second-degree relations correspond to ~0.125, etc. 
#It is conventional to use a cutoff of ~0.354 (the geometric mean of 0.5 and 0.25) to screen for monozygotic twins and duplicate samples, ~0.177 to add first-degree relations

/opt/exp_soft/bioinf/bin/plink2 --threads 4 --memory 16000 --bfile missingness_filtered_data --king-cutoff 0.177 --make-bed --out relpruned_data


###MAF reporting and filtering using -freq and -maf

plink --threads 4 --memory 16000 --bfile missingness_filtered_data --freq --out allele_freqs

plink --threads 4 --memory 16000 --bfile missingness_filtered_data  --maf 0.05 --make-bed --out maf_filtered_data

#### check Hardy–Weinberg Equilibrium

plink --threads 4 --memory 16000 --bfile maf_filtered_data --hardy --out hwe_values

/opt/exp_soft/bioinf/bin/plink2 --threads 4 --memory 16000 --bfile maf_filtered_data --hwe 0.000001 --make-bed --out hwe_filtered_data 



##LD pruning. High LD regions are removed using --indep-pairwise
##removes SNPs so that no pair within 200 kilobases have squared-allele-count-correlation (r2) greater than 0.5, and saves the IDs of the remaining SNPs to ldpruned_snplist.prune.in. 
/opt/exp_soft/bioinf/bin/plink2 --threads 4 --memory 16000 --bfile hwe_filtered_data --indep-pairwise 200kb 1 0.5 --out ldpruned_snplist
plink --threads 4 --memory 16000 --bfile hwe_filtered_data --extract ldpruned_snplist.prune.in --make-bed --out ldpruned_data

#### Check for cryptic relatenss using --genome to get pi-hat values (ibd)

plink --threads 4 --memory 16000 --bfile ldpruned_data --genome --out duplicates
###3 Extract hits with pi-hat >0.1875 and save in a file say  IBS_exlcuded.txt and run below plink command to get clean one

plink --threads 4 --memory 16000 --bfile ldpruned_data --remove IBS_excluded.txt --make-bed --out ibd_cleaned

#### Population structutre check using PCA

/opt/exp_soft/bioinf/bin/plink2 --threads 4 --memory 16000 --bfile ibd_cleaned --pca 10 --out pca_results
#### Remove bad samples..by extracting from above pca results then use --remove in plink 

plink --threads 4 --memory 16000 --bfile ibd_cleaned --remove bad_samples.txt --make-bed --out pca_results.eigenvec
#### Follow up with anoiier pca analysis after removing outlines

plink --file GWAS_clean4 --pheno pheno.txt --pheno-name Aff --covar plink.eigenvec --covar-name PC1 --logistic --adjust --out PC1


### Once statisfy with the pca you can load the output in R for visualization

#pca_table <- read.table("pca_results.eigenvec", header=TRUE, comment.char="")
#plot(pca_table[, c("PC1", "PC2", "PC3", "PC4", "PC5")])
plot(pca$PC1, pca$PC2, xlab="PC1", ylab="PC2")
##Plot 4 pcs
plot(pca[3:6])
# install.packages("scatterplot3d")
library("scatterplot3d")
fsize=1br6
pdf("graphs/pca_3d.pdf", width=10, height=10)
scatterplot3d(pca[,3:5], pch = 16, cex.symbol=1.2, color="#00BFC4", main="Maize Diversity Panel", angle=40)
dev.off()
###check sex information are ok...remove problem ones if it cannot be resolved.
plink --threads 4 --memory 16000 --bfile pcs_results.eigenvec  --check-sex --out sexstat


#####To remove outliners, convert eigenvectors to z scores
##remove samples that are 2 or 3 or 6 standard deviations (SDs) from the group mean through PCA. 

##You can either code this manually by converting the values for a given eigenvector (i.e. principal component) to Z-scores, where Z=1 is 1 SD from the mean, Z=2 is 2 SDs, et cetera). 

z_scores <- (pca$PC1-mean(pca$PC1))/sd(pca$PC1)
write.csv(z_scores, "pc1.csv")

###Outlier samples were detected using principal component analysis (PCA) on the VST-transformed counts, where any samples>4  standard deviations from the mean, in any of the first six principal components(PC), were excluded.

####Check percentage of variance explained to determined PCs to included, most consider 80-90%
eigenvalues/sum(eigenvalues)

