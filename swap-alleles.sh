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

