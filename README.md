# GWAS-of-glycaemic-traits
This repo contains the sample code that was used in the paper " Genome-wide association study identifies novel risk variants associated with 
glycaemic traits in the continental African AWI-Gen cohort, which has been submitted for consideration for publication in Diabetologia

### Step-by-step details are provided below

# . Association analysis for the 4 glycaemic traits were performed using linear mixed models in boltlmm and REGENIE
# Combined set GWAS was implemented uisng BOLTLMM while regionwise GWAS (East, West and East) were perfomed using REGENIE. The scripts are provided in the main folder (

1. Association  test for FG (raw) was carried using linear mixed models using boltlmm 
   Different covariates were used as below

  -age,sex,bmi,8pcs
  
  -age,sex,8pcs
2. Association  test for FI (log transformed) was carried using linear mixed models using boltlmm 
   Different covariates were used as below

  -age,sex,bmi,8pcs
  
  -age,sex,8pcs
3. Association  test for HOMA-B and HOMA-IR carried using linear mixed models using boltlmm 
   Different covariates were used as below
   -age, sex, bmi. pcs
   -age.sex.8 pc
  
Scripts used include: gwas-boltmm-bmiadj.sbatch for combined set and Regenie.sbatch  regionwise GWAS


  


