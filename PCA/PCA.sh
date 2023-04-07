vcftools --vcf /media/rui/Huang/Z840-20210805/passvcf/0827A.recode.vcf --max-missing 0.9 --mac 1 --keep keep.txt --recode --out 4pop

#py2
python ./vcf2eigenstrat.py -v ./4pop.recode.vcf -o 4pop
smartpca -p runningpca.conf.txt
