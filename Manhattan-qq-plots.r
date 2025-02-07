install.packages("qqman")
load ("qqman)
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
