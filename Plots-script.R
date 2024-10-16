install.packages("qqman")

##Change colour of the plot


#col = c("blue4", "orange3")
str(gwasResult)
head(gwasResult)
as.data.frame(table(gwasResult$CHR))
manhattan(gwasResult, chr="CHR", bp="BP", snp="SNP", p="P_BOLT_LMM",col = c("blue4", "orange3"))

manhattan(gwasResult, annotatePval = 0.00000005, annotateTop = FALSE, p="P_BOLT_LMM")
manhattan(gwasResult, annotatePval = 0.00000005, annotateTop = TRUE, p="P_BOLT_LMM")
##### Regenie2 use this for magic
png("FG-fem-raw-manp.png", width=2000,height=800,res=150)
par(mar = c(5.1, 4.1, 1.1, 2.1))
xlas=2
manhattan(female,chr = "CHROM", bp = "GENPOS",snp="ID", p = "LOG10P", logp = FALSE, main = "Manhattan Plot", ylim = c(0, 8),cex = 0.6, cex.axis = 0.9,xlab = "Chromosome",col = c("steelblue4", "orange3"), suggestiveline = 6, genomewideline = 7.3) 
dev.off()

png("FG-fem-rawnobmi-qq.png", width=1000,height=500,res=150)
par(mar = c(5.1, 4.1, 1.1, 2.1))
xlas=2
   qq(10^-female$LOG10P, main = "Q-Q plot of GWAS p-values")
dev.off()

###### The plots can also be created using fastman p
install.packages("remotes")
remotes::install_github("danioreo/fastman")
library("fastman")
fastman(meta, chr = "CHR", ps = "BP", p = "P_BOLT_LMM", main = "Manhattan plot for GWAS results",
        suggest_line = -log10(1e-06), gws_line = -log10(5e-08),
       color = c(col="blue", "grey"), chr_build = "GRCh37", yscale = NA,
        xlab_all = F, turbo = F)
###
png("Man_FG.png", width=2000, height=800,res=150)
par(mar = c(3.1, 4.1, 1.1, 2.1))
xlas=2
fastman(FG, chr = "CHR", ps = "BP", p = "P_BOLT_LMM", main= NULL,
        suggest_line = -log10(1e-06), gws_line = -log10(5e-08),color = c(col="steelblue4", "orange3"),chr_build = "GRCh37", yscale = 9,
        xlab_all = F, turbo = T)
dev.off()

###
par<-(pty='s')
fastqq(gwasResultbmi, p = "P_BOLT_LMM", lambda = F, main = "Q-Q plot")




meta<-read.csv("~/Awi-gen/FG_raw/boltlmm/output/metasoft/metasoft-clean.csv")