#SNP
gatk SelectVariants -V raw.vcf.gz -select-type SNP -O snp.vcf.gz
gatk VariantFiltration \
    -V snp.vcf.gz \
    --filter-expression "QUAL < 30 || QD < 2.0 || MQ < 40.0 || FS > 60.0 || SOR > 3.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" \
    --filter-name "Filter" \
    --cluster-window-size 10  --cluster-size 3 --missing-values-evaluate-as-failing \ 
    -O snp.filter.vcf

#INDEL
gatk SelectVariants -V raw.vcf.gz -select-type INDEL -O indel.vcf.gz
gatk VariantFiltration \
    -V indel.vcf.gz \
    --filter-expression "QUAL<30 || QD < 2.0 || FS > 200.0 || SOR > 10.0 || InbreedingCoeff < -0.8 || ReadPosRankSum < -20.0" \
    --filter-name "Filter" \
    -O indel.filter.vcf
