vcftools --vcf snps_filtered.vcf --recode --recode-INFO-all --maf 0.05 --max-missing 0.9 --out snp.vcftools.fil

# FST
vcftools --vcf snp.vcftools.fil.recode.vcf \
         --weir-fst-pop vu \
         --weir-fst-pop vs \
         --fst-window-size 50000 \
         --fst-window-step 10000 \
         --out fst_window1
# π
vcftools --vcf snp.vcftools.fil.recode.vcf  \
         --keep Vu1  \
         --window-pi 50000 \
         --window-pi-step 10000 \
         --out Vu_pi
vcftools --vcf snp.vcftools.fil.recode.vcf  \
         --keep Vs1  \
         --window-pi 50000 \
         --window-pi-step 10000 \
         --out Vs_pi
# PCA
VCF2PCACluster -InVCF snps_filtered.vcf -InSampleGroup group.info1.txt -InSubSample subsample.txt -OutPut cowpeapca_all
VCF2PCACluster -InVCF invSNP.recode.vcf -InSampleGroup group.info1.txt -InSubSample subsample.txt -OutPut cowpeapca_inv
