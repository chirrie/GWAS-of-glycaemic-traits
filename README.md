```python
1. Explorative-FG.R
 ##a script to generate  descriptive statistics of the data

### Count total samples
setwd("/Users/vivienchebii/Documents/awi-new/FG_final-Nov/")
FG<-read.csv ("/Users/vivienchebii/Documents/awi-new/FG_final-Nov/FG_phenotype-12.csv")
total_samples <- nrow(FG)  
View(total_samples)
### Summary/descriptive statistics for bmi_c_qc 
summary(FG$bmi_c_qc, na.rm=TRUE)
sd(FG$bmi_c_qc, na.rm =TRUE)
range(FG$bmi_c_qc, na.rm = TRUE)
mean(FG$bmi_c_qc, na.rm = TRUE)
median(FG$bmi_c_qc)
quantile(FG$bmi_c_qc,probs=0.5)
####Summary for age
summary(FG$age)
range(FG$age)
mean(FG$age)
median(FG$age)
sd(FG$age, na.rm =TRUE)
quantile(FG$ageprobs=0.5)

#### Summary of FG concerntrations
summary(FG$glucose_qc, na.rm=TRUE)
sd(FG$glucose_qc,na.rm=TRUE)
range(FG$glucose_qc, na.rm=TRUE)
mean(FG$glucose_qc,na.rm=TRUE)
median(FG$glucose_qc, na.rm=TRUE)

### Count the total number of females and males and convert  to percentbmi_c_qc
table(FG$sex)
(percent_gender <- table(FG$sex)/total_samples * 100)
### Create a bar plot for males and females to get an idea of the distribution
(percent_gender <- table(FG$sex)/total_samples * 100)
table(percent_gender)
barplot(percent_gender,ylim=c(0,100), ylab="Percentage of individuals",xlab="Sex(0=F,1=M)", main="Barplot of gender ")
###Plots for BMI classiFGcations
percent_bmi_cat <- table(FG$bmi_cat_c_qc)/total_samples * 100
table (percent_bmi_cat)
barplot(percent_bmi_cat,ylim=c(0,100), ylab="Percentage of individuals",xlab="BMI_c(0=under,1=normal, 2=over, 3=obese)", main="Barplot of BMI Catagory")

####Diabetic status 
percent_diabetics <- table(FG$diabetes_status_c_qc)/total_samples * 100
table(percent_diabetics)
barplot(percent_diabetics,ylim=c(0,100), ylab="Percentage of individuals",xlab="Diabetics_status(0=Non diabetics,1=Diabetics)", main="Barplot of Diabetic Status (FG trait)")

### Calcualter skeweness of contionus data 
install.packages("moments")
install.packages("ggpubr")
library(moments)
library(ggpubr)
skewness(FG$glucose_qc, na.rm = TRUE)
###Logtransform and inverse transformation and  Density plots for continous variables
##Age 
install.packages("rcompanion")  ###for inverse normalization
install.packages("GDAdata")
library(rcompanion)
par(mfrow=c(1,2))

logtransform<-log10(FG$glucose_qc)
inverse_trans<-blom(FG$glucose_qc, method="blom", alpha=3/8, complete=TRUE)
par(mfrow=c(1,3))
plot(density(FG$glucose_qc, na.rm=TRUE, bw = 1), col = "black", main = "untransformed FG", ylim = c(0,0.4), xlab="FG(uIU/ml")
plot(density(logransform, na.rm=TRUE, bw = 1), col = "black", main = "log_transformed FG", ylim = c(0,0.4), xlab="FG")
plot(density(inverse_trans, na.rm=TRUE, bw = 1), col = "black", main = "inverse_normaltransformed FG", ylim = c(0,0.4), xlab="FG")
hist(FG$glucose_qc,col= 'grey', main = 'Distribution of FG',xlab = 'FG (mmol/l)', ylab='No of individuals', breaks= c(30))
hist(logtransform,col= 'grey', main = 'logtranformed-FG',xlab = 'FG (mmol/l)', ylab='No of individuals', breaks= c(30))
hist(inverse_trans,col= 'grey', main = 'inversetransformed-FG',xlab = 'FG (mmol/l)', ylab='No of individuals', breaks= c(30))
```

```python

2. 1000g-pop-specific-plink.sh

Description: Plink command to extract the genotype data from various sub populations in the 1000 genomes database
Inputs: 1000 genome plink files and data for each sub populations
Outputs: Plink files
Usage:
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


```

```python
3. gwas-boltlmm-bmiadj.sbatch
 Linear mixed model script for running GWAS analysis for combined dataset, implimented in BOLTLMM program takes >5000 samples hence used for combined set gwas analysis
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

bolt --bfile=~/all_imputed_map_qc --phenoFile=HOMA-IR.txt --phenoCol=log10_HOMA-IR --covarFile=HOMA-IR.txt --covarCol=sex --qCovarCol=PC{1:8} --qCovarCol=age --qCovarCol=bmi_c_qc --lmm --lmmForceNonInf --LDscoresFile=~/LDSCORE.1000G_AFR.tab.gz --numThreads=16 --maxModelSnps=1014126 --modelSnps=~/RsModelImput/rs_All_model_100_20_0.6 --geneticMapFile=~/genetic_map_hg19_withX.txt.gz --statsFile=HOMA-ir-undjustbmi.tab --impute2FileList=~/file_impute2 --impute2FidIidFile=~/score_imputed_data/FidIidFile.impute2 --statsFileImpute2Snps=HOMA-IR-unadjustbmi.stat
                          
```

```python
4. Regenie.sbatch
 Linear mixed model script using REGENIE which works well for small sample sizes. This was used for regionwise gwas
 !/bin/env bash
##SBATCH -w n06
#SBATCH -J fe-raw
#SBATCH -c 8 ##number of cores
#SBATCH --mem=30000
##SBATCH --error slurm-A%.out

module load regenie/3.4.1
### do this :conda activate regenie_env

regenie --threads 8 --step 1 --force-step1 --bed /~/regen/regen-ldpruned --phenoFile FG-south.txt --phenoCol glucose_qc --covarFile FG-south.txt --covarCol age --covarCol Age2 --covarCol PC{1:6} --strict --bsize 1000 --qt --lowmem --write-samples --out FG-south-raw-step1



regenie --threads 8 --step 2 --bed ~/imputed_data_plink/all_imputed_map_qc --phenoFile FG-south.txt --phenoCol glucose_qc --covarFile FG-south.txt --covarCol age --covarCol Age2 --covarCol PC{1:6} --strict --bsize 200 --qt --lowmem --pred FG-south-raw-step1_pred.list --out FG-south-bmiunadj
  
```

```python
5. popcorn.sh
  A script for running cross ancestry genetic correlation using POPCORN tool. AWI-GEN and public available GWAS data were used
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


```

```python
6. gwas_data_cleanup.sh
A script for cleaning gwas results before running genetic correlation using POPCORN
#README


#Format gwas files magic data
#Below scripet replaces he headers with popcorn specific format

sed '1s/.*/SNP\tchr\tpos\tA2\tA1\tAF\tbeta\tSE\tP\tN/' MAGIC100i0G_FG_AA.tsv>output_file.txt

### omit p value column

awk '{for(i=1;i<=NF;i++) if(i!=9) printf "%s%s", $i, (i==NF ? "\n" : OFS)}' OFS="\t" output_file.txt> magic-eur.txt


#### remove SNPs with missing data and structrural variants

grep -v "NA" magic-eur.txt >m.txt

mv m.txt magic-eur.txt 
awk 'NR==1 || ($4 ~ /^[ACGT]$/ && $5 ~ /^[ACGT]$/)' magic-eur.txt >magic-eur-clean.txt
```

```python
7. updated-rsids-1000genomes.sh
 A script for updating rsids in 1000 genomes as a preparation step for running genetic correlation using POPCORN
 #!/bin/env bash
#SBATCH -p batch
#SBATCH -w n02
#SBATCH -J plink
#SBATCH -c 10 ##number of cores
#SBATCH --mem=10G
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8

module load plink  

#script to update rsids in 1g plink files

awk 'FNR==NR {a[$1":"$2]=$3; next} {if($1":"$4 in a) print $2, a[$1":"$4]}' reference.txt 1000g-b.bim > mapping.txt

plink --bfile kg --update-name mapping.txt 2 1 --make-bed --out updated_1g
##### remove duplicates SNPS
plink --bfile updated_1g --extract snps_to_keep.txt --make-bed --out updated_1000
```

```python
8. Manhattan-qq.r
A script to generate Manhattan and qq plots of the gwas results

png("FI—maleINT-manp.png", width=2000,height=800,res=150)
 par(mar = c(5.1, 4.1, 1.1, 2.1))
par(las=1)
xlas=2
manhattan(FG, chr="CHR", bp="BP", snp="SNP", p="P_BOLT_LMM", logp = TRUE, main = "Manhattan Plot", ylim = c(0, 8),cex = 0.6, cex.axis = 0.9,xlab = "Chromosome",col = c("steelblue4", "orange3"), suggestiveline = 1e-6, genomewideline = 5e-08) 
dev.off()

 png("FI-male-INT-qq.png", width=1000,height=500,res=150)
 par(mar = c(5.1, 4.1, 1.1, 2.1))
xlas=2
   qq(10^-male$LOG10P, main = "Q-Q plot of GWAS p-values")
dev.off()
```

```python
9. merge-images.R
 ### Script for merging manhattan and locuszoom plots
# Load the magick package
library(magick)

# Read the two images
image1 <- image_read("/Users/vivienchebii/Documents/new-plots/Manhatan-FG24.png")  # Replace with your file path
image2 <- image_read("/Users/vivienchebii/Documents/new-plots/FG-locuszoom.png")  # Replace with your file path

# Get dimensions of the images
dim1 <- image_info(image1)
dim2 <- image_info(image2)

# Check the heights of both images
height1 <- dim1$height
height2 <- dim2$height

# Resize the larger image to match the height of the smaller one
if (height1 > height2) {
  image1 <- image_resize(image1, paste0(dim2$width, "x", height2, "!"))  # Resize image1 to match height2
} else if (height2 > height1) {
  image2 <- image_resize(image2, paste0(dim1$width, "x", height1, "!"))  # Resize image2 to match height1
}

# Combine the images vertically
combined_image <- image_append(c(image1, image2), stack = TRUE)

# Display the combined image
print(combined_image)

# Save the combined image (optional)
image_write(combined_image, path = "combined_image.jpg", format = "jpg")
```

```python
10. Finemapping-windowbased.sh


#SBATCH -w n02
#SBATCH -J finemap2
#SBATCH -c 12 ##number of cores
#SBATCH --mem=30000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8

module load bioinf
module load python/3.9
module load java/18
rm -rf ~/.nextflow/assets/h3abionet/
#rm ~/.singularity/*.img
nextflow pull h3abionet/h3agwas

nextflow run  h3abionet/h3agwas/finemapping/finemap_region.nf --begin_seq 31700274 --end_seq 32161594 --chro 18 --head_pval P_BOLT_LMM --head_bp BP --head_chr CHR --head_rs SNP --head_beta BETA --head_se SE --head_A1 ALLELE1 --head_A2 ALLELE0 --input_dir "~/shared/imputed_data_plink/" --input_pat all_imputed_map_qc --file_gwas "~/FG_raw/boltlmm/all_imputed_map_qc
-glucose_qc.imp.stat" --list_phenogc "Fasting glucose" --output_dir "~/FG_raw/finemap24" --output finemapping_FG24 -profile slurmSingularity -r dev
```

```python
11. Finemapping.sbatch :Fine mapping based on rsids

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
```

```python
12: cojo.sbatch: script for conditional analysis to identify secondary signals
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


```

```python
13: 1000g-pop-specific-plink.sh- script for extraction genome data from sub-populations in 1000 human genomes using plink

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
```

```python
14:gcta.sbatch -script to estimate snp heritability and correlation of the quantitative traits 

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
```

```python
15:swap-alleles.sh- A script to flip alleles in the data to match the reference genome

awk 'NR==FNR { 
    # Store reference alleles in an array
    ref[$1] = $2; 
    alt[$1] = $3; 
    next; 
} 
{
    # Check if SNP exists in reference
    if ($1 in ref) { 
        # Compare REF and ALT in GWAS with REF and ALT in reference
        if ($2 != ref[$1] || $3 != alt[$1]) {
            # Swap alleles and negate BETA if they do not match
            print $1, alt[$1], ref[$1], -$4;
        } else {
            # If they match, print as it is
            print $0;
        }
    } else {
        # Print line if SNP is not found in reference
        print $0;
    }
}' 1000-rsi.vcf FG.stat > swapped_gwas_data.txt


```

```python
16. gwas_data_formating-for-popcorn.sh- bash script to format and clean gwas summary stat file for use by POPCORN program


#README


#Format gwas files magic data
#Below scripet replaces he headers with popcorn specific format

sed '1s/.*/SNP\tchr\tpos\tA2\tA1\tAF\tbeta\tSE\tP\tN/' MAGIC100i0G_FG_AA.tsv>output_file.txt

### omit p value column

awk '{for(i=1;i<=NF;i++) if(i!=9) printf "%s%s", $i, (i==NF ? "\n" : OFS)}' OFS="\t" output_file.txt> magic-eur.txt


#### remove SNPs with missing data and structrural variants

grep -v "NA" magic-eur.txt >m.txt

mv m.txt magic-eur.txt 
awk 'NR==1 || ($4 ~ /^[ACGT]$/ && $5 ~ /^[ACGT]$/)' magic-eur.txt >magic-eur-clean.txt
```

```python
17. 1000-genomes-rsid-update.sh- A script to update 1000 genomes rsid

#!/bin/env bash
#SBATCH -p batch
#SBATCH -w n02
#SBATCH -J plink
#SBATCH -c 10 ##number of cores
#SBATCH --mem=10G
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8

module load plink

#script to update rsids in 1g plink files

#awk 'FNR==NR {a[$1":"$2]=$3; next} {if($1":"$4 in a) print $2, a[$1":"$4]}' reference.txt 1000g-b.bim > mapping.txt

#plink --bfile kg --update-name mapping.txt 2 1 --make-bed --out updated_1g
##### remove duplicates SNPS
plink --bfile updated_1g --extract snps_to_keep.txt --make-bed --out updated_1000
```

```python
18:site-pcs.sbatch

#### A script to perform  pca, in this case regionwise pcs

#!/bin/env bash
#SBATCH -p batch
#SBATCH -J flashpca
#SBATCH -c 16 ##number of cores
#SBATCH --mem=16000
##SBATCH --error slurm-A%.out
##SBATCH --array=1-8


./flashpca_x86-64 --bfile nai-clean-ldpruned --numthreads 16 -d 10 --outpc ~/nai2-flash.pc --outval ~/sitewise/nai2-flash-val 

```

```python
19: qc2.sbatch-Help scripts used to recheck data QC
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


```

```python

```