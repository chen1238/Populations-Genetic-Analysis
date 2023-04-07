#vcftools --vcf /media/rui/Huang/Z840-20210805/passvcf/0827.vcf --max-missing 0.9 --mac 1 --keep keep.txt --recode --out 4pop
./VCF2Dis-1.46/bin/VCF2Dis -InPut ./4pop.recode.vcf -SubPop keep.txt -OutPut auto


phylip neighbor
#select your OutPut file
