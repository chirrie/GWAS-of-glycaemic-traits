   91  ls *.bim
   92  cp African-b*  European-b* ./popcorn-inputfiles/
   93  cp 1000g.* ./popcorn-inputfiles/
   94  cd popcorn-inputfiles/
   95  ls
   96  less -S African-b.bim 
   97  ls
   98  less -S European-b.bim
   99  ls
  100  cd ..
  101  cp -r popcorn-inputfiles/ /tmp
  102  cd Awi-gen/
  103  cd gcta-1.94.1-linux-kernel-3-x86_64/
  104  ls
  105  cd Popcorn/
  106  ls
  107  ssh n02
  108  ls
  109  cd Awi-gen/
  110  ls
  111  cd gcta-1.94.1-linux-kernel-3-x86_64/
  112  ls
  113  cd Popcorn/
  114  lc
  115  ls
  116  less -S 1000-genomes.fam
  117  less -S 1000-genomes/bem
  118  less -S 1000-genomes.bim 
  119  ls
  120  wc -l 1000-genomes.bim
  121  less -S 1000-genomes.bim
  122  ls
  123  ls *.bed
  124  ls *.bim
  125  less -S kg.bim
  126  ls
  127  ls *.sh
  128  vi plink.sh 
  129  ls
  130  ls *.bim
  131  cp kg.bim 1000g-b.bim
  132  cp kg.bed 1000g-b.bed
  133  less -S kg.fam 
  134  cp kg.fam 1000g-b.fam
  135  cp 1000g-b* /tmp/popcorn-inputfiles
  136  ls
  137  LS
  138  ls
  139  less AWI_EUR.cscore
  140  grep "rs28692873" 1000GENOMES-phase_3.vcf 
  141  grep "rs28692873" 1000-b.bim
  142  grep "rs28692873" 1000g-b.bim
  143  ls
  144  ls *.sh
  145  vi plink.sh 
  146  ls
  147  ls *.sex
  148  ls
  149  ls *.nosex
  150  less 1000g.nosex 
  151  less output_cleaned.nosex
  152  ls
  153  less 1000g.nosex 
  154  vi plink-1000.sh 
  155  ls
  156  ls *.sh
  157  vi sample-pop.sh 
  158  ls
  159  vi plink.sh 
  160  ls
  161  less *.fam
  162  ls
  163  vi readme-downloading-1000g 
  164  ls
  165  less 1000g.names
  166  less 1000.nosex
  167  less 1000g.nosex
  168  ls
  169  head -n 1 1000g.names
  170  head -n 3 1000g.names
  171  grep "rs575272151" 1000g.names
  172  grep "rs575272151" 1000g-b.bim
  173  less -S 1000-b.bim
  174  less -S 1000g-b.bim
  175  grep "rs376342519" 1000g-b.bim
  176  grep "rs376342519" 1000g.names
  177  grep "rs376342519" 1000GENOMES-phase_3.vcf 
  178  less -S 1000g-b.bim
  179  grep "rs141149254" 1000GENOMES-phase_3.vcf 
  180  grep "rs141149254" 1000g-b.bim
  181  grep "rs141149254" 1000g.names
  182  wc -l 1000g.names 
  183  wc -l 1000g-b.bim
  184  ls
  185  grep "rs" 1000-b.bim|wc -l
  186  grep "rs" 1000-g.bim|wc -l
  187  grep "rs" 1000g-b.bim|wc -l
  188  wc -l 1000GENOMES-phase_3.vcf 
  189  grep -v "rs" 1000GENOMES-phase_3.vcf 
  190  ls
  191  vi plink.sh 
  192  cp plink.sh ./tmp/popcorn-inputfiles/
  193  cp plink.sh /tmp/popcorn-inputfiles/
  194  cp EUR_samples.txt /tmp/popcorn-inputfiles/
  195  ls
  196  wc -l 1000-rsi.vcf 
  197  head -n 1 1000-rsi.vcf
  198  head -n 2 1000-rsi.vcf
  199  head -n 20 1000GENOMES-phase_3.vcf
  200  ls
  201  less 1000-ref.vcf 
  202  head -n 1000-ref.vcf 
  203  head -n 4 1000-ref.vcf 
  204  head -n 1 1000-b.bim
  205  head -n 1 1000g-b.bim
  206  grep "1_10236" 1000g-b.bim
  207  ls *.sh
  208  vi chrom_rsid.sh 
  209  vi plink-1000-rsid.sh 
  210  head -n 1 1000GENOMES-phase_3.vcf 
  211  head -n 1 1000-ref.vcf
  212  head -n 2 1000-ref.vcf
  213  vi plink-1000-rsid.sh 
  214  head -n 1 1000-b.bim
  215  head -n 1 1000g-b.bim
  216  grep "rs" 1000g-b.bim|head -n 1 3
  217  grep "rs" 1000g-b.bim|head -n 10
  218  grep "rs145072688" 1000-ref.vcf 
  219  grep "rs199856693" 1000-ref.vcf 
  220  grep "rs200482301" 1000-ref.vcf 
  221  grep "rs374029747" 1000-ref.vcf 
  222  grep "rs" 1000g-b.bim|head -n 10
  223  head -n 2 1000-ref.vcf
  224  awk '{print $1,$2,$3}' 1000-ref.vcf>chrom_rsid.txt 
  225  less -S chrom_rsid.txt
  226  vi chrom_rsid.txt
  227  less -S chrom_rsid.txt
  228  head -n 1 1000g-b.bim 
  229  # Use awk to join your .bim and reference file by chromosome and base-pair position
  230  awk 'FNR==NR {a[$1":"$4]=$2; next} {print $2, a[$1":"$4]}' chrom_pos_rsid.txt 1000g-b.bim > mapping.txt
  231  awk 'FNR==NR {a[$1":"$4]=$2; next} {print $2, a[$1":"$4]}' chrom_rsid.txt 1000g-b.bim > mapping.txt
  232  head -n 1 mapping.txt 
  233  head -n 1 chrom_rsid.txt
  234  rm chrom_rsid.txt
  235  head -n 1 chrom_pos_rsid.txt~ 
  236  rm chrom_pos_rsid.txt~ 
  237  head -n 1 1000-ref.vcf 
  238  head -n 1 1000-ref.vcf
  239  head -n 1 1000-ens.vcf 
  240  awk '{print $1,$2,$3}' 1000-ref.vcf>reference.txt
  241  head -n 10 reference.txt 
  242  head -n 1- 1000g-b.bim
  243  head -n 10 1000g-b.bim
  244  head -n 10 reference.txt 
  245  head -n 15 reference.txt 
  246  head -n 15 1000g-b.bim
  247  grep -v "rs" 1000g-b.bim >1000c.bim
  248  head -n 1 1000c.bim
  249  head -n 10 1000c.bim
  250  head -n 10 reference.txt 
  251  head -n 15 1000c.bim
  252  head -n 15 reference.txt 
  253  head -n 1 3- 1000g-b.bim
  254  head -n 20 1000g-b.bim
  255  grep "rs376342519" reference.txt 
  256  grep "rs201725126" reference.txt 
  257  grep "rs200579949" reference.txt 
  258  awk 'FNR==NR {a[$1":"$4]=$2; next} {print $2, a[$1":"$4]}' reference.txt 1000g-b.bim > mapping.txt
  259  awk 'FNR==NR {a[$1":"$4]=$2; next} {print $2, a[$1":"$4]}' 1000g-b.bim reference.txt> mapping.txt
  260  awk 'FNR==NR {a[$1":"$2]=$3; next} {print $3, a[$2":"$3]}' reference.txt 1000g-b.bim > mapping.txt
  261  awk 'FNR==NR {a[$1":"$2]=$3; next} {if($1":"$4 in a) print $2, a[$1":"$4]}' reference.txt 1000g-b.bim > mapping.txt
  262  vi chrom_rsid.sh 
  263  vi plink-1000-rsid.sh 
  264  ls
  265  sbatch plink.sh
  266  squeue -u chebii
  267  vi
  268  squeue -u chebii
  269  ls
  270  ls *.bims 
  271  ls *.bim
  272  less slurm-220002.out 
  273  squeue -u chebii
  274  less slurm-220002.out 
  275  scancel 220002
  276  vi plink-1000-rsid.sh 
  277  sbatch plink-1000-rsid.sh 
  278  squeeu -u chebii
  279  squeue -u chebii
  280  less slurm-220003.out 
  281  vi plink-1000-rsid.sh 
  282  rm slurm-22000*
  283  sbatch plink-1000-rsid.sh
  284  squeue -u chebii
  285  less slurm-220004.out 
  286  rm slurm-220004.out 
  287  vi plink-1000-rsid.sh 
  288  sbatch plink-1000-rsid.sh
  289  squeue -u chebii
  290  less slurm-220005.out 
  291  less update_1g.bim
  292  less -S updated_1g.fam
  293  less -S updated_1g.bim
  294  grep 'rs' updated_1g.bim|wc -l
  295  vi popcorn.sh 
  296  vi plink.sh 
  297  sbatch plink.sh 
  298  squeue -u chebii
  299  sbatch plink.sh 
  300  squeue -u chebii
  301  scancel  220006  220007 
  302  squeue -u chebii
  303  sbatch plink.sh 
  304  squeue -u chebii
  305  less slurm-220008.out 
  306  squeue -u chebii
  307  wc -l European-b.bim 
  308  rm Europeans
  309  rm Europeans*
  310  ls
  311  less -S European-b.bim 
  312  less -S African-b.bim
  313  ls
  314  vi popcorn.sh 
  315  ls
  316  rm *.cscore
  317  ls
  318  rm slurm-22000*
  319  ls
  320  rm AWI-FG-AA_nomun-correlation*
  321  ls
  322  rm AFR.bed
  323  rm AFR.bim
  324  rm AFR.fam
  325  rm swap*
  326  ls
  327  rm 1000-genome*
  328  ls
  329  sbatch popcorn.sh 
  330  squeue -u chebii
  331  ls
  332  vi popcorn.sh 
  333  less AWI_EUR-b.cscore.o.log
  334  ls
  335  vi popcorn.sh 
  336  ls
  337  rm slurm-220009.out 
  338  rm *.log
  339  ls
  340  wc -l updated_1g.bim
  341  wc -l updated_1g.fam
  342  sbatch popcorn.sh
  343  awk '{print $2}' update_1g.bim | sort | uniq -d
  344  awk '{print $2}' updated_1g.bim | sort | uniq -d
  345  vi
  346  sh dup2.sh
  347  ls *.sbatch
  348  sbatch dup2.sh
  349  ls *.sbatch
  350  ls *.sh
  351  vi data.sh
  352  vi dup.sh 
  353  squeue -u chebii
  354  sbatch dup.sbatch 
  355  vi dup.s
  356  vi dup.sbatch
  357  sbatch dup.sbatch
  358  squeue -u chebii
  359  less slurm-220013.out 
  360  less -S European-b.bim
  361  squeue -u chebii
  362  ls
  363  wc -l updated-c_1g.bim
  364  mv updated-c_1g.bim updated_1g.bim
  365  vi plink.sh 
  366  sbatch plink.sh
  367  ls
  368  ls *.bim
  369  head -n 10 kg.bim
  370  grep "rs145072688" updated_1g.bim
  371  squeue -u chebii
  372  ls
  373  less slurm-220016.out
  374  ls
  375  less -S updated_1g.bed
  376  ls
  377  less slurm-220016.out 
  378  wc -l kg.bim
  379  ls
  380  ls *.sh
  381  vi plink.sh 
  382  ls
  383  ls *.sh
  384  vi chrom_rsid.sh 
  385  vi plink-1000-rsid.sh
  386  head -n 1 updated_1g.bim
  387  awk '{print $2}' updated_1g.bim >snps_to_keep.txt
  388  sbatch plink-1000-rsid.sh 
  389  vi plink-1000-rsid.sh
  390  ls
  391  squeue -u chebii
  392  ls
  393  rm sl*
  394  pwd
  395  squeue -u chebii
  396  ls
  397  vi plink-1000-rsid.sh 
  398  sbatch plink-1000-rsid.sh 
  399  squeue -u chebii
  400  ls
  401  wc -l updated_1g.bim
  402  wc -l kg.bim
  403  vi plink-1000-rsid.sh 
  404  sbatch plink-1000-rsid.sh 
  405  less -S updated_1g.bim
  406  vi dup.sbatch 
  407  vi dup2.sh 
  408  sbatch dup.sbatch 
  409  squeue -u chebii
  410  ls
  411  wc -l updated_1000.bim
  412  wc -l updated_1g.bim
  413  ls duplicate_snps.txt 
  414  less duplicate_snps.txt 
  415  rm duplicate_snps.txt 
  416  ls
  417  rm updat_1g.bim
  418  less slurm-220020.out 
  419  rm slurm-2200*
  420  ls
  421  vi dup2.sh
  422  awk '{print $2}' updated_1000.bim | sort | uniq -d > updatekg23.bim
  423  squeue -u chebii
  424  ssh n02
  425  ls
  426  cd tmp
  427  cd /tmp
  428  ls
  429  cd popcorn-inputfiles/
  430  ls
  431  wc -l 1000g.fam
  432  less -S 1000g.fam
  433  ls
  434  rm 1000g.*
  435  ls
  436  pwd
  437  cd /dataB/
  438  ls
  439  cd popdata/
  440  ls
  441  cd 1k-2014
  442  ls
  443  less -S kg.fam
  444  ls
  445  vi README 
  446  cd ..
  447  cd /tmp
  448  cd ~
  449  cd Awi-gen/
  450  ls
  451  cd gcta-1.94.1-linux-kernel-3-x86_64/
  452  ls
  453  cd Popcorn/
  454  ls
  455  less mapping.txt 
  456  head -n1 reference.txt 
  457  head -n 1 1000g-b.bim 
  458  vi reference.txt 
  459  less mapping.txt 
  460  ls
  461  ls *.bim
  462  less -S 1000c.bim 
  463  rm 1000c.bim 
  464  less slurm-220013.out 
  465  squeue -u chebii
  466  awk '{print $2, $1, $4}' updated_1g.bim | sort | uniq -d
  467  vi
  468  sh dup.sh 
  469  squeue -u chebii
  470  ls
  471  less -S update23.bim
  472  grep "rs10003517" updated_1g.bim
  473  cp dup.sbatch remove-dup.sbatch
  474  vi remove-dup.sbatch 
  475  ls
  476  squeue -u chebii
  477  ls
  478  wc -l updat_1g.bim
  479  rm updat_1g.bim
  480  rm update23.bim
  481  less update-1grsids
  482  sbatch remove-dup.sbatch 
  483  squeue -u chebii
  484  scancel 220013
  485  ls
  486  ls  *.bim
  487  rm European-b*  Africans.* African-b.* 1000g.* 1000g-b*
  488  cd /tmp
  489  ls
  490  cd popcorn-inputfiles/
  491  ls
  492  cp 1000g-b.* /home/chebii/Awi-gen/gcta-1.94.1-linux-kernel-3-x86_64/Popcor
  493  cp 1000g-b.* /home/chebii/Awi-gen/gcta-1.94.1-linux-kernel-3-x86_64/Popcorn
  494  cd /home/chebii/Awi-gen/gcta-1.94.1-linux-kernel-3-x86_64/Popcorn
  495  ls
  496  less -S updatekg23.bim
  497  squeue -u chebii
  498  less updatekg23.bim 
  499  vi dup2.sh 
  500  sbatch dup.sbatch 
  501  squeue -u chebii
  502  less updatekg23.bim 
  503  grep "rs10003517" updatekg23.bim
  504  grep "rs10003517" updated_1000.bim
  505  vi remove-dup.sbatch 
  506  rm updat_1g.bim
  507  squeue -u chebii
  508  ls
  509  wc -l updatekg23.bim
  510  ls
  511  vi remove-dup.sbatch 
  512  sbatch remove-dup.sbatch 
  513  squeue -u chebii
  514  less slurm-220022.out 
  515  vi remove-dup.sbatch 
  516  rm slurm-22002*
  517  sbatch remove-dup.sbatch 
  518  squeue -u chebii
  519  less slurm-220023.out 
  520  wc -l snps_to_keep.txt 
  521  vi plink-1000-rsid.sh 
  522  sbatch plink-1000-rsid.sh 
  523  squeue -u chebii
  524  ls
  525  wc -l updated_1000.bim
  526  wc -l updated_1g.bim
  527  vi plink.sh 
  528  sbatch plink.sh 
  529  squeue -u chebii
  530  less slurm-220025.out 
  531  rm slurm-22002*
  532  vi plink.sh 
  533  sbatch plink.sh
  534  squeue -u chebii
  535  ls
  536  ls *.bim
  537  less -S European-b.bim
  538  rm updatekg23.bim
  539  wc -l updated_1000.bim
  540  vi popcorn.sh 
  541  sbatch popcorn.sh
  542  squeue -u chebii
  543  exit
  544  ls
  545  cd Magic
  546  cd MAGIC
  547  ls
  548  cd /dataE/AWIGenGWAS/
  549  ls
  550  cd shared/
  551  ls
  552  cd imputed_data_plink_sitewise/
  553  ls
  554  wc -l southeast.fam 
  555  wc -l westafrica.fam 
  556  wc -l nan.bim
  557  wc -l nai.fam
  558  less southeast.log
  559  ls
  560  wc -l nai.fam
  561  cp nai.* southafrica.* westafrica.*/home/chebii/Awi-gen/FG_init_chou/sitewise
  562  cp nai.* southafrica.* westafrica.* /home/chebii/Awi-gen/FG_init_chou/sitewise/
  563  ls
  564  cd ..
  565  ls
  566  cd imputed_data_plink_sitewise
  567  ls
  568  cd ..
  569  ls
  570  cd score_imputed_data/
  571  ls
  572  cd ScoreImpV3
  573  ls
  574  cd ..
  575  ls
  576  cd ..
  577  ls
  578  cd plots
  579  ls
  580  cd ..
  581  ls
  582  cd plink
  583  ls
  584  cd nai
  585  ls
  586  cd output/
  587  ls
  588  cd ..
  589  ls
  590  cd ..
  591  ls
  592  cd ..
  593  ls
  594  cd submission/
  595  ls
  596  cd ..
  597  ls
  598  cd ~
  599  ls
  600  cd MAGIC
  601  ls
  602  cd pca
  603  ls
  604  vi flashpca.sbatch 
  605  vi qc.sbatch 
  606  vi pc-ins.sbatch 
  607  sbatch region-prune.sh 
  608  squeue -u chebii
  609  vi region-prune.sh 
  610  squeue -u chebii
  611  ls
  612  vi flashpca.sbatch 
  613  sbatch site-flash.sbatch 
  614  squeue -u chebii
  615  ls
  616  less slurm-220042.out 
  617  rm slurm-22004*
  618  vi site-flash.sbatch 
  619  sbatch site-flash.sbatch 
  620  squeue -u chebii
  621  ls *.sbatch
  622  squeue -u chebii
  623  ls
  624  less slurm-220045.out 
  625  vi region-prune.sh
  626  sbatch region-prune.sh 
  627  squeue -u chebii
  628  ls
  629  vi qc_2.sbatch 
  630  ls
  631  vi site-flash.sbatch 
  632  sbatch site-flash.sbatch 
  633  vi region-prune.sh
  634  sbatch region-prune.sh
  635  squeue -u chebii
  636  ls
  637  exit
  638  ssh n02
  639  cd Awi-gen/
  640  cd FG_init_chou/
  641  ls
  642  cd sitewise/
  643  ls
  644  ssh no2
  645  awk 'NR==1 {for (i=1; i<=NF; i++) h[$i]=i} NR==1 {print "FID IID site age sex glucose_qc bmi_c_qc insulin_qc"} NR>1 {print $h["FID"], $h["IID"], $h["site"], $h["age"], $h["sex"], $h["glucose_qc"], $h["bmi_c_qc"], $h["insulin_qc"]}' West-fg.txt > m.txt
  646  head -n 1 m.txt 
  647  mv m.txt West-fg.txt 
  648  vi
  649  ls
  650  rm Est-sig.txt 
  651  vi East-fg.txt 
  652  head -n 1 East-fg.txt 
  653  head -n 1 nai-flash.pc 
  654  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }' East-fg.txt nai-flash.pc>East_withpc.txt
  655  head -n 1 East_withpc.txt 
  656  cd ..
  657  cd MAGIC
  658  ls
  659  cd pca
  660  ls
  661  vi site-flash.sbatch 
  662  sbatch site-flash.sbatch 
  663  ls
  664  squeue -u chebii
  665  ls
  666  cd Awi-gen/
  667  ls
  668  cd gcta-1.94.1-linux-kernel-3-x86_64/
  669  ls
  670  cd Popcorn/
  671  ls
  672  less slurm-220027.out 
  673  squeue -u chebii
  674  vi popcorn.sh 
  675  cp popcorn.sh  pop-awi.af.sh 
  676  vi pop-awi.af.sh 
  677  sbatch pop-awi.af.sh 
  678  squeue -u chebii
  679  ls
  680  squeue -u chebii
  681  ls
  682  squeue -u chebii
  683  ls
  684  squeue -u chebii
  685  ls
  686  cd tmp
  687  cd /tmp
  688  ls
  689  mkdir glycaemic-gwas
  690  cd glycaemic-gwas/
  691  pwd
  692  ls
  693  wc -l FG_bmiadjusted.stat 
  694  ls
  695  rm FI_bmiunadjusted.stat
  696  pwd
  697  ls
  698  cd Awi-gen/
  699  ls
  700  cd FG_init_chou/
  701  ls
  702  rm MAGIC_postchallengeIR_ISI_adjBM*
  703  ls
  704  cd ..
  705  ls
  706  cd FG_init_chou/
  707  ls
  708  cd sitewise/
  709  ls
  710  mv output/ gemma
  711  ls
  712  mv gemma.sbatch ./gemma
  713  mv ComputeGemmaMat.bash ./gemma/
  714  ls
  715  cd bolt
  716  ls
  717  cd ..
  718  ls
  719  cd bolt/
  720  ls
  721  mv *.txt ~/Awi-gen/FG_init_chou/sitewise/
  722  ls
  723  cd ..
  724  ls
  725  cd East
  726  ls
  727  mv East-fg.txt ~/Awi-gen/FG_init_chou/sitewise/
  728  cd ~/Awi-gen/FG_init_chou/sitewise/
  729  ls
  730  head -n 1 East-fg.txt 
  731  ls
  732  cd East
  733  ls
  734  wc -l East.fam
  735  ls
  736  wc -l east.fam
  737  wc -l  East.fam
  738  cd ..
  739  ls
  740  pwd
  741  ls
  742  rm -r East South West
  743  ls
  744  rm SA-sig.txt
  745  ls
  746  pwd
  747  ls
  748  pwd
  749  ls
  750  less -S nai-flash.pc
  751  ls
  752  less nai-flash-val 
  753  ls
  754  head -n 1 head -n 1 East-fg.txt 
  755  awk 'NR==1 {for (i=1; i<=NF; i++) {header[$i] = i}} NR > 1 {print $header["FID"], $header["IID"], $header["site"], $header["age"], $header["sex"], $header["glucose_qc"], $header["bmi_c_qc"], $header["insulin_qc"]}' East-fg.txt >m.txt
  756  head -n 2 m.txt 
  757  awk 'NR==1 {for (i=1; i<=NF; i++) h[$i]=i} NR==1 {print "FID IID site age sex glucose_qc bmi_c_qc insulin_qc"} NR>1 {print $h["FID"], $h["IID"], $h["site"], $h["age"], $h["sex"], $h["glucose_qc"], $h["bmi_c_qc"], $h["insulin_qc"]}' East-fg.txt >m.txt
  758  head -n 2 m.txt 
  759  mv m.txt  East-fg.txt 
  760  awk 'NR==1 {for (i=1; i<=NF; i++) h[$i]=i} NR==1 {print "FID IID site age sex glucose_qc bmi_c_qc insulin_qc"} NR>1 {print $h["FID"], $h["IID"], $h["site"], $h["age"], $h["sex"], $h["glucose_qc"], $h["bmi_c_qc"], $h["insulin_qc"]}' westafrica. >m.txt
  761  head -n 1 m.txt 
  762  mv m.txt  SA-fg.txt 
  763  ls
  764  cd bolt/
  765  ls
  766  cd ..
  767  ls
  768  cd gemma/
  769  ld
  770  ls
  771  cd ..
  772  ls
  773  head -n 1 East-fg.txt 
  774  head -n 1 East_withpc.txt
  775  wc -l East_withpc.txt
  776  awk '{
  777      for (i = 1; i <= NF; i++) {
  778          if (!seen[i,$i]++) {
  779              printf "%s%s", $i, (i<NF ? OFS : ORS)
  780          }
  781      }
  782  }' East_withpc.txt >m.txt
  783  head -n 1 m.txt 
  784  rm m.txt 
  785  vi East_withpc.txt 
  786  vi gwasbolt4.sbatch 
  787  ls
  788  vi gwasbolt4.sbatch 
  789  sbatch gwasbolt4.sbatch 
  790  squeue -u chebii
  791  cd ..
  792  ls
  793  cp FG_phe-tail-chou.stat /tmp/glycaemic-gwas/FG_bmiadjusted.stat
  794  cp FG_phe-tail-chounobmi.stat /tmp/glycaemic-gwas/FG_bmiunadjusted.stat
  795  ls
  796  cd ..
  797  ls
  798  cd FI
  799  ls
  800  cd FI-24
  801  ls
  802  cp FI-pmol31.stat /tmp/glycaemic-gwas/FI_bmiunadjusted.stat
  803  cp FI-pmol31.stat /tmp/glycaemic-gwas/FI_bmiadjusted.stat
  804  ls
  805  rm m
  806  rm m.txt 
  807  vi gwasbolt4.sbatch 
  808  ls
  809  vi gwasbolt-old.sbatch 
  810  ls
  811  wc -l FI-quantative.txt
  812  cp gwasbolt4.sbatch gwasboltnobmi.sbatch
  813  vi gwasboltnobmi.sbatch 
  814  sbatch gwasboltnobmi.sbatch 
  815  squeue -u chebii
  816  cd ..
  817  ls
  818  cd quanta-nobmi/
  819  ls
  820  wc -l FI24.tsv 
  821  cd ..
  822  ls
  823  cd quanta-nobmi/
  824  ls
  825  cd boltlmm/
  826  ls
  827  cd ..
  828  ls
  829  cd FI-24
  830  ls
  831  squeue -u chebii
  832  ls
  833  cd ..
  834  ls
  835  cd HOMA-B24/
  836  ls
  837  cp HOMA-B.stat /tmp/glycaemic-gwas/HOMA-B-bmiadjust.stat
  838  cp HOMA-ir.stat /tmp/glycaemic-gwas/HOMA-ir-bmiadjust.stat
  839  cp HOMA-IR.stat /tmp/glycaemic-gwas/HOMA-ir-bmiadjust.stat
  840  ls
  841  squeue -u chebii
  842  ls
  843  cd ..
  844  cd FG_init_chou/
  845  ls
  846  cd sitewise/
  847  ls
  848  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }' SA-fg.txt sa-flash.pcc >m.txt
  849  head -n 1 m.txt 
  850  wc -l m.txt 
  851  vi m.txt 
  852  ls
  853  vi sa-flash.pcc
  854  ls
  855  vi  sai-flash-val
  856  ls
  857  cp gwas-sa.sbatch 
  858  vi gwas-sa.sbatch 
  859  sbatch gwas-sa.sbatch 
  860  squeue -u chebii
  861  ls
  862  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }' W >m.txt
  863  ls
  864  head -n 1 nai2-flash.pc
  865  head -n 3 nai2-flash.pc
  866  head -n 3  nai-flash.pc
  867  ls
  868  rm  nai2*
  869  ls
  870  head -n 1 3 sa-c-flash.pc
  871  head -n  3 sa-c-flash.pc
  872  head -n 1 sa-flash.pcc 
  873  head -n 10 sa-flash.pcc 
  874  head -n 3 sa-flash.pcc 
  875  head -n  3 sa-c-flash.pc
  876  ls
  877  rm sa-c-flash*
  878  ls
  879  cd ..
  880  ls
  881  ls *.stat
  882  mv  ~/Awi-gen/HOMA-B24/
  883  cd ..
  884  ls
  885  cd FI
  886  ls
  887  cd quanta
  888  ls
  889  cd ..
  890  ls
  891  cd ..
  892  lw
  893  ls
  894  cd HOMA-B24/
  895  ls
  896  cd ..
  897  ls
  898  mv all_imputed_map_qc-log10_HOMA-IR.imp.stat ~/Awi-gen/HOMA-B24/
  899  cd HOMA-B24/
  900  ls
  901  cp all_imputed_map_qc-log10_HOMA-IR.imp.stat /tmp/glycaemic-gwas/HOMA-ir-bmiadjust.stat
  902  cd ..
  903  cd FI-24
  904  cd FI/
  905  cd FI-24/
  906  ls
  907  cd ..
  908  ls
  909  cd ..
  910  ls
  911  cd HOMA-B24/
  912  ls
  913  awk '$12 <0.00000005 || NR==1' all_imputed_map_qc-log10_HOMA-IR.imp.stat >m.xt
  914  less -S m.txt 
  915  awk -F '\t' '$12 <0.00000005 || NR==1' all_imputed_map_qc-log10_HOMA-IR.imp.stat >m.xt
  916  less -S m.txt 
  917  ls
  918  less   m.xt
  919  ls
  920  cp all_imputed_map_qc-log10_HOMA-IR.imp.stat /tmp/glycaemic-gwas/HOMA-IR-unadjustedbmi.stat
  921  ls
  922  cd ..
  923  cd MAGIC
  924  ls
  925  cd regen
  926  ls
  927  pwd
  928  vi pc.sbatch 
  929  awk '$12 <0.00000005 || NR==1' all_imputed_map_qc-log10_HOMA-IR.im
  930  ls
  931  cd ..
  932  ls
  933  cd Awi-gen/
  934  ls
  935  cd FI/
  936  ls
  937  cd FI-24/
  938  ls
  939  cd ..
  940  ls
  941  cd ..
  942  cd FG_init_chou/
  943  ls
  944  cd sitewise/
  945  ls
  946  R
  947  cd ..
  948  cd gcta-1.94.1-linux-kernel-3-x86_64/
  949  cd Popcorn/
  950  ls
  951  less -s common_snps.txt 
  952  wc -l common_snps.txt 
  953  grep "rs150029223" /dataE/AWIGenGWAS/shared/imputed_data_plink/all_imputed_map_qc.bim European-b.bim
  954  grep "rs146623218" /dataE/AWIGenGWAS/shared/imputed_data_plink/all_imputed_map_qc.bim European-b.bim
  955  ls
  956  vi popcorn.sh 
  957  grep "rs146623218" /dataE/AWIGenGWAS/shared/imputed_data_plink/all_imputed_map_qc.bim European-b.bim
  958  grep "rs146623218" /dataE/AWIGenGWAS/shared/imputed_data_plink/all_imputed_map_qc.bim 
  959  grep "rs146623218" all_imputed_map_qc.bim
  960  grep "rs146623218" European-b.bim
  961  grep "rs146623218" /dataE/AWIGenGWAS/shared/imputed_data_plink/all_imputed_map_qc.bim 
  962  grep "rs146623218" European-b.bim
  963  vi data.sh 
  964  sbatch data.sh 
  965  squeue -u chebii
  966  less data.sh 
  967  vi data.sh 
  968  sbatch data.sh
  969  squeue -u chebii
  970  less
  971  wc -l common-b_snps.txt 
  972  less -S common-b_snps.txt 
  973  wc -l common-b_snps.txt 
  974  vi popcorn.sh 
  975  cp European-b.* African-b.* /tmp/popcorn-inputfiles/
  976  vi plink.sh 
  977  ls
  978  cp updated_1000* /tmp/popcorn-inputfiles/
  979  lw
  980  squeue -u chebii
  981  ls
  982  grep "rs574173815" A
  983  grep "rs574173815" ALL.wgs.phase3_shapeit2_mvncall_integrated_v5c.20130502.sites.vcf
  984  grep "rs574173815" 1000GENOMES-phase_3.vcf 
  985  cd ..
  986  ls
  987  cd ..
  988  cd FI/
  989  ls
  990  cd ..
  991  ls
  992  cd FG_init_chou/
  993  ls
  994  cd sitewise/
  995  ls
  996  cd FI
  997  ls
  998  exit
  999  ssh n02
 1000  exit
 1001  ls
 1002  cd Awi-gen/
 1003  ls
 1004  cd FI
 1005  ls
 1006  cd FI-24/
 1007  ls
 1008  head -n 1 FI.txt 
 1009  head -n 2 FI.txt 
 1010  awk '$4 == 1 || $4 == 2 || $4 == 6' FI.txt >SA.txt
 1011  wc -l SA.txt 
 1012  awk '$3 == 1 || $3 == 2 || $3 == 6' FI.txt >SA.txt
 1013  wc -l SA.txt 
 1014  awk '$3 ==3' FI.txt >East.txt
 1015  wc -l East.txt 
 1016  head -n 1 East.txt 
 1017  awk 'NR==1 || $3 == 1 || $3 == 2 || $3 == 6' FI.txt >SA.txt 
 1018  wc -l SA.txt
 1019* awk 'NR==1 || $3 ==3' FI.txt >Wes.txt 
 1020  wc -l East.txt 
 1021  awk 'NR==1 || $3 == 5 || $3 == 4' FI.txt >West.txt 
 1022  ls
 1023  wc -l East.txt West.txt SA.txt 
 1024  cd ..
 1025  ls
 1026  cd HOMA-B24/
 1027  ls
 1028  awk 'NR==1 || $3 == 1 || $3 == 2 || $3 == 6' HOMA-B.txt >SA-HB.txt 
 1029  wc -l SA-HB.txt 
 1030  head -n 1 HOMA-B.txt
 1031  rm SA-HB.txt 
 1032  awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}' HOMA-B.txt >m.txt
 1033  head -n 1 m.txt 
 1034  awk 'NR==1 || $3 == 1 || $3 == 2 || $3 == 6' m.txt >SA-HB.txt 
 1035  awk 'NR==1 || $3 == 5 || $3 == 4 ' m.txt >West-HB.txt 
 1036  awk 'NR==1 || $3 ==3 ' m.txt >East-HB.txt 
 1037  wc -l East-HB.txt West-HB.txt SA-HB.txt 
 1038  head -n 1 HOMA--IR.txt
 1039  head -n 1 HOMA-IR.txt
 1040  awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}' HOMA-IR.txt >m.txt
 1041  head -n 1 m.txt 
 1042  awk '{print $1, $2, $3, $4, $5 ,$7, $8, $9, $10,$12}' HOMA-IR.txt >m.txt
 1043  head -n 1 m.txt 
 1044  awk 'NR==1 || $3 == 1 || $3 == 2 || $3 == 6' m.txt >SA-HR.txt 
 1045  awk 'NR==1 || $3 == 5 || $3 ==4' m.txt >West-HR.txt 
 1046  awk 'NR==1 || $3 ==3' m.txt >East-HR.txt 
 1047  rm m.txt 
 1048  wc -l East-HR.txt West-HR.txt SA-HR.txt 
 1049  cd ..
 1050  cd FI/FI-24
 1051  ls
 1052  awk 'NR==FNR{a[$1]=$0; next} FNR==1 {print $0} FNR>1 && $1 in a {print $0, a[$1]}' SA.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/ sa-flash.pcc | awk '!seen[$0]++' >SA_withpc.txt
 1053  awk 'NR==FNR{a[$1]=$0; next} FNR==1 {print $0} FNR>1 && $1 in a {print $0, a[$1]}' SA.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/sa-flash.pcc | awk '!seen[$0]++' >SA_withpc.txt
 1054  head -n 1 SA_withpc.txt 
 1055  awk 'NR==FNR{a[$1]=$0; next} FNR==1 || $1 in a {if (FNR>1) $1=""; print a[$1] FS $0}' SA.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/sa-flash.pcc | awk '!seen[$0]++' >SA_withpc.txt 
 1056  head -n 1 SA_withpc.txt 
 1057  awk 'NR==FNR {a[$1] = $0; next} ($1 in a) {print a[$1], $0}'  SA.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/sa-flash.pcc awk '
BEGIN {OFS="\t"}
NR == 1 {header1 = $1 OFS $2; $1 = $2 = ""; print header1, $0} 
NR > 1 {$1 = $2 = ""; print}' | column -t >SA_withpc.txt 
 1058  awk 'NR==FNR {a[$1] = $0; next} ($1 in a) {print a[$1], $0}'  SA.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/sa-flash.pcc|awk '
BEGIN {OFS="\t"}
NR == 1 {header1 = $1 OFS $2; $1 = $2 = ""; print header1, $0} 
NR > 1 {$1 = $2 = ""; print}' | column -t >SA_withpc.txt 
 1059  head -n 1 SA_withpc.txt 
 1060  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }'  SA.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/sa-flash.pcc> SA_withpc.txt 
 1061  head -n 1 SA_withpc.txt 
 1062  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }' West.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/west-flash.pc> West_withpc.txt 
 1063  head -n 1 West_withpc.txt
 1064  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }' East.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/nai-flash.pc> East_withpc.txt 
 1065  wc -l East_withpc.txt
 1066  cd ..
 1067  cd HOMA-B24/
 1068  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }'  SA-HB.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/sa-flash.pcc> SA_HBpc.txt 
 1069  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }'  SA-HR.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/sa-flash.pcc> SA_HRpc.txt 
 1070  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }'  West-HB.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/west-flash.pc> West_HRpc.txt 
 1071  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }'  West-HB.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/west-flash.pc> West_HBpc.txt 
 1072  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }'  West-HR.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/west-flash.pc> West_HRpc.txt 
 1073  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }'  East-HR.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/nai-flash.pc> East_HRpc.txt 
 1074  awk 'NR==FNR { n[$1]=$0;next } ($1 in n) { print n[$1],$0 }'  East-HB.txt /home/chebii/Awi-gen/FG_init_chou/sitewise/nai-flash.pc> East_HBpc.txt 
 1075  wc -l East_HBpc.txt West_HBpc.txt SA_HBpc.txt 
 1076  squeue -u chebii
 1077  ls
 1078  cd ..
 1079  ls
 1080  cd FI
 1081  cd FI-24/
 1082  ls
 1083  rm m.txt 
 1084  vi SA_withpc.txt
 1085  awk '{
    for (i = 1; i <= NF; i++) {
        if (!seen[i]) {
            if (!($i in cols)) {
                cols[$i] = i
                seen[i] = 1
                printf "%s%s", $i, (i == NF ? ORS : OFS)
            }
        }
    }
}' OFS="\t" SA_withpc.txt >m.txt
 1086  head -n 1 m.txt 
 1087  head -n 1 SA.txt 
 1088  head -n 1 FI.txt 
 1089  histort>format-files.sh
 1090  history>format-files.sh
