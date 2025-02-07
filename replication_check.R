# Load necessary libraries
library(dplyr)

# Example GWAS data frames
# gwas1 <- read.csv("path_to_gwas1.csv")  # Load your first GWAS data
# gwas2 <- read.csv("path_to_gwas2.csv")  # Load your second GWAS data

# Ensure the SNP columns are characters
gwas1$SNP <- as.character(gwas1$SNP)
gwas2$SNP <- as.character(gwas2$SNP)

# Step 1: Find replicated SNPs
replicated_snps <- inner_join(gwas1, gwas2, by = "SNP", suffix = c("_gwas1", "_gwas2"))

# Step 2: Check for allele swaps and adjust effect sizes
replicated_snps <- replicated_snps %>%
  mutate(
    # Check if alleles match; if not, swap the alleles
    alleles_match = (ALLELE1_gwas1 == ALLELE1_gwas2 & ALLELE0_gwas1 == ALLELE0_gwas2) |
      (ALLELE1_gwas1 == ALLELE0_gwas2 & ALLELE0_gwas1 == ALLELE1_gwas2),
    
    # Adjust effect sizes based on allele swaps
    beta_gwas2 = ifelse(ALLELE1_gwas1 == ALLELE0_gwas2, -beta_gwas2, beta_gwas2),
    
    # Create a final data frame for output with relevant columns
    output = ifelse(alleles_match, SNP, NA)
  ) %>%
  filter(!is.na(output))

# Step 3: Print replicated SNPs
print(replicated_snps)

# Step 4: Write the results to a file
write.csv(replicated_snps, "replicated_snps.csv", row.names = FALSE)
